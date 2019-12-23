<?php

namespace App\Http\Controllers;

use App\Equipement;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use DB;

class EquipementController extends Controller
{
    public function index()
    {
        return DB::table("equipements")->get();
    }

    public function get($equipement_id)
    {
        return Equipement::findOrFail($equipement_id);
    }

    public function show()
    {
        $sql = "
           select equipements.id, equipements.image, equipements.libelle, equipements.code_barre, equipements.gamme, equipements.etat       
           from equipements
        ";
        return \DB::select(\DB::raw($sql));
    }


    public function store(Request $request)
    {

        $rules = [
            'libelle' => 'required',
            'id_gym' => 'required',
            'code_barre' => 'required',
            'gamme' => 'required',
            'etat' => 'required',
            'image' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);

        if($validator->fails()) {
            return response()->json(["ok"=> 0, "error"=> $validator->errors()->first() ]);
        }

        Equipement::create($request->all());

        return response()->json(["ok"=> 1, "feedback"=> "we generate a new resource for you" ]);

    }



    public function update(Request $request)
    {
        Equipement::where("id", $request->get("id"))
            ->update($request->except(["id"]));

        return response()->json(["ok"=> 1, "feedback"=> "go to main page to see changes"]);
    }


    public function destroy($equipement_id)
    {
        DB::table('equipements')->where('id', '=', $equipement_id)->delete();
        return ["ok" => 1, "feedback" => "the resource softly deleted, check the trash"];
    }
}
