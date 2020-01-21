<?php


namespace App\Http\Controllers;


use App\Classe;
use App\Repositories\ClasseRepository;
use App\Services\ClassImageService;
use App\Http\Requests\ClasseRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Validator;

class ClasseController extends Controller
{



 /**
     * @var classe
     */
    private $classe;

    protected $classImageService;

    /**
     * classeController constructor.
     * @param ClasseRepository $ClasseRepository
     */
    public function __construct(ClasseRepository $classeRepository, ClassImageService $classImageService)
    {
        $this->classe = $classeRepository;
        $this->classImageService = $classImageService;

    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
  //  return $this->classe->all();

        $classData = $this->classe->all();



        foreach($classData as $key => $oneData){

            $photo = $oneData->image;

            if($photo) {
                $slices = explode('.', $photo);
                $ext = end($slices);
                $content = Storage::get('class/' . $photo);
                $encoded_content = base64_encode($content);
                $imageData = 'data:' . 'image/' . $ext  . ';base64,' . $encoded_content;
                $classData[$key]->photo= $imageData;
            } else {
                $imageData = false;
            }

        }


        return $classData;

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


        $class = $request->all();
        // save the file in storage
        if ($request->hasFile("image")) {
            $class["image"] = $this->classImageService->store($request->file('image'))["fakeName"];
        }

        // Todo create class_pass row
        $class_pass = $this->classe->insert($class);

        if($passe_with_price = $request->get('passes'))
        {
            foreach ($passe_with_price as $passe_price_id => $priceAttach)
            {
                    if($priceAttach) $class_pass->subscription()->attach($priceAttach['passid'], ['prix_min' => $priceAttach['prix_min'], 'prix_max' => $priceAttach['prix_max']]);

            }
        }

        return ['class_id' => $class_pass->id];

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



