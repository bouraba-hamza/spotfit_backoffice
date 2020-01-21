<?php


namespace App\Http\Controllers;


use App\Activitie;
use App\Repositories\ActivitieRepository;
use App\Http\Requests\ActivitieRequest;
use Illuminate\Http\Request;
use Validator;

class ActivitieController extends Controller
{



 /**
     * @var activitie
     */
    private $activitie;


    /**
     * activitieController constructor.
     * @param ActivitieRepository $ActivitieRepository
     */
    public function __construct(ActivitieRepository $activitieRepository)
    {
        $this->activitie = $activitieRepository;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
    return $this->activitie->all();

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
                       $activitie = $request->all();
                       
                       $validator = Validator::make($activitie, [
'name'=> 'required',
'icon'=> 'required',

                       ], ActivitieRequest::VALIDATION_MESSAGES);

                       if ($validator->fails()) {
                            return response()->json(['errors' => $validator->errors()->all()]);
                       }

                       $activitie_id = $this->activitie->insert($activitie)->id;
                       // return the id of the resource j
                      return ['activitie_id' => $activitie_id];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Activitie  $activitie
     * @return \Illuminate\Http\Response
     */
    public function show($activitie_id)
    {  
        return $this->activitie->find($activitie_id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Activitie  $activitie
     * @return \Illuminate\Http\Response
     */
    public function edit(Activitie $activitie)
    {
        //
    }

    /*
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Activitie  $activitie
     * @return \Illuminate\HttpResponse
     */
    public function update(Request $request, $activitie_id)
    {
       // check if the the requested resource exist in database
        $activitie = $this->activitie->find($activitie_id);
        $data = $request->all();

        $validator = Validator::make($data, [
'name'=> 'required',
'icon'=> 'required',

        ], ActivitieRequest::VALIDATION_MESSAGES);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }
 
        $this->activitie->update($activitie_id, $data);

        return ['activitie_id' => $activitie_id];
    }





    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Activitie  $activitie
     * @return \Illuminate\Http\Response
     */
    public function destroy($activitie_id)
    {
        $this->activitie->destroy($activitie_id);
        return ['status' => 'success', 'deleted_resource_id' => $activitie_id];
    }


}



