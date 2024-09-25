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
        Schema::table('publishers', function (Blueprint $table) {
            $table->foreign(['category_id'], 'publisher_category')->references(['id'])->on('categories')->onUpdate('SET NULL')->onDelete('SET NULL');
            $table->foreign(['language_id'], 'publisher_language')->references(['id'])->on('languages')->onUpdate('SET NULL')->onDelete('SET NULL');
            $table->foreign(['country_id'], 'publisher_country')->references(['id'])->on('countries')->onUpdate('SET NULL')->onDelete('SET NULL');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('publishers', function (Blueprint $table) {
            $table->dropForeign('publisher_category');
            $table->dropForeign('publisher_language');
            $table->dropForeign('publisher_country');
        });
    }
};
