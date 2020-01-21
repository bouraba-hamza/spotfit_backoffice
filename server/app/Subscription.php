<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Subscription extends Model
{
    protected $fillable = [
        "name",
        "duration",
        "image",
        "description",
    ];

    public function classes()
    {
        return $this->belongsToMany(Classe::class,'class_subscription',"subscription_id",'class_id')
            ->withPivot('prix_min', 'prix_max')
            ->withTimestamps();
    }

    public function users()
    {
        return $this->belongsToMany(Customer::class)->using(customerSubscription::class)
            ->withPivot([
                "price",
                "consumed_at",
                "activated_at",
                "canceled_at",
            ])
            ->withTimestamps();
    }
}
