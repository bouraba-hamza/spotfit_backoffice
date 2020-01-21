<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Classe extends Model
{

    protected $table = "classes";

    protected $fillable = [
        "name",
        "image",

    ];

    public function subscription()
    {
        return $this->belongsToMany(Subscription::class,'class_subscription',"class_id",'subscription_id')
            ->withPivot('prix_min', 'prix_max')
            ->withTimestamps();

    }
}


