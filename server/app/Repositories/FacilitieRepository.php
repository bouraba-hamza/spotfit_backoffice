<?php

namespace App\Repositories;

use App\Facilitie;

class FacilitieRepository extends BaseRepository
{

    public function __construct(Facilitie $facilitie)
    {
        parent::__construct($facilitie);

    }

    public function update($id, array $args)
    { 
        $facilitie = $this->find($id);
        parent::update($id, $args);

        return $facilitie;
    }

    public function insert(array $attributes)
    {
        return parent::insert($attributes);
    }

}



