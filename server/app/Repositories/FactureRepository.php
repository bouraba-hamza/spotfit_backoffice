<?php

namespace App\Repositories;

use App\Facture;

class FactureRepository extends BaseRepository
{

    public function __construct(Facture $facture)
    {
        parent::__construct($facture);

    }

    public function update($id, array $args)
    { 
        $facture = $this->find($id);
        parent::update($id, $args);

        return $facture;
    }

    public function insert(array $attributes)
    {
        return parent::insert($attributes);
    }

}



