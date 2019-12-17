<?php

namespace App\Http\Controllers;

use App\Http\Requests\TrainerRequest;
use App\Repositories\TrainerRepository;
use App\Services\ProfileAvatarService;
use Illuminate\Http\Request;
use Validator;

class TrainerController extends Controller
{
    protected $trainer;
    protected $profileAvatarService;

    public function __construct(TrainerRepository $trainerRepository, ProfileAvatarService $profileAvatarService)
    {
        $this->trainer = $trainerRepository;
        $this->profileAvatarService = $profileAvatarService;
    }

    public function index()
    {
        return $this->trainer->all();
    }

    public function store(TrainerRequest $request)
    {
        // filter unwanted inputs from request
        $trainer = $request->all();

        // save the file in storage
        if ($request->hasFile("avatar")) {
            $trainer["avatar"] = $this->profileAvatarService->store($request->file('avatar'))["fakeName"];
        }

        // create trainer account
        $trainer_id = $this->trainer->insert($trainer)->id;

        // return the id of the resource just created
        return ['trainer_id' => $trainer_id];
    }

    public function show($trainer_id)
    {
        return $this->trainer->find($trainer_id);
    }

    public function update(Request $request, $trainer_id)
    {
        // check if the the requested resource exist in database
        $trainer = $this->trainer->find($trainer_id);
        $data = $request->all();

        $validator = Validator::make($data, [
            'gender' => 'in:m,f',
            'birthDay' => 'date_format:Y-m-d',
            'avatar' => 'image',
            'account.email' => "required|email|unique:accounts,email,{$trainer->account->id}",
            'account.username' => "required|unique:accounts,username,{$trainer->account->id}",
            'account.password' => 'min:6',
        ], TrainerRequest::VALIDATION_MESSAGES);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        if ($request->hasFile("avatar")) {
            $data["avatar"] = $this->profileAvatarService->update($trainer->avatar, $request->file("avatar"))["fakeName"];
        }

        $this->trainer->update($trainer_id, $data);

        return ['trainer_id' => $trainer_id];
    }

    public function destroy($trainer_id)
    {
        $this->trainer->destroy($trainer_id);
        return ['status' => 'success', 'deleted_resource_id' => $trainer_id];
    }
}
