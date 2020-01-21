<?php

namespace App\Repositories;

use App\Activitie;

class ActivitieRepository extends BaseRepository
{

    public function __construct(Activitie $activitie)
    {
        parent::__construct($activitie);

    }

    public function update($id, array $args)
    { 
        $activitie = $this->find($id);
        parent::update($id, $args);

        return $activitie;
    }

    public function insert(array $attributes)
    {
        return parent::insert($attributes);
    }

}



