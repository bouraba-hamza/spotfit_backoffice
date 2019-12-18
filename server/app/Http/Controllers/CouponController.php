<?php

namespace App\Http\Controllers;

use App\Coupon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use DB;

class CouponController extends Controller
{
    public function index()
    {
        return DB::table("coupons")->get();
    }

    public function get($coupon_id)
    {
       return Coupon::findOrFail($coupon_id);
    }

    public function getByIdGym($id_gym)
    {
       //return Coupon::findOrFail($coupon_id);
        return DB::table('coupons')->where('id_gym', '=', $id_gym)->get();
    }

    public function store(Request $request)
    {

        $rules = [
            'nom' => 'required',
            'taux' => 'required',
            'duree_depart' => 'required',
            'duree_fin' => 'required',
            'validite_depart' => 'required',
            'validite_fin' => 'required',
            'id_gym' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);

        if($validator->fails()) {
            return response()->json(["ok"=> 0, "error"=> $validator->errors()->first() ]);
        }

        Coupon::create($request->all());

        return response()->json(["ok"=> 1, "feedback"=> "we generate a new resource for you" ]);

    }



    public function update(Request $request)
    {
        Coupon::where("id", $request->get("id"))
            ->update($request->except(["id"]));

        return response()->json(["ok"=> 1, "feedback"=> "go to main page to see changes"]);
    }


    public function destroy($coupon_id)
    {
        DB::table('Coupon')->where('id', '=', $coupon_id)->delete();
        return ["ok" => 1, "feedback" => "the resource softly deleted, check the trash"];
    }
}
