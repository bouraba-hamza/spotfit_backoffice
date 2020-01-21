<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Gym;
use Faker\Generator as Faker;

$factory->define(Gym::class, function (Faker $faker) {
    return [
        "group_id" => 1,
        "logo" => $faker->imageUrl(640, 480),
        "name" => $faker->words(3, true),
        "rate" => $faker->numberBetween(1, 5),
        "qrcode" => $faker->md5,
        "class_id" => 1,
        "facilities" => json_encode([]),
        "planning" => json_encode([]),
    ];
});
