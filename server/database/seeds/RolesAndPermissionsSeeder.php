<?php

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;

class RolesAndPermissionsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Reset cached roles and permissions
        app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();

        $roles = [
            "admin",
            "partner",
            "customer",
            "trainer",
            "supervisor",
            "receptionists",
        ];

        foreach ($roles as $r) {
            Role::create(['name' => $r, 'guard_name' => 'api']);
        }
    }
}
