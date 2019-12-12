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
        factory(App\Customer::class, 50)->create();
        factory(App\Admin::class, 50)->create();
        factory(App\Partner::class, 50)->create();
        factory(App\Trainer::class, 50)->create();
    }
}
