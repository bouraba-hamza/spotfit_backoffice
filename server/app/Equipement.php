<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Equipement extends Model
{
    protected  $table = "equipements";

    protected $fillable = [
        "libelle",
        "code_barre",
        "gamme",
        "etat",
        "image"
    ];

    public function equipements() {
        return $this->belongsToMany('App\Equipement', "equipements");
    }
}
