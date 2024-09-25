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
        Schema::create('news', function (Blueprint $table) {
            $table->integer('id', true);
            $table->timestamp('published_at')->nullable()->index('publish_time');
            $table->string('title', 140)->index('title');
            $table->string('description', 500)->default('')->index('description');
            $table->string('url')->index('url');
            $table->string('image_url', 500)->nullable();
            $table->integer('publisher_id')->nullable()->index('publisher_id');
            $table->integer('aggregator_id')->nullable()->index('aggregator_id');
            $table->integer('category_id')->nullable()->index('news_category');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('news');
    }
};
