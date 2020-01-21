<?php


namespace App\Repositories;

use App\Receptionist;

class ReceptionistRepository extends BaseRepository
{
    protected $account;
    protected $address;

    public function __construct(Receptionist $receptionist, AccountRepository $accountRepository, AddressRepository $addressRepository)
    {
        parent::__construct($receptionist);
        $this->account = $accountRepository;
        $this->address = $addressRepository;
    }

    public function update($id, array $args)
    {
        $receptionist = $this->find($id);
        // update the account
        $receptionist->account()->first()->update($args["account"]);
        // finally the address
        if(isset($args['address']))
        {
            $receptionist->address()->update($args['address']);
        }
        // the the receptionist profile
        parent::update($id, $args);
        return $receptionist;
    }

    public function insert(array $args)
    {
        $receptionist = parent::insert($args);

        if(isset($args['address']))
        {
            $receptionist->address()->save(new \App\Address($args['address']));
        }

        $receptionist->account()->save(new \App\Account($args['account']));

        return $receptionist;
    }
}
