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
        factory(App\Classes::class, 3)->create();
        factory(App\Subscription::class, 3)->create();

        factory(\App\Account::class, 50)
            ->create()
            ->each(function ($account) {

                $x = $account->accountable()->first();
                $x->address()->save(factory(App\Address::class)->make());

                // check if is instance of \App\Customer
                if ($x instanceof \App\Customer) {
                    // generate a random sponsorship code
                    \Log::info($x);
                }
            });

        // Settings
        \App\Setting::insert(["key" => "sponsorship-rate", "value" => 0]);
        \App\Setting::insert(["key" => "ambassador-sponsorship-rate", "value" => 10]);
    }
}
