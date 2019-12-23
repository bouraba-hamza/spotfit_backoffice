<?php


namespace App\Repositories;

use App\Account;
use App\Jobs\SendVerificationMail;
use Illuminate\Support\Facades\Log;
use Spatie\Async\Pool;
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
        Mail::to($account->email)->later(1, new AccountCreated($account));
        return $account;
    }
}
