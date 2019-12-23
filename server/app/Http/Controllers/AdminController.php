<?php

namespace App\Http\Controllers;

use App\Http\Requests\AdminRequest;
use App\Repositories\AdminRepository;
use App\Services\ProfileAvatarService;
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Log;

class AdminController extends Controller
{
    protected $admin;
    protected $profileAvatarService;

    public function __construct(AdminRepository $adminRepository, ProfileAvatarService $profileAvatarService)
    {
        $this->admin = $adminRepository;
        $this->profileAvatarService = $profileAvatarService;
    }

    public function index()
    {

        return $this->admin->all();
    }

    public function store(AdminRequest $request)
    {
        // filter unwanted inputs from request
        $admin = $request->all();

        // save the file in storage
        if ($request->hasFile("avatar")) {
            $admin["avatar"] = $this->profileAvatarService->store($request->file('avatar'))["fakeName"];
        }

        // create admin account
        $admin_id = $this->admin->insert($admin)->id;

        // return the id of the resource just created
        return ['admin_id' => $admin_id];
    }

    public function show($admin_id)
    {
        return $this->admin->find($admin_id);
    }

    public function update(Request $request, $admin_id)
    {
        // check if the the requested resource exist in database
        $admin = $this->admin->find($admin_id);
        $data = $request->all();

        $validator = Validator::make($data, [
            'gender' => 'in:m,f',
            'birthDay' => 'date_format:Y-m-d',
            'avatar' => 'image',
            'account.email' => "required|email|unique:accounts,email,{$admin->account->id}",
            'account.username' => "required|unique:accounts,username,{$admin->account->id}",
            'account.password' => 'min:6',
        ], AdminRequest::VALIDATION_MESSAGES);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        if ($request->hasFile("avatar")) {
            $data["avatar"] = $this->profileAvatarService->update($admin->avatar, $request->file("avatar"))["fakeName"];
        }

        $this->admin->update($admin_id, $data);

        return ['admin_id' => $admin_id];
    }

    public function destroy($admin_id)
    {
        $this->admin->destroy($admin_id);
        return ['status' => 'success', 'deleted_resource_id' => $admin_id];
    }
}
