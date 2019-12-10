<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{

    protected $with = ['address', 'account'];

    public function account()
    {
        return $this->hasOne('App\Account', 'id', 'account_id');
    }

    public function address()
    {
        return $this->hasOne('App\Address', 'id', 'address_id');
    }
}