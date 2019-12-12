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
