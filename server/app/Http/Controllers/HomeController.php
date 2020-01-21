<?php


namespace App\Http\Controllers;


use App\Home;
use App\Repositories\HomeRepository;
use App\Http\Requests\HomeRequest;
use Illuminate\Http\Request;
use Validator;

class HomeController extends Controller
{



 /**
     * @var home
     */
    private $home;


    /**
     * homeController constructor.
     * @param HomeRepository $HomeRepository
     */
    public function __construct(HomeRepository $homeRepository)
    {
        $this->home = $homeRepository;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
    return $this->home->all();

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
                       $home = $request->all();
                       
                       $validator = Validator::make($home, [
''=> 'required',

                       ], HomeRequest::VALIDATION_MESSAGES);

                       if ($validator->fails()) {
                            return response()->json(['errors' => $validator->errors()->all()]);
                       }

                       $home_id = $this->home->insert($home)->id;
                       // return the id of the resource j
                      return ['home_id' => $home_id];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Home  $home
     * @return \Illuminate\Http\Response
     */
    public function show($home_id)
    {  
        return $this->home->find($home_id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Home  $home
     * @return \Illuminate\Http\Response
     */
    public function edit(Home $home)
    {
        //
    }

    /*
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Home  $home
     * @return \Illuminate\HttpResponse
     */
    public function update(Request $request, $home_id)
    {
       // check if the the requested resource exist in database
        $home = $this->home->find($home_id);
        $data = $request->all();

        $validator = Validator::make($data, [
''=> 'required',

        ], HomeRequest::VALIDATION_MESSAGES);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }
 
        $this->home->update($home_id, $data);

        return ['home_id' => $home_id];
    }





    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Home  $home
     * @return \Illuminate\Http\Response
     */
    public function destroy($home_id)
    {
        $this->home->destroy($home_id);
        return ['status' => 'success', 'deleted_resource_id' => $home_id];
    }


}



