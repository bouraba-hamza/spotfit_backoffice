<?php

namespace App\Http\Controllers;

use App\Http\Requests\UpdateSetting;
use App\Repositories\SettingRepository;

class SettingController extends Controller
{
    protected $setting;

    public function __construct(SettingRepository $setting)
    {
        $this->setting = $setting;
    }

    public function index()
    {
        return $this->setting->all();
    }

    public function show($key)
    {
        return $this->setting->findBy("key", $key);
    }

    public function update(UpdateSetting $request, $key)
    {
        $setting = $this->setting->findBy("key", $key);
        if (!$setting) abort(404);
        $this->setting->update($setting->id, $request->only(["value"]));

        return $setting;
    }
}
