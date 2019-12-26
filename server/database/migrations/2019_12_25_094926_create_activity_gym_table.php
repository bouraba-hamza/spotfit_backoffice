<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateActivityGymTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('gym_activity', function (Blueprint $table) {
           $table->integer('activity_id')->unsigned();

           $table->integer('gym_id')->unsigned();

            $table->foreign('activity_id')->references('id')->on('activity')
            ->onDelete('cascade');
            $table->foreign('gym_id')->references('id')->on('gyms')
             ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('activity_gym');
    }
}
