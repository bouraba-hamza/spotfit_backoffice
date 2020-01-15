<?php
namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Classe extends Model
{

    protected  $table = "classes";

    protected $fillable = [
     "name",
"image",
"prix_min",
"prix_max",
 
    ];

    public function classes() {
        return $this->belongsToMany('App\Classe', "classes");
    }
}


