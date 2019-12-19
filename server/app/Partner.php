<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Partner extends Model
{
    protected $with = ['address', 'account'];

    protected $fillable = [
        'firstName',
        'lastName',
        'gender',
        'birthDay',
        'phoneNumber',
        'cin',
        'jobTitle',
        'avatar',
        'account_id',
        'address_id'
    ];
    
    public function address()
    {
        return $this->hasOne('App\Address', 'id', 'address_id');
    }

    public function account()
    {
        return $this->hasOne('App\Account', 'id', 'account_id');
    }
}
