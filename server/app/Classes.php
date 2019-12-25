<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Classes extends Model
{
    protected $fillable = [
            'name',
            'image',
            'prix_min',
            'prix_max'
        ];
}
