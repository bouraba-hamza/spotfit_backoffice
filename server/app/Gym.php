<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Gym extends Model
{

    protected $with = ['supervisor'];

    protected $table = "gyms";

    protected $fillable = [
        "group_id",
        "logo",
        "name",
        "rate",
        "qrcode",
        "class_id",
        "planning",

    ];

    public function gyms()
    {
        return $this->belongsToMany('App\Gym', "gyms");
    }

//    public function facilities()
//    {
//        return $this->hasMany('App\Gym', "gyms");
//    }

    public function facilities()
    {
        return $this->belongsToMany(Facilitie::class,'gym_facilities',"gym_id",'facility_id');

    }

    public function group()
    {
        return $this->hasOne(Group::class);
    }

    public function receptionist()
    {
        return $this->hasOne(Receptionist::class);
    }

    public function supervisor()
    {
        return $this->hasOne(Supervisor::class);
    }
}


