<?php

namespace App\Repositories;

use App\Gym;

class GymRepository extends BaseRepository
{

    public function __construct(Gym $gym)
    {
        parent::__construct($gym);

    }

    public function update($id, array $args)
    { 
        $gym = $this->find($id);
        parent::update($id, $args);

        return $gym;
    }

    public function insert(array $attributes)
    {
        return parent::insert($attributes);
    }

}



