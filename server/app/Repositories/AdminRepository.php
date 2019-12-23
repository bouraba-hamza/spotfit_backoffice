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
        if(isset($args['address']))
        {
            $admin->address()->update($args['address']);
        }
        // the the admin profile
        parent::update($id, $args);
        return $admin;
    }

    public function insert(array $args)
    {
        $admin = parent::insert($args);

        if(isset($args['address']))
        {
            $admin->address()->save(new \App\Address($args['address']));
        }

        $admin->account()->save(new \App\Account($args['account']));

        return $admin;
    }
}
