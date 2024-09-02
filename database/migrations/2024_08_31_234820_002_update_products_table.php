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
        Schema::table('products', function (Blueprint $table) {
            $table
                ->bigInteger('catalog_id')
                ->unsigned()
                ->after('default_template_id');
            $table
                ->foreign('catalog_id')
                ->references('id')
                ->on('catalogs')
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
        Schema::table('products', function (Blueprint $table) {
            $table->dropColumn('catalog_id');
            $table->dropForeign('products_catalog_id_foreign');
        });
    }
};
