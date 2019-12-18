<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Parrainagestaux extends Model
{
    protected  $table = "parrainages_taux";

    protected $fillable = [
        "id_gym",
        "id_current_user",
        "taux"
    ];


    public function parrainagestaux() {
        return $this->belongsToMany('App\Parrainagestaux', "parrainages_taux");
    }
}
