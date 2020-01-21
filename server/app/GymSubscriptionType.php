<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class GymSubscriptionType extends Model
{
    protected $fillable = [
        'gym_id',
        'subscription_id',
        'type_id',
        'price'
    ];
}
