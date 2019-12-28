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
