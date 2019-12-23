<?php

namespace App\Http\Controllers;

use App\Parrainage;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use DB;

class ParrainageController extends Controller
{
    public function index()
    {
        return DB::table("parrainages")->get();
    }

    public function get($parr_id)
    {
        return Parrainage::findOrFail($parr_id);
    }

    public function getByGym($id_gym)
    {
        $sql = "
            select * from parrainages where id_gym=$id_gym ORDER BY date_parrainage ASC 
        ";
        return \DB::select(\DB::raw($sql));

    }

    public function store(Request $request)
    {

        $rules = [
            'taux' => 'required',
            'id_user' => 'required',
            'id_cible' => 'required|integer',
            'date_parrainage' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);

        if($validator->fails()) {
            return response()->json(["ok"=> 0, "error"=> $validator->errors()->first() ]);
        }

        Parrainage::create($request->all());

        return response()->json(["ok"=> 1, "feedback"=> "we generate a new resource for you" ]);

    }



    public function update(Request $request)
    {
        Parrainage::where("id", $request->get("id"))
            ->update($request->except(["id"]));

        return response()->json(["ok"=> 1, "feedback"=> "go to main page to see changes"]);
    }


    public function destroy($parr_id)
    {
        DB::table('parrainage')->where('id', '=', $parr_id)->delete();
        return ["ok" => 1, "feedback" => "the resource softly deleted, check the trash"];
    }
}
