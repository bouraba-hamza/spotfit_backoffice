<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Trainer;
use Faker\Generator as Faker;

$factory->define(Trainer::class, function (Faker $faker) {
    return [
        'weight' => $faker->numberBetween(25, 300),
        'length' => $faker->randomFloat(1, 1, 4),
        'firstName' => $faker->firstNameMale,
        'lastName' => $faker->lastName,
        'gender' => $faker-> randomElement($array = array ('m', 'f')),
        'birthDay' => $faker->date('Y-m-d', 'now'),
        'phoneNumber' => $faker->phoneNumber,
        'jobTitle' => $faker->jobTitle,
        'avatar' => $faker->imageUrl($width = 640, $height = 480),
        'address_id' => factory(App\Address::class),
        'account_id' => factory(App\Account::class),
    ];
});
