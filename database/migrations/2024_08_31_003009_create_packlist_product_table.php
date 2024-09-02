<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('packlist_product', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('packlist_id');  // References the packlist
            $table->unsignedBigInteger('product_id');  // References the product
            $table->integer('quantity');  // Quantity of the product in the packlist
            $table->timestamps();  // Adds created_at and updated_at columns

            // Foreign keys
            $table->foreign('packlist_id')->references('id')->on('packlists')->onDelete('cascade');
            $table->foreign('product_id')->references('id')->on('products')->onDelete('cascade');

            // Unique constraint to prevent duplicate product entries in the same packlist
            $table->unique(['packlist_id', 'product_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('packlist_product');
    }
};
