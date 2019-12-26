<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pass extends Model
{
    protected $fillable = [
            'name',
            'duration',
            'image',
        ];

        
}
