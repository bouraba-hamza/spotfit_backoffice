<?php

namespace App\Http\Controllers;

use App\Passpartout;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use DB;

class PasspartoutController extends Controller
{
    public function index()
    {
        return DB::table("passpartout")->get();
    }

    public function get($passpartout_id)
    {
       return Passpartout::findOrFail($passpartout_id);
    }

    public function getByIdGym($id_gym)
    {
       //return passpartout::findOrFail($coupon_id);
        return DB::table('passpartout')->where('id_gym', '=', $id_gym)->get();
    }

    public function store(Request $request)
    {

        $rules = [
            'class' => 'required',
            'prix' => 'required',
            'id_gym' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);

        if($validator->fails()) {
            return response()->json(["ok"=> 0, "error"=> $validator->errors()->first() ]);
        }

        Passpartout::create($request->all());

        return response()->json(["ok"=> 1, "feedback"=> "we generate a new resource for you" ]);

    }



    public function update(Request $request)
    {
        Passpartout::where("id", $request->get("id"))
            ->update($request->except(["id"]));

        return response()->json(["ok"=> 1, "feedback"=> "go to main page to see changes"]);
    }


    public function destroy($passpartout_id)
    {
        DB::table('passpartout')->where('id', '=', $passpartout_id)->delete();
        return ["ok" => 1, "feedback" => "the resource softly deleted, check the trash"];
    }
}
