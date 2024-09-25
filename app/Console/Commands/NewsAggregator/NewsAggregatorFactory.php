<?php
namespace App\Console\Commands\NewsAggregator;

use App\Console\Commands\NewsAggregator\Aggregators\NewsAggregator;
use App\Console\Commands\NewsAggregator\Aggregators\NewsApiAggregator;
use App\Console\Commands\NewsAggregator\Aggregators\NYTAggregator;

class NewsAggregatorFactory
{

    static function getInstance($provider): NewsAggregator | null{
        if($provider == "newsapi"){
            return new NewsApiAggregator();
        }
        if($provider == "nyt"){
            return new NYTAggregator();
        }
        return null;
    }
}
