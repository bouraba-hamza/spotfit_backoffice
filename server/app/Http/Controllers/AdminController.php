<?php

namespace App\Http\Controllers;

use App\Admin;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function index()
    {
        return Admin::all();
    }

    public function store(Request $request)
    {
        $validator = \Validator::make($request->all(), [
            'gender' => 'in:m,f',
            'birthDay' => 'date_format:Y-m-d',
            'avatar' => 'image',
        ])->validate();

        if ($validator->fails()) {
            return response()->json($validator->errors()->json());
        }

        return [1];

    }

    public function show($admin_id)
    {
        $admin = Admin::findOrFail($admin_id);
        return $admin;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Admin  $admin
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Admin $admin)
    {
        //
    }

    public function destroy($admin_id)
    {
        $admin = Admin::findOrFail($admin_id);
        $admin->delete();
        return ['status' => 'success', 'deleted_resource_id' => $admin->id ];
    }
}
