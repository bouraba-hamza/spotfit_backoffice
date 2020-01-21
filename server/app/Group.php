<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Group extends Model
{

    protected $table = "groups";

    protected $fillable = [
        "name",
        "partner_id",
    ];

    public function gyms()
    {
        return $this->hasMany(Gym::class);
    }

    public function partner()
    {

        return $this->hasOne(Partner::class);

    }

}


