<?php


namespace App\Http\Controllers;


use App\Base64ToPng;
use App\Repositories\Base64ToPngRepository;
use App\Http\Requests\Base64ToPngRequest;
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Log;

class Base64ToPngController extends Controller
{



 /**
     * @var base64ToPng
     */
    private $base64ToPng;


    /**
     * base64ToPngController constructor.
     * @param Base64ToPngRepository $Base64ToPngRepository
     */
    public function __construct(Base64ToPngRepository $base64ToPngRepository)
    {
        $this->base64ToPng = $base64ToPngRepository;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
    return $this->base64ToPng->all();

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
    public function store(Base64ToPngRequest $request)
    {
       // \Log::info('request: \n');
      //  \Log::info($request);
      //  \Log::info('------------ \n');

                      // filter unwanted inputs from request
                       $base64ToPng = $request->all();

                    //   \Log::info('------------ \n');
                     // \Log::info($request);
                     //  \Log::info($request->get('name'));
                     //  \Log::info('------------ \n');

                       $validator = Validator::make($base64ToPng, [
'name'=> 'required',
'code'=> 'required',
                       ], Base64ToPngRequest::VALIDATION_MESSAGES);

                       if ($validator->fails()) {
                            return response()->json(['errors' => $validator->errors()->all()]);
                       }

                       // save image phisyquement
                       $name = $request->get('name');
                       $data = $request->get('code');
                       $data = base64_decode($data);

                       // Extract base64 file for standard data
                       $fileBin = file_get_contents($data);
                       $mimeType = mime_content_type($data);
                       // Check allowed mime type
                       if ('image/png'==$mimeType) {
                           file_put_contents('uploads/img/'.$name, $fileBin);
                       }

                       Log::info('file_put_contents img OK \n');
                      // Log::info($data.'\n');


                      // erase $base64ToPng.code
                      // $request->get['code'] = '';
                      // $base64ToPng = $request->all();
                       //$request['inputname'] = 'newValue';

                       $base64ToPng['code'] = '';  // fichier et guid générés .. vider zttr code pour allerger bd ...
                       $base64ToPng_id = $this->base64ToPng->insert($base64ToPng)->id;
                       // return the id of the resource j


                     //  \Log::info('base64ToPng_id \n');
                   //    \Log::info($base64ToPng_id.'\n');

                      return ['name' => $name];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Base64ToPng  $base64ToPng
     * @return \Illuminate\Http\Response
     */
    public function show($base64ToPng_id)
    {
        return $this->base64ToPng->find($base64ToPng_id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Base64ToPng  $base64ToPng
     * @return \Illuminate\Http\Response
     */
    public function edit(Base64ToPng $base64ToPng)
    {
        //
    }

    /*
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Base64ToPng  $base64ToPng
     * @return \Illuminate\HttpResponse
     */
    public function update(Request $request, $base64ToPng_id)
    {
       // check if the the requested resource exist in database
        $base64ToPng = $this->base64ToPng->find($base64ToPng_id);
        $data = $request->all();

        $validator = Validator::make($data, [
'name'=> 'required',
'code'=> 'required',

        ], Base64ToPngRequest::VALIDATION_MESSAGES);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        $this->base64ToPng->update($base64ToPng_id, $data);

        return ['base64ToPng_id' => $base64ToPng_id];
    }





    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Base64ToPng  $base64ToPng
     * @return \Illuminate\Http\Response
     */
    public function destroy($base64ToPng_id)
    {
        $this->base64ToPng->destroy($base64ToPng_id);
        return ['status' => 'success', 'deleted_resource_id' => $base64ToPng_id];
    }


}



