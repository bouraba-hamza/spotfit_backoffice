<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStatusesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('statuses', function (Blueprint $table) {
            $table->tinyInteger('id');
            $table->enum('name', [
                "reserved",
                "confirmed",
                "expired",
                "canceled",
                "activated",
            ])->comment("
                #reserved
                payment keeps pending (cache).
                #confirmed
                payed and not utilized yet.
                #expired
                consumption date exceeded.
                #canceled
                canceling before consumption date out.
                #activated
                consumed but still under expiration date and does'nt exceed number of sessions.
            ");
            $table->string('color');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('statuses');
    }
}
