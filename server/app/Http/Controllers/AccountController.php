<?php

namespace App\Http\Controllers;

use App\Repositories\Repository;
use Illuminate\Http\Request;

class AccountController extends Controller
{
    private $model;

    public function __construct(App\Account $model)
    {
        $this->model = new Repository($model);
    }

    public function index()
    {
        return $this->model->all();
    }

    public function show($id)
    {
        return $this->model->find($id);
    }

    public function update(Request $request, $id)
    {
        $args = $request->only($this->model->fillable);
        return $this->model->update($id, $args);
    }

    public function store(Request $request)
    {
        return $this->model->insert($request->only($this->model->fillable));
    }

    public function disable($id)
    {
        return $this->model->update($id, ['disabled' => '1']);
    }

    public function enable($id)
    {
        return $this->model->update($id, ['disabled' => '0']);
    }
}
