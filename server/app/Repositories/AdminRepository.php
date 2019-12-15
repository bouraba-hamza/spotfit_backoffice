<?php


namespace App\Repositories;

use App\Admin;

class AdminRepository implements EloquentRepositoryInterface
{
    protected $model;
    protected $accountRepository;
    protected $addressRepository;

    public function __construct(Admin $admin, AccountRepository $accountRepository, AddressRepository $addressRepository)
    {
        $this->model = new BaseRepository($admin);
        $this->accountRepository = $accountRepository;
        $this->addressRepository = $addressRepository;
    }

    public function all($columns = ['*'])
    {
        return $this->model->all();
    }

    public function findBy($attribute, $value, $columns = array('*'))
    {
        return $this->model->findBy($attribute, $value, $columns);
    }

    public function update($id, array $args)
    {
        $admin = $this->find($id);

        // update the account
        $admin->account()->first()->update($args["account"]);
        // finally the address
        $admin->address()->first()->update($args["address"]);
        // the the admin profile
        $admin->update($args);

        return $admin;
    }

    public function find($id, $columns = ['*'])
    {
        return $this->model->find($id, $columns);
    }

    public function insert(array $attributes)
    {
        $attributes['account_id'] = $this->accountRepository->insert($attributes['account'])->id;
        if (isset($attributes['address'])) {
            $attributes['address_id'] = $this->addressRepository->insert($attributes['address'])->id;
        }

        return $this->model->insert($attributes);
    }

    public function destroy($id)
    {
        return $this->model->destroy($id);
    }
}
