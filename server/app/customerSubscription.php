<?php

namespace App;

use Illuminate\Database\Eloquent\Relations\Pivot;

class customerSubscription extends Pivot
{
    public function customer() {
        return $this->hasOne(Customer::class, "id", "customer_id");
    }
}
