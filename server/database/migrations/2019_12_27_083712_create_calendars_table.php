<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCalendarsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        /*sex,*/
        /*activity,*/
        /*interval,*/
        Schema::create('calendars', function (Blueprint $table) {
            $table->bigIncrements('id');
            /*$table->json('mo');
            $table->json('tu');
            $table->json('we');
            $table->json('th');
            $table->json('fr');
            $table->json('sa');
            $table->json('su');*/
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
        Schema::dropIfExists('calendars');
    }
}
