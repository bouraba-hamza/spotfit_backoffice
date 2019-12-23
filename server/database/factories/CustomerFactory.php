<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Customer;
use Faker\Generator as Faker;

$factory->define(Customer::class, function (Faker $faker) {
    return [
        'qrcode' => $faker->md5,
        'firstName' => $faker->firstNameMale,
        'lastName' => $faker->lastName,
        'gender' => $faker-> randomElement($array = array ('m', 'f')),
        'birthDay' => $faker->date('Y-m-d', 'now'),
        'phoneNumber' => $faker->phoneNumber,
        'cin' => $faker->text,
        'jobTitle' => $faker->jobTitle,
        'avatar' => $faker->imageUrl($width = 640, $height = 480),
        'ambassador' => $faker-> randomElement($array = array (0, 1)),
    ];
});
