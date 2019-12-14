<?php

namespace App\Http\Controllers;

use App\Repositories\AccountRepository;
use Illuminate\Http\Request;

class AccountController extends Controller
{
    private $account;

    public function __construct(AccountRepository $account)
    {
        $this->account = $account;
    }

    public function index()
    {
        return $this->account->all();
    }

    public function show($accountId)
    {
        return $this->account->find($accountId);
    }

    public function update(Request $request, $accountId)
    {
        $args = $request->all();
        return $this->account->update($accountId, $args);
    }

    public function store(Request $request)
    {
        return $this->account->store($request->all());
    }

    public function disable($accountId)
    {
        return $this->account->update($accountId, ['disabled' => '1']);
    }

    public function enable($accountId)
    {
        return $this->account->update($accountId, ['disabled' => '0']);
    }
}
