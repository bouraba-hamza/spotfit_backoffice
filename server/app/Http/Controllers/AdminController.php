<?php

namespace App\Http\Controllers;

use App\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Validator;

class AdminController extends Controller
{
    public function index()
    {
        return Admin::all();
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'gender' => 'in:m,f',
            'birthDay' => 'date_format:Y-m-d',
            'avatar' => 'image',
            'account_id' => 'required|exists:accounts,id',
            'address_id' => 'exists:addresses,id',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        $admin = $request->only(['firstName', 'lastName', 'gender', 'birthDay', 'phoneNumber', 'jobTitle', 'avatar', 'account_id', 'address_id']);

        if ($request->hasFile("avatar")) {

            $avatar = $request->file('avatar');
            
            $fake_name = Str::slug(Str::random(7) . '_' . $avatar->getClientOriginalName());;

            $path = \Storage::putFileAs(
                'avatars', $avatar, $fake_name
            );

            $admin["avatar"] = $fake_name;
        }

        return ['admin_id' => Admin::create($admin)->id];
    }

    public function show($admin_id)
    {
        $admin = Admin::findOrFail($admin_id);
        return $admin;
    }

    public function update(Request $request, $admin_id)
    {
        $resource = Admin::findOrFail($admin_id);
        
        $validator = Validator::make($request->all(), [
            'gender' => 'in:m,f',
            'birthDay' => 'date_format:Y-m-d',
            'avatar' => 'image',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        $admin = $request->only(['firstName', 'lastName', 'gender', 'birthDay', 'phoneNumber', 'jobTitle', 'avatar', 'account_id', 'address_id']);

        if ($request->hasFile("avatar")) {

            // delete the old avatar
            \Storage::delete('avatars/' . $resource->avatar);

            // save the the received photo
            $avatar = $request->file('avatar');

            // generate a random name
            $fake_name = Str::slug(Str::random(7) . '_' . $avatar->getClientOriginalName(), '.');

            $path = \Storage::putFileAs(
                'avatars', $avatar, $fake_name
            );

            $admin["avatar"] = $fake_name;
        }


        Admin::where("id", $admin_id)
                ->update($admin);

        

        return ['admin_id' => $admin_id];
    }

    public function destroy($admin_id)
    {
        $admin = Admin::findOrFail($admin_id);
        $admin->delete();
        return ['status' => 'success', 'deleted_resource_id' => $admin->id];
    }
}
