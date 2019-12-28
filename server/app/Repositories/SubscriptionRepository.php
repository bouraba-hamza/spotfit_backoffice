<?php


namespace App\Repositories;

use App\Subscription;

class SubscriptionRepository extends BaseRepository
{

    public function __construct(Subscription $subscription)
    {
        parent::__construct($subscription);

    }

    public function update($id, array $args)
    {
        $subscription = $this->find($id);
        parent::update($id, $args);

        return $subscription;
    }

    public function insert(array $attributes)
    {
        return parent::insert($attributes);
    }
}
