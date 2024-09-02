<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBrandsTable extends Migration
{
    public function up()
    {
        Schema::create('brands', function (Blueprint $table) {
            $table->id();  // Primary key
            $table->string('name', 255);  // Name of the brand
            $table->string('slug', 255)->unique();  // Unique slug for the brand (used for URLs, etc.)
            $table->softDeletes();  // Adds deleted_at column for soft deletes
            $table->timestamps();  // Adds created_at and updated_at columns
        });
    }

    public function down()
    {
        Schema::dropIfExists('brands');
    }
}
