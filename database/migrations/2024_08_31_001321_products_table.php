<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('sku', 100);
            $table->string('title', 255)->nullable();
            $table->enum('id_type', ['ASIN', 'UPC', 'FNSKU'])->nullable();
            $table->string('sellable_id', 100)->nullable();
            $table->string('gtin', 14)->nullable();
            $table->string('fnsku', 100)->nullable();
            $table->unsignedBigInteger('brand_id')->nullable();  // Foreign key to brands table
            $table->string('default_label_template', 255)->nullable();
            $table
                ->unsignedBigInteger('image_id')->nullable();
            $table->unsignedBigInteger('prep_detail_id')->nullable();  // Foreign key to prep details table
            $table->unsignedBigInteger('channel_id')->nullable();  // Foreign key to channels table
            $table->string('state', 50)->default('draft');  // For Spatie state management
            $table->unsignedBigInteger('created_by')->nullable();  // After state column
            $table->unsignedBigInteger('updated_by')->nullable();  // After created_by column

            $table->softDeletes();  // Adds deleted_at column
            $table->timestamps();  // Adds created_at and updated_at columns

            // Foreign keys
            $table->foreign('created_by')->references('id')->on('users')->onDelete('set null');
            $table->foreign('updated_by')->references('id')->on('users')->onDelete('set null');

            // Indexes and foreign keys
            $table->unique(['sku', 'channel_id']);
            $table->foreign('prep_detail_id')->references('id')->on('prep_details')->onDelete('set null');
            $table->foreign('brand_id')->references('id')->on('brands')->onDelete('set null');
            $table->foreign('channel_id')->references('id')->on('channels')->onDelete('set null');
        });
    }

    public function down()
    {
        Schema::dropIfExists('products');
    }
};
