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
        $trainer->address()->first()->update($args["address"]);
        // the the trainer profile
        parent::update($id, $args);

        return $trainer;
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
