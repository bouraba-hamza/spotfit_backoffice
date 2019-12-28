<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEquipmentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('equipments', function (Blueprint $table) {
              $table->bigIncrements('id');
                        $table->text('libelle')->nullable();
//                         $table->string('code_barre');
//                         $table->text('state')->nullable();
                        $table->float('rate', 8, 2);
                        $table->unsignedInteger('gym_id');
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
        Schema::dropIfExists('equipments');
    }
}
