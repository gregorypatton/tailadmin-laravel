<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;


return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('print_templates', function (Blueprint $table) {
            $table->id(); // Auto-incrementing ID
            $table->string('name')->unique(); // Unique name field
            $table->integer('avery_id')->nullable()->unsigned()->length(10); // Nullable int(10) column
            $table->integer('labels_per_page')->notNullable(); // Integer field not null
            $table->foreignId('user_id')->constrained('users'); // Foreign key to Users table
            $table->string('state'); // String column for state
            $table->timestamps(); // Created at and updated at timestamps
            $table->softDeletes(); // Soft delete timestamp

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('print_templates');
    }
};
