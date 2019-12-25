<?php


namespace App\Repositories;

use App\Classes;

class ClassRepository extends BaseRepository
{

    public function __construct(Classes $class)
    {
        parent::__construct($class);

    }

    public function update($id, array $args)
    {
        $class = $this->find($id);
        parent::update($id, $args);

        return $class;
    }

    public function insert(array $attributes)
    {
        return parent::insert($attributes);
    }

}
