<?php

namespace App\Http\Controllers;

use App\Admin;
use App\Http\Requests\AdminRequest;
use App\Repositories\AccountRepository;
use App\Repositories\AddressRepository;
use App\Repositories\AdminRepository;
use App\Services\ProfileAvatarService;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Validator;

class AdminController extends Controller
{
    const VALIDATION_MESSAGES = [
        'birthDay.date_format' => "la date de naissance dois respecter le format Année-Mois-jour",
        'avatar.image' => "la photo de profile  dois respecter le format d'image ",
        'account.email.required' => "le champ email est requis",
        'account.email.email' => "il faut respecter le format de mail",
        'account.email.unique' => "l'email déjà pris",
        'account.username.required' => "le champ login est requis",
        'account.username.unique' => "le nom d'utilisateur déjà pris",
        'account.password.required' => "le champ mote de passe est requis",
        'account.password.min' => "la longueur du mot de passe doit être d'au moins 6 caractères",
    ];

    protected $adminRepository;
    protected $accountRepository;
    protected $addressRepository;
    protected $profileAvatarService;

    public function __construct(AdminRepository $adminRepository, AccountRepository $accountRepository, AddressRepository $addressRepository, ProfileAvatarService $profileAvatarService)
    {
        $this->adminRepository = $adminRepository;
        $this->accountRepository = $accountRepository;
        $this->addressRepository = $addressRepository;
        $this->profileAvatarService = $profileAvatarService;
    }

    public function index()
    {
        return $this->adminRepository->all();
    }

    public function store(AdminRequest $request)
    {
        // filter unwanted inputs from request
        $admin = $request->all();

        // save the file in storage
        if ($request->hasFile("avatar")) {
            $admin["avatar"] = $this->profileAvatarService->store($request->file('avatar'))["fakeName"];
        }

        // create admin account
        $admin_id = $this->adminRepository->insert($admin)->id;

        // return the id of the resource just created
        return ['admin_id' => $admin_id];
    }

    public function show($admin_id)
    {
        return $this->adminRepository->find($admin_id);
    }

    public function update(Request $request, $admin_id)
    {
        // check if the the requested resource exist in database
        $admin = $this->adminRepository->find($admin_id);
        $data = $request->all();

        $validator = Validator::make($data, [
            'gender' => 'in:m,f',
            'birthDay' => 'date_format:Y-m-d',
            'avatar' => 'image',
            'account.email' => 'required|email|unique:accounts,email,' . $admin->account->id,
            'account.username' => 'required|unique:accounts,username,' . $admin->account->id,
            'account.password' => 'min:6',
        ], self::VALIDATION_MESSAGES);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()]);
        }

        if ($request->hasFile("avatar")) {
            $data["avatar"] = $this->profileAvatarService->update($admin->avatar, $request->file("avatar") )["fakeName"];
        }

        $this->adminRepository->update($admin_id, $data);

        return ['admin_id' => $admin_id];
    }

    public function destroy($admin_id)
    {
        $this->adminRepository->destroy($admin_id);
        return ['status' => 'success', 'deleted_resource_id' => $admin_id];
    }
}
