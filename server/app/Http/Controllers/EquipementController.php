<?php


namespace App\Http\Controllers;


use App\Equipement;
use App\Repositories\EquipementRepository;
use App\Http\Requests\EquipementRequest;
use Illuminate\Http\Request;
use Validator;

class EquipementController extends Controller
{



 /**
     * @var equipement
     */
    private $equipement;


    /**
     * equipementController constructor.
     * @param EquipementRepository $EquipementRepository
     */
    public function __construct(EquipementRepository $equipementRepository)
    {
        $this->equipement = $equipementRepository;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
    return $this->equipement->all();

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
                       $equipement = $request->all();
                       
                       $validator = Validator::make($equipement, [
'libelle'=> 'required',
'rate'=> 'required',
'gym_id'=> 'required',

                       ], EquipementRequest::VALIDATION_MESSAGES);

                       if ($validator->fails()) {
                            return response()->json(['errors' => $validator->errors()->all()]);
                       }

                       $equipement_id = $this->equipement->insert($equipement)->id;
                       // return the id of the resource j
                      return ['equipement_id' => $equipement_id];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Equipement  $equipement
     * @return \Illuminate\Http\Response
     */
    public function show($equipement_id)
    {  
        return $this->equipement->find($equipement_id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Equipement  $equipement
     * @return \Illuminate\Http\Response
     */
    public function edit(Equipement $equipement)
    {
        //
    }

    /*
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Equipement  $equipement
     * @return \Illuminate\HttpResponse
     */
    public function update(Request $request, $equipement_id)
    {
       // check if the the requested resource exist in database
        $equipement = $this->equipement->find($equipement_id);
        $data = $request->all();

        $validator = Validator::make($data, [
'libelle'=> 'required',
'rate'=> 'required',
'gym_id'=> 'required',

        ], EquipementRequest::VALIDATION_MESSAGES);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }
 
        $this->equipement->update($equipement_id, $data);

        return ['equipement_id' => $equipement_id];
    }





    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Equipement  $equipement
     * @return \Illuminate\Http\Response
     */
    public function destroy($equipement_id)
    {
        $this->equipement->destroy($equipement_id);
        return ['status' => 'success', 'deleted_resource_id' => $equipement_id];
    }


}



