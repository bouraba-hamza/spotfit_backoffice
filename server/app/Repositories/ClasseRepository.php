<?php

namespace App\Repositories;

use App\Classe;

class ClasseRepository extends BaseRepository
{

    public function __construct(Classe $classe)
    {
        parent::__construct($classe);

    }

    public function update($id, array $args)
    { 
        $classe = $this->find($id);
        parent::update($id, $args);

        return $classe;
    }

    public function insert(array $attributes)
    {
        return parent::insert($attributes);
    }

}



