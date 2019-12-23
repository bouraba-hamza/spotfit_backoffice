<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;


class resetPasswordLinkSend extends Mailable implements ShouldQueue
{
    use Queueable, SerializesModels;

    private $ticket;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(String $ticket)
    {
        $this->ticket = $ticket;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('emails.resetPasswordLinkSend')
            ->with(['ticket' => $this->ticket,])
            ->subject('Récupérer le mot de passe - SPOTFIT');
    }
}
