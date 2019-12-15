<?php

namespace App\Repositories;

use Illuminate\Database\Eloquent\Model;

class Repository implements RepositoryInterface
{
    protected $model;

    public function __construct(Model $model)
    {
        $this->model = $model;
    }

    public function all($columns = ['*'])
    {
        return $this->model->get($columns);
    }

    public function find($id, $columns = ['*'])
    {
        return $this->model->findOrFail($id, $columns);
    }

    public function findBy($attribute, $value, $columns = array('*'))
    {
        return $this->model->where($attribute, $value)->first($columns);
    }

    public function update($id, Array $args)
    {
        $this->model->findOrFail($id)->update($args);
    }

    public function insert(Array $attributes)
    {
        return $this->model->create($attributes);
    }

    public function getModel(): Model
    {
        return $this->model;
    }

    public function setModel(Model $model): void
    {
        $this->model = $model;
    }

    public function with($relationShip)
    {
        return $this->model->with($relationShip);
    }

    public function destroy($id)
    {
        $this->model->destroy($id);
    }
}
