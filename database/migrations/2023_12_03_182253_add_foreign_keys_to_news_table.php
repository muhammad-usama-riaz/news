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
        Schema::table('news', function (Blueprint $table) {
            $table->foreign(['aggregator_id'], 'news_aggregator')->references(['id'])->on('aggregators')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(['publisher_id'], 'news_publisher')->references(['id'])->on('publishers')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(['category_id'], 'news_category')->references(['id'])->on('categories')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('news', function (Blueprint $table) {
            $table->dropForeign('news_aggregator');
            $table->dropForeign('news_publisher');
            $table->dropForeign('news_category');
        });
    }
};
