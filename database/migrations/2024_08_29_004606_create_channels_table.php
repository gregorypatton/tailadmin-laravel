<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateChannelsTable extends Migration
{
    public function up()
    {
        Schema::create('channels', function (Blueprint $table) {
            $table->id();  // Primary key
            $table->string('name', 255);  // Name of the channel (e.g., Amazon, Walmart)
            $table->string('slug', 255)->unique();  // Unique slug for the channel (used for URLs, etc.)
            $table->softDeletes();  // Adds deleted_at column for soft deletes
            $table->timestamps();  // Adds created_at and updated_at columns
        });
    }

    public function down()
    {
        Schema::dropIfExists('channels');
    }
}
