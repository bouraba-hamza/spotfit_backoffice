<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Tymon\JWTAuth\Contracts\JWTSubject;

class Account extends Authenticatable implements JWTSubject, MustVerifyEmail
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    public $fillable = [
        'username', 'email', 'password', 'disabled'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }
    public function setPasswordAttribute($password)
    {
        if ( !empty($password) ) {
            $this->attributes['password'] = bcrypt($password);
        }
    }

    public function owner() {
        $accountId = $this->id;

        $t = Trainer::where('account_id', '=', $accountId)->first();
        if($t) return $t;
        $p = Partner::where('account_id', '=', $accountId)->first();
        if($p) return $p;
        $c = Customer::where('account_id', '=', $accountId)->first();
        if($c) return $c;
        $a = Admin::where('account_id', '=', $accountId)->first();
        if($a) return $a;

        return null;
    }

    public function scopeDisabled($query, $arg)
    {
        return $query->where('disabled', $arg);
    }
}
