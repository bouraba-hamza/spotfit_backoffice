<?php


namespace App\Http\Controllers;


use App\Classe;
use App\Repositories\ClasseRepository;
use App\Http\Requests\ClasseRequest;
use Illuminate\Http\Request;
use Validator;

class ClasseController extends Controller
{



 /**
     * @var classe
     */
    private $classe;


    /**
     * classeController constructor.
     * @param ClasseRepository $ClasseRepository
     */
    public function __construct(ClasseRepository $classeRepository)
    {
        $this->classe = $classeRepository;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
    return $this->classe->all();

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
                       $classe = $request->all();
                       
                       $validator = Validator::make($classe, [
'name'=> 'required',
'image'=> 'required',
'prix_min'=> 'required',
'prix_max'=> 'required',

                       ], ClasseRequest::VALIDATION_MESSAGES);

                       if ($validator->fails()) {
                            return response()->json(['errors' => $validator->errors()->all()]);
                       }

                       $classe_id = $this->classe->insert($classe)->id;
                       // return the id of the resource j
                      return ['classe_id' => $classe_id];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Classe  $classe
     * @return \Illuminate\Http\Response
     */
    public function show($classe_id)
    {  
        return $this->classe->find($classe_id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Classe  $classe
     * @return \Illuminate\Http\Response
     */
    public function edit(Classe $classe)
    {
        //
    }

    /*
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Classe  $classe
     * @return \Illuminate\HttpResponse
     */
    public function update(Request $request, $classe_id)
    {
       // check if the the requested resource exist in database
        $classe = $this->classe->find($classe_id);
        $data = $request->all();

        $validator = Validator::make($data, [
'name'=> 'required',
'image'=> 'required',
'prix_min'=> 'required',
'prix_max'=> 'required',

        ], ClasseRequest::VALIDATION_MESSAGES);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }
 
        $this->classe->update($classe_id, $data);

        return ['classe_id' => $classe_id];
    }





    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Classe  $classe
     * @return \Illuminate\Http\Response
     */
    public function destroy($classe_id)
    {
        $this->classe->destroy($classe_id);
        return ['status' => 'success', 'deleted_resource_id' => $classe_id];
    }


}



