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
        if(isset($args['address']))
        {
            $customer->address()->update($args['address']);
        }
        // the the customer profile
        parent::update($id, $args);
        return $customer;
    }

    public function insert(array $args)
    {
        $customer = parent::insert($args);

        if(isset($args['address']))
        {
            $customer->address()->save(new \App\Address($args['address']));
        }

        $customer->account()->save(new \App\Account($args['account']));

        return $customer;
    }
}
