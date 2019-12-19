<?php


namespace App\Repositories;

use App\Address;

class AddressRepository extends BaseRepository implements EloquentRepositoryInterface
{
    public function __construct(Address $address)
    {
        parent::__construct($address);
    }
}
