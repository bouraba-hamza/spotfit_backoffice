<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Gym extends Model
{

    protected  $table = "gyms";

    protected $fillable = [
        "logo",
        "name",
        "adress",
        "tel",
        "qrcode",
        "planing",
    ];

    protected $casts = [
         'planing' => 'array'
         'facilities' => 'array'
    ];

    public function gyms() {
        return $this->belongsToMany('App\Gym', "gyms");
    }
}
