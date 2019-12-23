<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Coupon extends Model
{
    protected  $table = "coupons";

    protected $fillable = [
        "nom",
        'taux',
        "duree_depart",
        "duree_fin",
        "validite_depart",
        "validite_fin",
        "id_gym"
    ];

    public function coupons() {
        return $this->belongsToMany('App\Coupon', "coupons");
    }
}
