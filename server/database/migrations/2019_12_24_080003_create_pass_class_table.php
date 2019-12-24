<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePassClassTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('class_pass', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('pass_id')->unsigned();
            $table->integer('class_id')->unsigned();
            $table->integer('prix_min')->nullable();
            $table->integer('prix_max')->nullable();
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
        Schema::dropIfExists('class_pass');
    }
}
