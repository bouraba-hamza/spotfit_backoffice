<?php

namespace App\Http\Controllers;

use App\Gym;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use DB;

class GymController extends Controller
{
    public function index()
    {
        return DB::table("gyms")->get();
    }

    public function show()
    {
        $sql = "
           select gyms.id,gyms.name , gyms.adress , gyms.tel , gyms.gamme ,  gyms.avis ,  gyms.qrcode , users.login
           from gyms , users
           where   gyms.id_gerant = users.id
        ";
        return \DB::select(\DB::raw($sql));
    }

    public function get($gym_id)
    {
       return Gym::findOrFail($gym_id);
    }


    public function getByAdmin($id_gerant)
    {
        $sql = "
            select * from gyms where id_gerant=$id_gerant
        ";
        return \DB::select(\DB::raw($sql));

    }


    public function store(Request $request)
    {

        $rules = [
            'name' => 'required',
            'adress' => 'required',
            'tel' => 'required',
            'gamme' => 'required',
            'avis' => 'required',
            'qrcode' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);

        if($validator->fails()) {
            return response()->json(["ok"=> 0, "error"=> $validator->errors()->first() ]);
        }

        Gym::create($request->all());

        return response()->json(["ok"=> 1, "feedback"=> "we generate a new resource for you" ]);

    }



    public function update(Request $request)
    {
        Gym::where("id", $request->get("id"))
        ->update($request->except(["id"]));

        return response()->json(["ok"=> 1, "feedback"=> "go to main page to see changes"]);
    }


    public function destroy($id)
    {
        DB::table('gyms')->where('id', '=', $id)->delete();
        return ["ok" => 1, "feedback" => "the resource softly deleted, check the trash"];
    }
}
