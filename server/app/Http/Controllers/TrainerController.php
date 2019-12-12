<?php

namespace App\Http\Controllers;

use App\Account;
use App\Trainer;
use App\Address;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Validator;

class TrainerController extends Controller
{
    const VALIDATION_MESSAGES = [
        'birthDay.date_format' => "la date de naissance dois respecter le format Année-Mois-jour",
        'avatar.image' => "la photo de profile  dois respecter le format d'image ",
        'account.email.required' => "le champ email est requis",
        'account.email.email' => "il faut respecter le format de mail",
        'account.email.unique' => "l'email déjà pris",
        'account.username.required' => "le champ login est requis",
        'account.username.unique' => "le nom d'utilisateur déjà pris",
        'account.password.required' => "le champ mote de passe est requis",
        'account.password.min' => "la longueur du mot de passe doit être d'au moins 6 caractères",
        'weight.numeric' => "Il faut respecter l'unité de poids",
        'length.numeric' => "Il faut respecter l'unité de longueur",
    ];

    public function index()
    {
        return Trainer::all();
    }

    public function store(Request $request)
    {
        // filter unwanted inputs from request
        $trainer = $request->all();
        // convert the json to php array
        $account = json_decode($request->get('account'), true);
        $trainer['account'] = $account;
        // build address object
        $address = json_decode($request->get('address'), true);

        $validator = Validator::make($trainer, [
            'gender' => 'in:m,f',
            'birthDay' => 'date_format:Y-m-d',
            'avatar' => 'image',
            // these fields required to create account when the trainer can use the application
            'account.email' => 'required|email|unique:accounts,email',
            'account.username' => 'required|unique:accounts,username',
            'account.password' => 'required|min:6',
            'weight' => 'numeric',
            'length' => 'numeric',
        ], self::VALIDATION_MESSAGES);

        // stop running function proccesses if the validation fails
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        // save the file in storage
        if ($request->hasFile("avatar")) {
            $avatar = $request->file('avatar');
            $fake_name = Str::slug(Str::random(7) . '_' . $avatar->getClientOriginalName());
            $path = \Storage::putFileAs('avatars', $avatar, $fake_name);
            $trainer["avatar"] = $fake_name;
        }

        unset($trainer['account']);
        $trainer['account_id'] = Account::create($account)->id;
        $trainer['address_id'] = Address::create($address)->id;
        $trainer_id = Trainer::create($trainer)->id;

        // return the id of the resource just created
        return ['trainer_id' => $trainer_id];
    }

    public function show($trainer_id)
    {
        return Trainer::findOrFail($trainer_id);
    }

    public function update(Request $request, $trainer_id)
    {
        // check if the the requested resource exist in database
        $__o = Trainer::findOrFail($trainer_id);

        $account = json_decode($request->get('account'), true);
        $address = json_decode($request->get('address'), true);
        $trainer = $request->all();
        $trainer['account'] = $account;

        $validator = Validator::make($trainer, [
            'gender' => 'in:m,f',
            'birthDay' => 'date_format:Y-m-d',
            'avatar' => 'image',
            'account.email' => 'required|email|unique:accounts,email,' . $__o->account->id,
            'account.username' => 'required|unique:accounts,username,' . $__o->account->id,
            'account.password' => 'min:6',
            'weight' => 'numeric',
            'length' => 'numeric',
        ], self::VALIDATION_MESSAGES);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        if ($request->hasFile("avatar")) {
            // delete the old avatar
            \Storage::delete('avatars/' . $__o->avatar);
            // save the the received photo
            $avatar = $request->file('avatar');
            // generate a random name as prefix
            $fake_name = Str::slug(Str::random(7) . '_' . $avatar->getClientOriginalName(), '.');
            // save the file
            $path = \Storage::putFileAs('avatars', $avatar, $fake_name);
            $trainer["avatar"] = $fake_name;
        }

        // update the account
        $__o->account()->first()->update($account);
        // the the trainer profile
        $__o->update($trainer);
        // finally the address
        $__o->address()->first()->update($address);


        return ['trainer_id' => $__o->id];
    }

    public function destroy($trainer_id)
    {
        $trainer = Trainer::findOrFail($trainer_id);
        $trainer->delete();
        return ['status' => 'success', 'deleted_resource_id' => $trainer->id];
    }
}
