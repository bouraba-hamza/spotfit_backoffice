<?php


namespace App\Repositories;


use Illuminate\Database\Eloquent\Model;

interface EloquentRepositoryInterface
{
    public function all($columns = ['*']);

    public function find($id, $columns = ['*']);

    public function findBy($attribute, $value, $columns = array('*'));

    public function update($id, Array $args);

    public function store(Array $attributes);
}
