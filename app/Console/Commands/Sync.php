<?php

namespace App\Console\Commands;

use App\Console\Commands\NewsAggregator\NewsAggregatorFactory;
use App\Console\Commands\NewsProviders\NewsProvidrFactory;
use Illuminate\Console\Command;

class Sync extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'sync';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $providers = ["newsapi","nyt"];
        foreach($providers as $provider){
          NewsAggregatorFactory::getInstance($provider)->sync();
        }
    }
}
