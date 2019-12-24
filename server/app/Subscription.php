<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Subscription extends Model
{
    protected $fillable = [
        "name",
        "duration",
    ];

    public function users()
    {
        return $this->belongsToMany(Customer::class)->using(customerSubscription::class)
            ->withPivot([
                "price",
                "consumption_date_begin",
                "consumption_date_end",
            ])
            ->withTimestamps();
    }
}
