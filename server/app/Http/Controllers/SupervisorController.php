<?php

namespace App\Http\Controllers;

use App\Http\Requests\SupervisorRequest;
use App\Repositories\SupervisorRepository;
use App\Services\ProfileAvatarService;
use Illuminate\Http\Request;
use JasonGuru\LaravelMakeRepository\Repository\BaseRepository;
use Validator;

class SupervisorController extends Controller
{
    protected $supervisor;
    protected $profileAvatarService;

    public function __construct(SupervisorRepository $supervisorRepository, ProfileAvatarService $profileAvatarService)
    {
        $this->supervisor = $supervisorRepository;
        $this->profileAvatarService = $profileAvatarService;
    }

    public function index()
    {
        return $this->supervisor->all();
    }

    public function store(SupervisorRequest $request)
    {

        $gym_id = $request->get("gym_id");
        if(\App\Gym::find($gym_id)->supervisor()->count())
            return response()->json(['errors' => ["la salle de sport ne peut pas avoir plusieurs réceptionnistes."]]);

        // filter unwanted inputs from request
        $supervisor = $request->all();

        // save the file in storage
        if ($request->hasFile("avatar")) {
            $supervisor["avatar"] = $this->profileAvatarService->store($request->file('avatar'))["fakeName"];
        }

        // create supervisor account
        $supervisor_id = $this->supervisor->insert($supervisor)->id;

        // return the id of the resource just created
        return ['supervisor_id' => $supervisor_id];
    }

    public function show($supervisor_id)
    {
        return $this->supervisor->find($supervisor_id);
    }

    public function update(Request $request, $supervisor_id)
    {
        // check if the the requested resource exist in database
        $supervisor = $this->supervisor->find($supervisor_id);
        $data = $request->all();

        $validator = Validator::make($data, [
            'gender' => 'in:m,f',
            'birthDay' => 'date_format:Y-m-d',
            'avatar' => 'image',
            'gym_id' => "required|numeric|unique:supervisors,gym_id,{$supervisor->gym_id}",
            'account.email' => "required|email|unique:accounts,email,{$supervisor->account->id}",
            'account.username' => "required|unique:accounts,username,{$supervisor->account->id}",
            'account.password' => 'min:6',
        ], SupervisorRequest::VALIDATION_MESSAGES);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        if ($request->hasFile("avatar")) {
            $data["avatar"] = $this->profileAvatarService->update($supervisor->avatar, $request->file("avatar"))["fakeName"];
        }

        $this->supervisor->update($supervisor_id, $data);

        return ['supervisor_id' => $supervisor_id];
    }

    public function destroy($supervisor_id)
    {
        $this->supervisor->destroy($supervisor_id);
        return ['status' => 'success', 'deleted_resource_id' => $supervisor_id];
    }
}
