<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Cashier\Billable;

class Customer extends Model
{
    use Billable;

    protected $with = ['address', 'account'];

    protected $fillable = [
        'qrcode',
        'firstName',
        'lastName',
        'gender',
        'birthDay',
        'phoneNumber',
        'cin',
        'jobTitle',
        'avatar',
        'ambassador'
    ];

    public function address()
    {
        return $this->morphOne(Address::class, 'addressable');
    }

    public function account()
    {
        return $this->morphOne(account::class, 'accountable');
    }

    public function subscriptions()
    {
        return $this->belongsToMany(Subscription::class)
            ->using(customerSubscription::class)
            ->withPivot([
                "price",
                "consumed_at",
                "activated_at",
                "canceled_at",
            ])
            ->withTimestamps();
    }

    public function sponsorships()
    {
        return $this->hasMany(Sponsorship::class);
    }
}
