<?php


namespace App\Repositories;

use App\Account;
use App\Jobs\SendVerificationMail;
use Illuminate\Support\Facades\Log;
use Spatie\Async\Pool;
use App\Mail\AccountCreated;
use Illuminate\Support\Facades\Mail;

class SettingRepository extends BaseRepository implements EloquentRepositoryInterface
{
    public function __construct(\App\Setting $setting)
    {
        parent::__construct($setting);
    }
}
