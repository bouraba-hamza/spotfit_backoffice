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


        // Calling other seeders
        $this->call([RolesAndPermissionsSeeder::class]);

        factory(\App\Account::class, 50)
            ->create()
            ->each(function ($account) {

                $x = $account->accountable()->first();


                $x->address()->save(factory(App\Address::class)->make());


                if ($x instanceof \App\Admin)
                    $user_role = 'admin';
                else if ($x instanceof \App\Partner)
                    $user_role = 'partner';
                else if ($x instanceof \App\Customer)
                    $user_role = 'customer';
                else if ($x instanceof \App\Trainer)
                    $user_role = 'trainer';
                else if ($x instanceof \App\Supervisor)
                    $user_role = 'supervisor';
                else if ($x instanceof \App\Receptionist)
                    $user_role = 'receptionist';

                if (isset($user_role))
                    $account->assignRole($user_role);
            });


        // Settings
        \App\Setting::insert(["key" => "sponsorship-rate", "value" => 0]);
        \App\Setting::insert(["key" => "ambassador-sponsorship-rate", "value" => 10]);


        // Fake user
        \App\Account::first()->update(["username" => "@verify", "password" => "password", "disabled" => 0]);
    }
}
