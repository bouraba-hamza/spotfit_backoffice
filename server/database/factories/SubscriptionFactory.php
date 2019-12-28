<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use Faker\Generator as Faker;

$factory->define(\App\Subscription::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
        'image' => $faker->imageUrl(640,480),
        'description' => $faker->text(200),
        'duration' => $faker->randomNumber(2),
    ];
});
