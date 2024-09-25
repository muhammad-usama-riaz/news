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
        Schema::create('publishers', function (Blueprint $table) {
            $table->integer('id', true);
            $table->string('slug')->nullable()->unique('slug');
            $table->string('name')->unique('name');
            $table->string('url', 500)->nullable();
            $table->integer('category_id')->nullable()->index('publisher_category_id');
            $table->integer('country_id')->nullable()->index('publisher_country_id');
            $table->integer('language_id')->nullable()->index('language_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('publishers');
    }
};
