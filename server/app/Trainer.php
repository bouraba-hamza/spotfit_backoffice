<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Trainer extends Model
{
    protected $with = ['address', 'account'];

    public function account()
    {
        return $this->morphOne('App\Account', 'accountable');
    }

    public function address()
    {
        return $this->hasOne('App\Address', 'id', 'address_id');
    }
}
