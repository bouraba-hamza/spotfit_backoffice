<?php
namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Facilitie extends Model
{

    protected  $table = "facilities";

    protected $fillable = [
     "icon",
"name",
"order",
 
    ];

    public function facilities() {
        return $this->belongsToMany('App\Facilitie', "facilities");
    }
}


