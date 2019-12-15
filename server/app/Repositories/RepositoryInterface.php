<?php


namespace App\Repositories;


interface RepositoryInterface
{
    public function all($columns = ['*']);

    public function find($id, $columns = ['*']);

    public function findBy($attribute, $value, $columns = array('*'));

    public function update($id, Array $args);

    public function insert(Array $attributes);

    public function destroy($id);
}
