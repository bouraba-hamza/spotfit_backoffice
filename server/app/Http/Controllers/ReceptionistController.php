<?php

namespace App\Http\Controllers;

use App\Http\Requests\ReceptionistRequest;
use App\Repositories\ReceptionistRepository;
use App\Services\ProfileAvatarService;
use Illuminate\Http\Request;
use Validator;

class ReceptionistController extends Controller
{
    protected $receptionist;
    protected $profileAvatarService;

    public function __construct(ReceptionistRepository $receptionistRepository, ProfileAvatarService $profileAvatarService)
    {
        $this->receptionist = $receptionistRepository;
        $this->profileAvatarService = $profileAvatarService;
    }

    public function index()
    {
        return $this->receptionist->all();
    }

    public function store(ReceptionistRequest $request)
    {
        // filter unwanted inputs from request
        $receptionist = $request->all();

        // save the file in storage
        if ($request->hasFile("avatar")) {
            $receptionist["avatar"] = $this->profileAvatarService->store($request->file('avatar'))["fakeName"];
        }

        // create receptionist account
        $receptionist_id = $this->receptionist->insert($receptionist)->id;

        // return the id of the resource just created
        return ['receptionist_id' => $receptionist_id];
    }

    public function show($receptionist_id)
    {
        return $this->receptionist->find($receptionist_id);
    }

    public function update(Request $request, $receptionist_id)
    {
        // check if the the requested resource exist in database
        $receptionist = $this->receptionist->find($receptionist_id);
        $data = $request->all();

        $validator = Validator::make($data, [
            'gender' => 'in:m,f',
            'birthDay' => 'date_format:Y-m-d',
            'avatar' => 'image',
            'account.email' => "required|email|unique:accounts,email,{$receptionist->account->id}",
            'account.username' => "required|unique:accounts,username,{$receptionist->account->id}",
            'account.password' => 'min:6',
        ], ReceptionistRequest::VALIDATION_MESSAGES);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        if ($request->hasFile("avatar")) {
            $data["avatar"] = $this->profileAvatarService->update($receptionist->avatar, $request->file("avatar"))["fakeName"];
        }

        $this->receptionist->update($receptionist_id, $data);

        return ['receptionist_id' => $receptionist_id];
    }

    public function destroy($receptionist_id)
    {
        $this->receptionist->destroy($receptionist_id);
        return ['status' => 'success', 'deleted_resource_id' => $receptionist_id];
    }
}
