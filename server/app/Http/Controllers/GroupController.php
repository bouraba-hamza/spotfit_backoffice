<?php


namespace App\Http\Controllers;


use App\Group;
use App\Repositories\GroupRepository;
use App\Http\Requests\GroupRequest;
use Illuminate\Http\Request;
use Validator;

class GroupController extends Controller
{



 /**
     * @var group
     */
    private $group;


    /**
     * groupController constructor.
     * @param GroupRepository $GroupRepository
     */
    public function __construct(GroupRepository $groupRepository)
    {
        $this->group = $groupRepository;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
    return $this->group->all();

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
                       $group = $request->all();
                       
                       $validator = Validator::make($group, [
'name'=> 'required',
'partner_id'=> 'required',

                       ], GroupRequest::VALIDATION_MESSAGES);

                       if ($validator->fails()) {
                            return response()->json(['errors' => $validator->errors()->all()]);
                       }

                       $group_id = $this->group->insert($group)->id;
                       // return the id of the resource j
                      return ['group_id' => $group_id];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Group  $group
     * @return \Illuminate\Http\Response
     */
    public function show($group_id)
    {  
        return $this->group->find($group_id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Group  $group
     * @return \Illuminate\Http\Response
     */
    public function edit(Group $group)
    {
        //
    }

    /*
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Group  $group
     * @return \Illuminate\HttpResponse
     */
    public function update(Request $request, $group_id)
    {
       // check if the the requested resource exist in database
        $group = $this->group->find($group_id);
        $data = $request->all();

        $validator = Validator::make($data, [
'name'=> 'required',
'partner_id'=> 'required',

        ], GroupRequest::VALIDATION_MESSAGES);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }
 
        $this->group->update($group_id, $data);

        return ['group_id' => $group_id];
    }





    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Group  $group
     * @return \Illuminate\Http\Response
     */
    public function destroy($group_id)
    {
        $this->group->destroy($group_id);
        return ['status' => 'success', 'deleted_resource_id' => $group_id];
    }


}



