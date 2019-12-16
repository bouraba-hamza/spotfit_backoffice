<?php

namespace App\Mail;

use App\Account;
use DB;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Str;

class AccountCreated extends Mailable implements ShouldQueue
{
    use Queueable, SerializesModels;

    private $verificationCode;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(Account $account)
    {

        // generate a random verification code
        $verificationCode = Str::random(30);
        // update the email_verifications database table
        DB::table('email_verification')->insert(
            ['email' => $account->email,
                'code' => $verificationCode,
                'done' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ]
        );
        $this->verificationCode = $verificationCode;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('emails.accountCreated')
            ->with(['verificationCode' => $this->verificationCode,])
            ->subject('Verification d\'email - SPOTFIT');
    }
}
