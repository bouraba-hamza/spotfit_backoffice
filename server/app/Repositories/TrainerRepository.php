<?php


namespace App\Repositories;

use App\Trainer;

class TrainerRepository extends BaseRepository
{
    protected $account;
    protected $address;

    public function __construct(Trainer $trainer, AccountRepository $accountRepository, AddressRepository $addressRepository)
    {
        parent::__construct($trainer);
        $this->account = $accountRepository;
        $this->address = $addressRepository;
    }

    public function update($id, array $args)
    {
        $trainer = $this->find($id);
        // update the account
        $trainer->account()->first()->update($args["account"]);
        // finally the address
        if(isset($args['address']))
        {
            $trainer->address()->update($args['address']);
        }
        // the the trainer profile
        parent::update($id, $args);
        return $trainer;
    }

    public function insert(array $args)
    {
        $trainer = parent::insert($args);

        if(isset($args['address']))
        {
            $trainer->address()->save(new \App\Address($args['address']));
        }

        $trainer->account()->save(new \App\Account($args['account']));

        return $trainer;
    }
}
