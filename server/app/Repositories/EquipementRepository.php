<?php

namespace App\Repositories;

use App\Equipement;

class EquipementRepository extends BaseRepository
{

    public function __construct(Equipement $equipement)
    {
        parent::__construct($equipement);

    }

    public function update($id, array $args)
    { 
        $equipement = $this->find($id);
        parent::update($id, $args);

        return $equipement;
    }

    public function insert(array $attributes)
    {
        return parent::insert($attributes);
    }

}



