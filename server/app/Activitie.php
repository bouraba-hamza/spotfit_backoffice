<?php
namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Activitie extends Model
{

    protected  $table = "activities";

    protected $fillable = [
     "name",
"icon",
 
    ];

    public function activities() {
        return $this->belongsToMany('App\Activitie', "activities");
    }
}


