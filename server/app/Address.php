<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Address extends Model
{
    protected $fillable= [
        'street',
        'formattedAddress',
        'province',
        'state',
        'region',
        'city',
        'country',
        'postcode',
        'latitude',
        'longitude',
        'buildingNumber',
    ];

    public function accountable()
    {
        return $this->morphTo();
    }
}
