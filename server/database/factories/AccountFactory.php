<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */


use App\User;
use Faker\Generator as Faker;
use Illuminate\Support\Str;

$factory->define(App\Account::class, function (Faker $faker) {
    return [
        'username' => $faker->userName,
        'email' => $faker->unique()->safeEmail,
        'email_verified_at' => now(),
        'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', // password
        'disabled' => $faker->randomElement([0,1]),
        'owner_id' => 1,
        'owner' => $faker->randomElement(['App\Partner', 'App\Customer', 'App\Admin'])
    ];
});
