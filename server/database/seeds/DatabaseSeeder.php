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
        factory(App\Account::class, 5)
            ->create()
            ->each(function ($account) {
                $account->accountable()->first()->address()->save(factory(App\Address::class)->make());
            });
    }
}
