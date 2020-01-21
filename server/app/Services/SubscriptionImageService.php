<?php


namespace App\Services;


use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class SubscriptionImageService
{
    const BASE_DIR = "pass/";

    public function store($image)
    {
        $fake_name = Str::slug(Str::random(7) . '_' . $image->getClientOriginalName(), '.');
        $path = Storage::putFileAs(self::BASE_DIR, $image, $fake_name);
        return ["fakeName" => $fake_name, "path" => $path];
    }

    public function update($fakeName, $image)
    {
        // delete the old image
        $this->remove($fakeName);
        // generate a random name as prefix
        $fake_name = Str::slug(Str::random(7) . '_' . $image->getClientOriginalName(), '.');
        // save the file
        $path = \Storage::putFileAs(self::BASE_DIR, $image, $fake_name);
        return ["fakeName" => $fake_name, "path" => $path];
    }

    public function remove($fakeName)
    {
        Storage::delete(self::BASE_DIR . $fakeName);
    }
}
