<?php
namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Facture extends Model
{

    protected  $table = "factures";

    protected $fillable = [
        "libele",
        "montant",

    ];

    public function factures() {
        return $this->belongsToMany('App\Facture', "factures");
    }
}


