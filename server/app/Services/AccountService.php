<?php


namespace App\Services;

use Illuminate\Database\Eloquent\Model;

class AccountService
{
    public static function assignRole(Model $account)
    {
        $role = null;
        $accountable = $account->accountable()->first();

        if ($accountable instanceof \App\Admin)
            $role = 'admin';
        else if ($accountable instanceof \App\Partner)
            $role = 'partner';
        else if ($accountable instanceof \App\Customer)
            $role = 'customer';
        else if ($accountable instanceof \App\Trainer)
            $role = 'trainer';
        else if ($accountable instanceof \App\Supervisor)
            $role = 'supervisor';
        else if ($accountable instanceof \App\Receptionist)
            $role = 'receptionist';

        if ($role != null)
            $account->assignRole($role);

        return $role;
    }
}
