<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ClassSubscription extends Model
{
    protected $fillable=[
        'subscription_id',
        'class_id',
        'prix_min',
        'prix_max'
    ];
}
