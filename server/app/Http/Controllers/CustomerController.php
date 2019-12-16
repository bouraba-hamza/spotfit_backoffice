<?php

namespace App\Http\Controllers;

use App\Http\Requests\CustomerRequest;
use App\Repositories\CustomerRepository;
use App\Services\ProfileAvatarService;
use Illuminate\Http\Request;
use Validator;

class CustomerController extends Controller
{
    protected $customer;
    protected $profileAvatarService;

    public function __construct(CustomerRepository $customerRepository, ProfileAvatarService $profileAvatarService)
    {
        $this->customer = $customerRepository;
        $this->profileAvatarService = $profileAvatarService;
    }

    public function index()
    {
        return $this->customer->all();
    }

    public function store(CustomerRequest $request)
    {
        // filter unwanted inputs from request
        $customer = $request->all();

        // save the file in storage
        if ($request->hasFile("avatar")) {
            $customer["avatar"] = $this->profileAvatarService->store($request->file('avatar'))["fakeName"];
        }

        // create customer account
        $customer_id = $this->customer->insert($customer)->id;

        // return the id of the resource just created
        return ['customer_id' => $customer_id];
    }

    public function show($customer_id)
    {
        return $this->customer->find($customer_id);
    }

    public function update(Request $request, $customer_id)
    {
        // check if the the requested resource exist in database
        $customer = $this->customer->find($customer_id);
        $data = $request->all();

        $validator = Validator::make($data, [
            'gender' => 'in:m,f',
            'birthDay' => 'date_format:Y-m-d',
            'avatar' => 'image',
            'account.email' => "required|email|unique:accounts,email,{$customer->account->id}",
            'account.username' => "required|unique:accounts,username,{$customer->account->id}",
            'account.password' => 'min:6',
        ], CustomerRequest::VALIDATION_MESSAGES);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        if ($request->hasFile("avatar")) {
            $data["avatar"] = $this->profileAvatarService->update($customer->avatar, $request->file("avatar"))["fakeName"];
        }

        $this->customer->update($customer_id, $data);

        return ['customer_id' => $customer_id];
    }

    public function destroy($customer_id)
    {
        $this->customer->destroy($customer_id);
        return ['status' => 'success', 'deleted_resource_id' => $customer_id];
    }
}
