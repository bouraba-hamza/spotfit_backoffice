<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Classes;
use Faker\Generator as Faker;

$factory->define(Classes::class, function (Faker $faker) {
    return [
                'name' => $faker->lastName,
                'image' => $faker->imageUrl($width = 640, $height = 480),
                'prix_min' => $faker->randomNumber(2),
                'prix_max' => $faker->randomNumber(2),
    ];
});
