<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePrepDetailsTable extends Migration
{
    public function up()
    {
        Schema::create('prep_details', function (Blueprint $table) {
            $table->id();
            $table->string('name', 255);  // Name or identifier for the prep detail
            $table->text('instructions')->nullable();  // Detailed instructions for preparation
            $table->unsignedBigInteger('created_by')->nullable();  // References the user who created the prep detail
            $table->unsignedBigInteger('updated_by')->nullable();  // References the user who last updated the prep detail
            $table->softDeletes();  // Adds deleted_at column for soft deletes
            $table->timestamps();  // Adds created_at and updated_at columns

            // Foreign key constraints
            $table->foreign('created_by')->references('id')->on('users')->onDelete('set null');
            $table->foreign('updated_by')->references('id')->on('users')->onDelete('set null');
        });
    }

    public function down()
    {
        Schema::dropIfExists('prep_details');
    }
}
