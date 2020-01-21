<?php

namespace App\Repositories;

use App\Group;

class GroupRepository extends BaseRepository
{

    public function __construct(Group $group)
    {
        parent::__construct($group);

    }

    public function update($id, array $args)
    { 
        $group = $this->find($id);
        parent::update($id, $args);

        return $group;
    }

    public function insert(array $attributes)
    {
        return parent::insert($attributes);
    }

}



