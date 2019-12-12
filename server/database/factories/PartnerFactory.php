<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Partner;
use Faker\Generator as Faker;

$factory->define(Partner::class, function (Faker $faker) {
    return [
        'firstName' => $faker->firstNameMale,
        'lastName' => $faker->lastName,
        'gender' => $faker-> randomElement($array = array ('m', 'f')),
        'birthDay' => $faker->date('Y-m-d', 'now'),
        'phoneNumber' => $faker->phoneNumber,
        'cin' => $faker->text,
        'jobTitle' => $faker->jobTitle,
        'avatar' => $faker->imageUrl($width = 640, $height = 480),
        'address_id' => factory(App\Address::class),
        'account_id' => factory(App\Account::class),
    ];
});
