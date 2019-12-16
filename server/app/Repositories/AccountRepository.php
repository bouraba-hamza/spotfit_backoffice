<?php


namespace App\Repositories;

use App\Account;
use App\Mail\AccountCreated;
use Illuminate\Support\Facades\Mail;

class AccountRepository extends BaseRepository implements EloquentRepositoryInterface
{
    public function __construct(Account $account)
    {
        parent::__construct($account);
    }

    public function insert(array $attributes)
    {
        $account = parent::insert($attributes);
        Mail::to($account->email)->send(new AccountCreated($account));
        return $account;
    }
}
