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

        // Subscriptoins
        \App\Subscription::insert(["name" => "daily", "duration" => "24"]);
        \App\Subscription::insert(["name" => "monthly", "duration" => "672"]);
        \App\Subscription::insert(["name" => "yearly", "duration" => "‭8,064‬"]);

        // Customer subscriptions
        \App\customerSubscription::create(
            [
                "customer_id" => 1,
                "subscription_id" => 1,
                "price" => 30,
                "consumption_date_begin" => now(),
                "consumption_date_end" => now(),
            ]
        );

        \App\customerSubscription::create(
            [
                "customer_id" => 2,
                "subscription_id" => 2,
                "price" => 70,
                "consumption_date_begin" => now()->addHour(5),
                "consumption_date_end" => now()->addMonth(1)->addHour(5),
            ]
        );

        // Sponsoring
        \App\Customer::first()->sponsorships()->create(
            [
                "customer_subscription_id" => 2,
                "amount" => 3,
                "code" => \Illuminate\Support\Str::random(),
                "date" => now(),
            ]
        );


    }
}
