<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Trainer extends Model
{
    protected $with = ['account', 'address'];

    public function address()
    {
        return $this->hasOne('App\Address', 'id', 'address_id');
    }

    public function account()
    {
        return $this->hasOne('App\Account', 'id', 'account_id');
    }
}