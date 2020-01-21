<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Sponsorship extends Model
{
    protected $fillable = [
        "customer_id",
        "customer_subscription_id",
        "amount",
        "code",
        "date",
    ];

    public function customerSubscription() {
        return $this->hasOne(customerSubscription::class, "id", "customer_subscription_id");
    }

    public function influencer() {
        return $this->hasOne(Customer::class);
    }
}
