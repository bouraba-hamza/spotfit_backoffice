<?php


namespace App\Repositories;

use App\Account;
use App\Mail\AccountCreated;
use Illuminate\Support\Facades\Mail;

class AccountRepository extends BaseRepository implements EloquentRepositoryInterface
{
    protected $model;

    public function __construct(Account $account)
    {
        $this->model = new BaseRepository($account);
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
        $account = $this->model->insert($attributes);
        Mail::to($account->email)->send(new AccountCreated($account));
        return $account;
    }

    public function destroy($id)
    {
        return $this->model->destroy($id);
    }
}
