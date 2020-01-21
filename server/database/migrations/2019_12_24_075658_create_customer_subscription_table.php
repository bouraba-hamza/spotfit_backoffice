<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomerSubscriptionTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customer_subscription', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('customer_id');
            $table->integer('group_subscription_id');
            $table->integer('group_subscription_type_id');
            $table->float('price');
            $table->text('qrcode');
            $table->integer('payment_method_id');
            $table->dateTime('consumed_at');
            $table->integer('remaining_sessions');


            // #forgotten
            // if(consumed_at + 1min  > now && activated_at === null)
            // #expired
            // if(consumed_at + 1min  < activated_at && activated_at != null)
            // #canceled
            // if(canceled_at != null)

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('customer_subscription');
    }
}
