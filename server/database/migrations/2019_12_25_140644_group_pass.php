<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class GymPass extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
         Schema::create('group_pass', function (Blueprint $table) {
                   $table->integer('pass_id')->unsigned();
                   $table->integer('group_id')->unsigned();
                   $table->float('price')->nullable();

                    $table->foreign('pass_id')->references('id')->on('passes')
                            ->onDelete('restrict')
                    $table->foreign('group_id')->references('id')->on('groups')
                            ->onDelete('restrict')
                });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('group_pass');
    }
}
