<?php
namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Home extends Model
{

    protected  $table = "homes";

    protected $fillable = [
     "",
 
    ];

    public function homes() {
        return $this->belongsToMany('App\Home', "homes");
    }
}


