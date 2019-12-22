<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Admin extends Model
{
    use SoftDeletes;

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
    ];

    public function address()
    {
        return $this->morphOne(Address::class, 'addressable');
    }

    public function account()
    {
        return $this->morphOne(account::class, 'accountable');
    }

}
