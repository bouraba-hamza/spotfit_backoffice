<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Receptionist extends Model
{

    protected $with = ['account', 'address'];

    protected $fillable = [
        'firstName',
        'lastName',
        'gender',
        'birthDay',
        'phoneNumber',
        'cin',
        'jobTitle',
        'avatar',
        'gym_id'
    ];

    public function address()
    {
        return $this->morphOne(Address::class, 'addressable');
    }

    public function account()
    {
        return $this->morphOne(account::class, 'accountable');
    }

    public function gym()
    {
        return $this->hasOne(Gym::class);
    }
}
