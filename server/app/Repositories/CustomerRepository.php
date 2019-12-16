<?php


namespace App\Repositories;

use App\Customer;

class CustomerRepository extends BaseRepository
{
    protected $account;
    protected $address;

    public function __construct(Customer $customer, AccountRepository $accountRepository, AddressRepository $addressRepository)
    {
        parent::__construct($customer);
        $this->account = $accountRepository;
        $this->address = $addressRepository;
    }

    public function update($id, array $args)
    {
        $customer = $this->find($id);

        // update the account
        $customer->account()->first()->update($args["account"]);
        // finally the address
        $customer->address()->first()->update($args["address"]);
        // the the customer profile
        parent::update($id, $args);

        return $customer;
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
