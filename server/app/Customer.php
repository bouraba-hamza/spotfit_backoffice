<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{

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
            "consumption_date_begin",
            "consumption_date_end",
        ])
        ->withTimestamps();
    }

    public function sponsorships()
    {
        return $this->hasMany(Sponsorship::class);
    }
}
