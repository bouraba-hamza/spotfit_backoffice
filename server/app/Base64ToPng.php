<?php
namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Base64ToPng extends Model
{

    protected  $table = "base64ToPngs";

    protected $fillable = [
     "name",
"code",
 
    ];

    public function base64ToPngs() {
        return $this->belongsToMany('App\Base64ToPng', "base64ToPngs");
    }
}


