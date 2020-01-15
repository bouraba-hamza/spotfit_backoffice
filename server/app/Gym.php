<?php
namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Gym extends Model
{

    protected  $table = "gyms";

    protected $fillable = [
     "group_id",
"logo",
"name",
"rate",
"qrcode",
"class_id",
"facilities",
"planning",
 
    ];

    public function gyms() {
        return $this->belongsToMany('App\Gym', "gyms");
    }
}


