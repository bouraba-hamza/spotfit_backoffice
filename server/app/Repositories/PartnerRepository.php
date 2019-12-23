<?php


namespace App\Repositories;

use App\Partner;

class PartnerRepository extends BaseRepository
{
    protected $account;
    protected $address;

    public function __construct(Partner $partner, AccountRepository $accountRepository, AddressRepository $addressRepository)
    {
        parent::__construct($partner);
        $this->account = $accountRepository;
        $this->address = $addressRepository;
    }

    public function update($id, array $args)
    {
        $partner = $this->find($id);
        // update the account
        $partner->account()->first()->update($args["account"]);
        // finally the address
        if(isset($args['address']))
        {
            $partner->address()->update($args['address']);
        }
        // the the partner profile
        parent::update($id, $args);
        return $partner;
    }

    public function insert(array $args)
    {
        $partner = parent::insert($args);

        if(isset($args['address']))
        {
            $partner->address()->save(new \App\Address($args['address']));
        }

        $partner->account()->save(new \App\Account($args['account']));

        return $partner;
    }
}
