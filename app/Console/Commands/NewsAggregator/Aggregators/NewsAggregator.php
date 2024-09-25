<?php
namespace App\Console\Commands\NewsAggregator\Aggregators;

interface NewsAggregator{
    function sync();
}
