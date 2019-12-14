<?php

namespace App\Http\Controllers;
use App\Account;
use Illuminate\Http\Request;

class AccountController extends Controller
{
    public function disable(Request $request)
    {
        $account = Account::findOrFail($request->get("accountId"));
        $account->update(['disabled' => 1]);
        return compact('account');
    }

    public function activate(Request $request)
    {
        $account = Account::findOrFail($request->get("accountId"));
        $account->update(['disabled' => 0]);
        return compact('account');
    }
}
