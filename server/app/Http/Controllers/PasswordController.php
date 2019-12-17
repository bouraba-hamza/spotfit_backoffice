<?php

namespace App\Http\Controllers;

use App\Mail\resetPasswordLinkSend;
use App\Repositories\AccountRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class PasswordController extends Controller
{

    protected $account;

    public function __construct(AccountRepository $accountRepository)
    {
        $this->account = $accountRepository;
    }

    public function sendResetLink(Request $request)
    {
        $email = $request->get("email");

        // validate the email

        $validator = Validator::make(["email" => $email], [
            'email' => "required|email|exists:accounts,email",
        ], [
            'email.required' => 'L\'email est requis',
            'email.email' => 'Il faut respecter le format de mail',
            'email.exists' => 'Votre recherche ne donne aucun résultat. Veuillez réessayer avec d’autres informations.',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        // generate a random verification code
        $ticket = Str::random(30);

        // update the email_verifications database table
        DB::table('password_resets')->insert(
            [
                'email' => $email,
                'token' => $ticket,
                'created_at' => now(),
            ]
        );

        // and send mail with this ticket
        Mail::to($email)->send(new resetPasswordLinkSend($ticket));

        return response()->json(["status" => "success"]);
    }

    public function update(Request $request)
    {
        // validate the ticket and the password
        $validator = Validator::make($request->all(), [
            'ticket' => "required|exists:password_resets,token",
            'password' => "required|min:6",
        ], [
            'ticket.required' => "Ticket est requis",
            'ticket.exists' => "Le ticket a expiré ou est consommé",
            'password.required' => "Le mote de passe est obligatoire",
            'password.min' => "le mot de passe doit contenir au moins 6 caractères",
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        // get ticket ticket email and
        $email = optional(DB::table('password_resets')->where('token', $request->ticket)->first())->email;


        // update the the account who has this email
        $account = $this->account->findBy("email", $email);
        $this->account->update($account->id, ["password" => $request->password]);

        // remove the record from password_resets
        DB::table('password_resets')->where('token', $request->ticket)->delete();

        // remove the oldest request
        DB::table('password_resets')->where('email', $email)->delete();

        return ["status" => "success"];
    }

    public function verify($ticket)
    {
        // check if the ticket exists
        $pr = DB::table('password_resets')->where('token', $ticket)->first();

        // in case ticket code dosn't belongs to any account
        if(!$pr)
            abort(404, 'Submit a ticket before to reset you password');

        return response()->json(["status" => "valid", "belongsTo" => $pr->email]);
    }


}
