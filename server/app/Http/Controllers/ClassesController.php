<?php

namespace App\Http\Controllers;

use App\Classes;
use Illuminate\Http\Request;
use App\Repositories\ClassRepository;
use App\Services\ClassImageService;

class ClassesController extends Controller
{



 /**
     * @var class
     */
    private $class;
    protected $classImageService;


    /**
     * GroupController constructor.
     * @param ProjectsRepository $ProjectsRepository
     */
    public function __construct(ClassRepository $classRepository,ClassImageService $classImageService)
    {
        $this->class = $classRepository;

        $this->classImageService = $classImageService;

    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
    return $this->class->all();

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

                       // create partner account
                       $class_id = $this->class->insert($class)->id;

                       // return the id of the resource j
                      return ['class_id' => $class_id];

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Classes  $classes
     * @return \Illuminate\Http\Response
     */
    public function show(Classes $classes)
    {
       return $this->class->find($classes);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Classes  $classes
     * @return \Illuminate\Http\Response
     */
    public function edit(Classes $classes)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Classes  $classes
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Classes $classes)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Classes  $classes
     * @return \Illuminate\Http\Response
     */
    public function destroy(Classes $classes)
    {
        //
    }
}
