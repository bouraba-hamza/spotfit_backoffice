<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Passpartout extends Model
{
    protected  $table = "passpartout";

    protected $fillable = [
        "class",
        'prix',
        "id_gym"
    ];


    public function coupons() {
        return $this->belongsToMany('App\Passpartout', "passpartout");
    }
}
