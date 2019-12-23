<?php

namespace App\Http\Controllers;

use App\Parrainagestaux;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use DB;

class ParrainagetauxController extends Controller
{
    public function index()
    {
        return DB::table("parrainages_taux")->get();
    }

    public function get($parr_taux_id)
    {
        return Parrainagestaux::findOrFail($parr_taux_id);
    }

    public function getByGym($id_gym)
    {
        $sql = "
            select * from parrainages_taux where id_gym=$id_gym ORDER BY id DESC 
        ";
        return \DB::select(\DB::raw($sql));

    }

    public function store(Request $request)
    {

        $rules = [
            'id_gym' => 'required',
            'id_current_user' => 'required',
            'taux' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);

        if($validator->fails()) {
            return response()->json(["ok"=> 0, "error"=> $validator->errors()->first() ]);
        }

        Parrainagestaux::create($request->all());
        return response()->json(["ok"=> 1, "feedback"=> "we generate a new resource for you" ]);
    }



    public function update(Request $request)
    {
        Parrainagestaux::where("id", $request->get("id"))
            ->update($request->except(["id"]));

        return response()->json(["ok"=> 1, "feedback"=> "go to main page to see changes"]);
    }


    public function destroy($parr_taux_id)
    {
        DB::table('parrainages_taux')->where('id', '=', $parr_taux_id)->delete();
        return ["ok" => 1, "feedback" => "the resource softly deleted, check the trash"];
    }
}
