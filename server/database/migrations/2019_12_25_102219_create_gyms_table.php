<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGymsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('gyms', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->text('logo')->nullable();
            $table->string('name');
//             $table->json('planing');
            $table->float('rate', 8, 2);
            $table->json('facilities');
            //Todo ajouter la matrice des prix en fonction du passe liaison enre gym et passe
            $table->text('qrcode')->nullable();
            $table->unsignedInteger('class_id');
                        $table->foreign('class_id')->references('id')->on('classes')
                            ->onDelete('restrict')
                            ->onUpdate('restrict');
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
        Schema::dropIfExists('gyms');
    }
}
