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
            $table->integer('group_id');
            $table->text('logo')->nullable();
            $table->string('name');
            $table->float('rate', 8, 2);
            $table->text('qrcode')->nullable();
            $table->unsignedInteger('class_id');
            $table->json('facilities');
            $table->json('planning')->comment(
                "format: \"{\"dayofweek(int)\": [{\"from\":\"hh:mm:ss\", \"to\": \"hh:mm:ss\",\"activity\": {name:\"cardio\", gender: \"male\", image: \"/path/to/image.png\"}}]}\""
            );



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
