<?php

namespace App\Http\Controllers;

use App\Http\Requests\PartnerRequest;
use App\Repositories\CustomerRepository;
use App\Services\ProfileAvatarService;
use Illuminate\Http\Request;
use Validator;

class PartnerController extends Controller
{
    protected $partner;
    protected $profileAvatarService;

    public function __construct(CustomerRepository $partnerRepository, ProfileAvatarService $profileAvatarService)
    {
        $this->partner = $partnerRepository;
        $this->profileAvatarService = $profileAvatarService;
    }

    public function index()
    {
        return $this->partner->all();
    }

    public function store(PartnerRequest $request)
    {
        // filter unwanted inputs from request
        $partner = $request->all();

        // save the file in storage
        if ($request->hasFile("avatar")) {
            $partner["avatar"] = $this->profileAvatarService->store($request->file('avatar'))["fakeName"];
        }

        // create partner account
        $partner_id = $this->partner->insert($partner)->id;

        // return the id of the resource just created
        return ['partner_id' => $partner_id];
    }

    public function show($partner_id)
    {
        return $this->partner->find($partner_id);
    }

    public function update(Request $request, $partner_id)
    {
        // check if the the requested resource exist in database
        $partner = $this->partner->find($partner_id);
        $data = $request->all();

        $validator = Validator::make($data, [
            'gender' => 'in:m,f',
            'birthDay' => 'date_format:Y-m-d',
            'avatar' => 'image',
            'account.email' => "required|email|unique:accounts,email,{$partner->account->id}",
            'account.username' => "required|unique:accounts,username,{$partner->account->id}",
            'account.password' => 'min:6',
        ], PartnerRequest::VALIDATION_MESSAGES);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        if ($request->hasFile("avatar")) {
            $data["avatar"] = $this->profileAvatarService->update($partner->avatar, $request->file("avatar"))["fakeName"];
        }

        $this->partner->update($partner_id, $data);

        return ['partner_id' => $partner_id];
    }

    public function destroy($partner_id)
    {
        $this->partner->destroy($partner_id);
        return ['status' => 'success', 'deleted_resource_id' => $partner_id];
    }
}
