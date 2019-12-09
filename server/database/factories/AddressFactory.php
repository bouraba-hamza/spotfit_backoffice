<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Address;
use Faker\Generator as Faker;

$factory->define(Address::class, function (Faker $faker) {
    return [
        'street' => $faker->streetAddress,
        'province' => $faker->state,
        'state' => $faker->stateAbbr,
        'region' => $faker->state,
        'city' => $faker->city,
        'country' => $faker->country,
        'postcode' => $faker->postcode,
        'latitude' => $faker->latitude(-90, 90),
        'longitude' => $faker->longitude(-180, 180),
        'buildingNumber' => $faker->buildingNumber,
    ];
});
