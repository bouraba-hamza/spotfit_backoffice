<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Facilitie extends Model
{

    protected $table = "facilities";

    protected $fillable = [
        "icon",
        "name",
        "order",

    ];

    public function gyms()
    {
        return $this->belongsToMany(Gym::class,'gym_facilities',"facility_id",'gym_id');
    }
}


