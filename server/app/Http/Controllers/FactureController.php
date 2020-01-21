<?php

namespace App\Http\Controllers;


use App\Facture;
use App\Repositories\FactureRepository;
use App\Http\Requests\FactureRequest;
use Illuminate\Http\Request;
use Validator;

class FactureController extends Controller
{



 /**
     * @var facture
     */
    private $facture;


    /**
     * factureController constructor.
     * @param FactureRepository $FactureRepository
     */
    public function __construct(FactureRepository $factureRepository)
    {
        $this->facture = $factureRepository;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
    return $this->facture->all();

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
                       $facture = $request->all();
                       
                       $validator = Validator::make($facture, [
'libele'=> 'required',
'montant'=> 'required',

                       ], FactureRequest::VALIDATION_MESSAGES);

                       if ($validator->fails()) {
                            return response()->json(['errors' => $validator->errors()->all()]);
                       }

                       $facture_id = $this->facture->insert($facture)->id;
                       // return the id of the resource j
                      return ['facture_id' => $facture_id];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Facture  $facture
     * @return \Illuminate\Http\Response
     */
    public function show($facture_id)
    {  
        return $this->facture->find($facture_id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Facture  $facture
     * @return \Illuminate\Http\Response
     */
    public function edit(Facture $facture)
    {
        //
    }

    /*
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Facture  $facture
     * @return \Illuminate\HttpResponse
     */
    public function update(Request $request, $facture_id)
    {
       // check if the the requested resource exist in database
        $facture = $this->facture->find($facture_id);
        $data = $request->all();

        $validator = Validator::make($data, [
'libele'=> 'required',
'montant'=> 'required',

        ], FactureRequest::VALIDATION_MESSAGES);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }
 
        $this->facture->update($facture_id, $data);

        return ['facture_id' => $facture_id];
    }





    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Facture  $facture
     * @return \Illuminate\Http\Response
     */
    public function destroy($facture_id)
    {
        $this->facture->destroy($facture_id);
        return ['status' => 'success', 'deleted_resource_id' => $facture_id];
    }


}



