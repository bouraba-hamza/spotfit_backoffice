<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGymSubscriptionTypesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('gym_subscription_types', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('gym_id'); // city club, uniqueclub, passage fitness
            $table->integer('subscription_id'); // daily, monthly, yearly
            $table->integer('type_id'); // strict, partout
            $table->float('price');
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
        Schema::dropIfExists('gym_subscription_types');
    }
}
