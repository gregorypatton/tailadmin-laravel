<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        // 1. Create Packlists Table
        Schema::create('packlists', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id'); // References the user who created the packlist
            $table->unsignedBigInteger('created_by')->nullable(); // References the user who originally created the record
            $table->unsignedBigInteger('updated_by')->nullable(); // References the user who last updated the record
            $table->unsignedBigInteger('channel_id'); // References the channel (amazon, walmart, etc.)
            $table->string('state', 50)->default('draft'); // For Spatie state management
            $table->softDeletes(); // Adds deleted_at column
            $table->timestamps(); // Adds created_at and updated_at columns

            // Foreign keys
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('created_by')->references('id')->on('users')->onDelete('set null');
            $table->foreign('updated_by')->references('id')->on('users')->onDelete('set null');
            $table->foreign('channel_id')->references('id')->on('channels')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('packlists');
    }
};
