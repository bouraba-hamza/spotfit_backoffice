<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Activity;
use Faker\Generator as Faker;

$factory->define(Activity::class, function (Faker $faker) {
     return [
            'name' => $faker->name,
            'icon' => $faker->imageUrl($width = 640, $height = 480),
            ];
});
