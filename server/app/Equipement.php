<?php
namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Equipement extends Model
{

    protected  $table = "equipements";

    protected $fillable = [
     "libelle",
"rate",
"gym_id",
 
    ];

    public function equipements() {
        return $this->belongsToMany('App\Equipement', "equipements");
    }
}


