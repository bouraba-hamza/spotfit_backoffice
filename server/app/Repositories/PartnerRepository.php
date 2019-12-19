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
        $partner->address()->first()->update($args["address"]);
        // the the partner profile
        parent::update($id, $args);

        return $partner;
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
