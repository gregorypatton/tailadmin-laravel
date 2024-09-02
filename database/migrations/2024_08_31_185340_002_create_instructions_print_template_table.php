<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

return new class extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('instructions_print_template', function (
            Blueprint $table
        ) {
            $table->bigInteger('print_template_id')->unsigned();
            $table->bigInteger('instruction_id')->unsigned();

            $table
                ->foreign('print_template_id')
                ->references('id')
                ->on('print_templates')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table
                ->foreign('instruction_id')
                ->references('id')
                ->on('instructions')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('instructions_print_template');
    }
};
