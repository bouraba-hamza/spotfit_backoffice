<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        factory(App\Customer::class, 5)->create();
        factory(App\Admin::class, 5)->create();
        factory(App\Partner::class, 5)->create();
        factory(App\Trainer::class, 5)->create();
    }
}
