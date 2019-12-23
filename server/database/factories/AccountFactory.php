<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */


use Faker\Generator as Faker;


$factory->define(\App\Account::class, function (Faker $faker) {
    $accountables = [
        App\Admin::class,
        App\Partner::class,
        App\Customer::class,
        App\Trainer::class,
    ];

    $accountableType = $faker->randomElement($accountables);
    $accountable = factory($accountableType)->create();

    return [
        'username' => $faker->userName,
        'email' => $faker->unique()->safeEmail,
        'email_verified_at' => now(),
        'password' => bcrypt('password'),
        'disabled' => $faker->randomElement([0, 1]),
        'accountable_type' => $accountableType,
        'accountable_id' => $accountable->id,
    ];
});
