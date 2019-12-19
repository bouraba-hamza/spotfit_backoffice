<?php


namespace App\Repositories;

use App\Admin;

class AdminRepository extends BaseRepository
{
    protected $account;
    protected $address;

    public function __construct(Admin $admin, AccountRepository $accountRepository, AddressRepository $addressRepository)
    {
        parent::__construct($admin);
        $this->account = $accountRepository;
        $this->address = $addressRepository;
    }

    public function update($id, array $args)
    {
        $admin = $this->find($id);

        // update the account
        $admin->account()->first()->update($args["account"]);
        // finally the address
        $admin->address()->first()->update($args["address"]);
        // the the admin profile
        parent::update($id, $args);

        return $admin;
    }

    public function insert(array $attributes)
    {
        $attributes['account_id'] = $this->account->insert($attributes['account'])->id;
        if (isset($attributes['address'])) {
            $attributes['address_id'] = $this->address->insert($attributes['address'])->id;
        }

        return parent::insert($attributes);
    }
}
