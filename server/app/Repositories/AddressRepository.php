<?php


namespace App\Repositories;

use App\Address;

class AddressRepository implements EloquentRepositoryInterface
{
    protected $model;

    public function __construct(Address $address)
    {
        $this->model = new BaseRepository($address);
    }

    public function all($columns = ['*'])
    {
        return $this->model->all();
    }

    public function find($id, $columns = ['*'])
    {
        return $this->model->find($id, $columns);
    }

    public function findBy($attribute, $value, $columns = array('*'))
    {
        return $this->model->findBy($attribute, $value, $columns);
    }

    public function update($id, array $args)
    {
        return $this->model->update($id, $args);
    }

    public function insert(array $attributes)
    {
        return $this->model->insert($attributes);
    }

    public function destroy($id)
    {
        return $this->model->destroy($id);
    }
}
