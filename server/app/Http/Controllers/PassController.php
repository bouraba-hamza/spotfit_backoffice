<?php

namespace App\Http\Controllers;

use App\Pass;
use Illuminate\Http\Request;
use App\Repositories\PassRepository;
use App\Services\PassImageService;
use Illuminate\Support\Facades\Log;

class PassController extends Controller
{

    /**
     * @var Pass
     */
    private $pass;
    protected $passImageService;


    /**
     * GroupController constructor.
     * @param ProjectsRepository $ProjectsRepository
     */
    public function __construct(PassRepository $PassRepository,PassImageService $passImageService)
    {
        $this->pass = $PassRepository;

        $this->passImageService = $passImageService;

    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       return $this->pass->all();
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
                $pass = $request->all();
                \Log::info($pass);
//                 \Log::info($request->hasFile("image"));
                // save the file in storage
                if ($request->hasFile("image")) {

                    $pass["image"] = $this->passImageService->store($request->file('image'))["fakeName"];
                }

                // create partner account
                $pass_id = $this->pass->insert($pass)->id;

                // return the id of the resource just created
                return ['pass_id' => $pass_id];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Pass  $pass
     * @return \Illuminate\Http\Response
     */
    public function show(Pass $pass)
    {
        return $this->pass->find($pass);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Pass  $pass
     * @return \Illuminate\Http\Response
     */
    public function edit(Pass $pass)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Pass  $pass
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Pass $pass)
    {
         // check if the the requested resource exist in database
                $pass = $this->pass->find($pass);
                $data = $request->all();
         //Todo control de validation

                if ($request->hasFile("image")) {
                    $data["image"] = $this->passImageService->update($pass->image, $request->file("image"))["fakeName"];
                }

                $updated=$this->partner->update($pass, $data);

                 if(!$updated) return ['errors' => "somme problems"];


                return ['pass_id' => $pass];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Pass  $pass
     * @return \Illuminate\Http\Response
     */
    public function destroy(Pass $pass)
    {

    $this->partner->destroy($pass);

    return ['status' => 'success', 'deleted_resource_id' => $pass];

    }
}
