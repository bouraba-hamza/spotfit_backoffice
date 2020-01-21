<?php


namespace App\Http\Controllers;


use App\Facilitie;
use App\Repositories\FacilitieRepository;
use App\Http\Requests\FacilitieRequest;
use App\Services\FacilitieService;
use Illuminate\Http\Request;
use Validator;

class FacilitieController extends Controller
{


    /**
     * @var facilitie
     */
    private $facilitie;
    protected $facilitieService;

    /**
     * facilitieController constructor.
     * @param FacilitieRepository $FacilitieRepository
     */
    public function __construct(FacilitieRepository $facilitieRepository, FacilitieService $facilitieService)
    {
        $this->facilitie = $facilitieRepository;

        $this->facilitieService = $facilitieService;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        return $this->facilitie->all();

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
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // filter unwanted inputs from request
        $facilitie = $request->all();

        if ($request->hasFile("icon")) {
            $facilitie["icon"] = $this->facilitieService->store($request->file('icon'))["fakeName"];
        }


        $validator = Validator::make($facilitie, [
            'name' => 'required',
            'order' => 'required',

        ], FacilitieRequest::VALIDATION_MESSAGES);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        $facilitie_id = $this->facilitie->insert($facilitie)->id;
        // return the id of the resource j
        return ['facilitie_id' => $facilitie_id];
    }

    /**
     * Display the specified resource.
     *
     * @param \App\Facilitie $facilitie
     * @return \Illuminate\Http\Response
     */
    public function show($facilitie_id)
    {
        return $this->facilitie->find($facilitie_id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\Facilitie $facilitie
     * @return \Illuminate\Http\Response
     */
    public function edit(Facilitie $facilitie)
    {
        //
    }

    /*
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Facilitie  $facilitie
     * @return \Illuminate\HttpResponse
     */
    public function update(Request $request, $facilitie_id)
    {
        // check if the the requested resource exist in database
        $facilitie = $this->facilitie->find($facilitie_id);
        $data = $request->all();

        $validator = Validator::make($data, [
            'icon' => 'required',
            'name' => 'required',
            'order' => 'required',

        ], FacilitieRequest::VALIDATION_MESSAGES);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        $this->facilitie->update($facilitie_id, $data);

        return ['facilitie_id' => $facilitie_id];
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Facilitie $facilitie
     * @return \Illuminate\Http\Response
     */
    public function destroy($facilitie_id)
    {
        $this->facilitie->destroy($facilitie_id);
        return ['status' => 'success', 'deleted_resource_id' => $facilitie_id];
    }


}



