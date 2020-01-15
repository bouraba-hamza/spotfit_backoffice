<?php

namespace App\Repositories;

use App\Home;

class HomeRepository extends BaseRepository
{

    public function __construct(Home $home)
    {
        parent::__construct($home);

    }

    public function update($id, array $args)
    { 
        $home = $this->find($id);
        parent::update($id, $args);

        return $home;
    }

    public function insert(array $attributes)
    {
        return parent::insert($attributes);
    }

}



