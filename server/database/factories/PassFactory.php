<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Pass;
use Faker\Generator as Faker;

$factory->define(Pass::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
         'image' => $faker->imageUrl($width = 640, $height = 480),
         'duration' => $faker->randomNumber(2),
           ];
});
