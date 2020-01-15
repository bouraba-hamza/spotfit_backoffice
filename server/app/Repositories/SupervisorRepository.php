<?php


namespace App\Repositories;

use App\Supervisor;

class SupervisorRepository extends BaseRepository
{
    protected $account;
    protected $address;

    public function __construct(Supervisor $supervisor, AccountRepository $accountRepository, AddressRepository $addressRepository)
    {
        parent::__construct($supervisor);
        $this->account = $accountRepository;
        $this->address = $addressRepository;
    }

    public function update($id, array $args)
    {
        $supervisor = $this->find($id);
        // update the account
        $supervisor->account()->first()->update($args["account"]);
        // finally the address
        if(isset($args['address']))
        {
            $supervisor->address()->update($args['address']);
        }
        // the the supervisor profile
        parent::update($id, $args);
        return $supervisor;
    }

    public function insert(array $args)
    {
        $supervisor = parent::insert($args);

        if(isset($args['address']))
        {
            $supervisor->address()->save(new \App\Address($args['address']));
        }

        $supervisor->account()->save(new \App\Account($args['account']));

        return $supervisor;
    }
}
