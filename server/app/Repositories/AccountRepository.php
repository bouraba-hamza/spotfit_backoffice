<?php

namespace App\Repositories;

use App\Account;

class AccountRepository implements EloquentRepositoryInterface
{
    public function all($columns = ['*'])
    {
        return Account::get($columns);
    }

    public function find($id, $columns = ['*'])
    {
        return Account::findOrFail($id, $columns);
    }

    public function findBy($attribute, $value, $columns = array('*'))
    {
        return Account::where($attribute, $value)->first($columns);
    }

    public function update($id, Array $args)
    {
        $account = Account::findOrFail($id);
        $account->update($args);
        return $account;
    }

    public function store(Array $attributes)
    {
        return Account::create($attributes);
    }
}
