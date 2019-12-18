<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Parrainage extends Model
{
    protected $dates = ['deleted_at'];

    protected  $table = "parrainages";

    protected $fillable = [
        "taux",
        "id_user",
        "id_cible",
        "date_parrainage",
        "id_gym"
    ];

    public function gyms() {
        return $this->belongsToMany('App\Gym', "gyms");
    }
}
