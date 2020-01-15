<?php


namespace App\Http\Controllers;


use App\Gym;
use App\Repositories\GymRepository;
use App\Http\Requests\GymRequest;
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Log;

class GymController extends Controller
{



 /**
     * @var gym
     */
    private $gym;


    /**
     * gymController constructor.
     * @param GymRepository $GymRepository
     */
    public function __construct(GymRepository $gymRepository)
    {
        $this->gym = $gymRepository;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
    return $this->gym->all();

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // filter unwanted inputs from request
                       $gym = $request->all();

                       $validator = Validator::make($gym, [
'group_id'=> 'required',
'logo'=> 'required',
'name'=> 'required',
'rate'=> 'required',
'qrcode'=> 'required',
'class_id'=> 'required',
'facilities'=> 'required',
'planning'=> 'required',
'file' => 'required|image|mimes:jpeg,png,jpg,bmp,gif,svg|max:2048'

                       ], GymRequest::VALIDATION_MESSAGES);

                       if ($validator->fails()) {
                            return response()->json(['errors' => $validator->errors()->all()]);
                       }


      if ($request->hasFile('file')) {
        $image = $request->file('file');
        $qrcode = $request->get('qrcode');
        // $name = time().'.'.$image->getClientOriginalExtension();
        $destinationPath = public_path('uploads/logo/');
        $image->move($destinationPath, 'gymLogo_'.$qrcode.'.'.$image->getClientOriginalExtension() );


        $gym['logo'] = 'gymLogo_'.$qrcode.'.'.$image->getClientOriginalExtension() ;
    }

   $gym_id = $this->gym->insert($gym)->id;
   //todo insert group_subscription_type
   // return the id of the resource j
    return ['gym_id' => $gym_id];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Gym  $gym
     * @return \Illuminate\Http\Response
     */
    public function show($gym_id)
    {
        return $this->gym->find($gym_id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Gym  $gym
     * @return \Illuminate\Http\Response
     */
    public function edit(Gym $gym)
    {
        //
    }

    /*
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Gym  $gym
     * @return \Illuminate\HttpResponse
     */
    public function update(Request $request, $gym_id)
    {
       // check if the the requested resource exist in database
        $gym = $this->gym->find($gym_id);
        $data = $request->all();

        $validator = Validator::make($data, [
'group_id'=> 'required',
'logo'=> 'required',
'name'=> 'required',
'rate'=> 'required',
'qrcode'=> 'required',
'class_id'=> 'required',
'facilities'=> 'required',
'planning'=> 'required',

        ], GymRequest::VALIDATION_MESSAGES);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        $this->gym->update($gym_id, $data);

        return ['gym_id' => $gym_id];
    }





    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Gym  $gym
     * @return \Illuminate\Http\Response
     */
    public function destroy($gym_id)
    {
        $this->gym->destroy($gym_id);
        return ['status' => 'success', 'deleted_resource_id' => $gym_id];
    }



}



