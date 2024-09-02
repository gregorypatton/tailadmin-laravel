<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration

{
    public function up()
    {
        Schema::create('product_components', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('product_id');  // The parent product ID
            $table->unsignedBigInteger('component_id');  // The component product ID
            $table->integer('quantity');  // Quantity of the component required
            $table->timestamps();  // Adds created_at and updated_at columns

            // Foreign keys
            $table->foreign('product_id')->references('id')->on('products')->onDelete('cascade');
            $table->foreign('component_id')->references('id')->on('products')->onDelete('cascade');

            // Unique constraint to prevent duplicate components for the same product
            $table->unique(['product_id', 'component_id']);
        });
    }

    public function down()
    {
        Schema::dropIfExists('product_components');
    }
};
