<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\File;

class ProfilePictureController extends Controller
{
    public function getAvatar($filename)
    {
        $path = storage_path('app/avatars/' . $filename);

        if (!File::exists($path)) {
            abort(404);
        }

        return response()->make(File::get($path), 200, ['Content-type' => File::mimeType($path)]);
    }
}
