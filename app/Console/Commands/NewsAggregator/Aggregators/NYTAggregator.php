<?php

namespace App\Console\Commands\NewsAggregator\Aggregators;

use App\Console\Commands\NewsAggregator\News;
use App\Models\Aggregator;
use App\Models\Category;
use App\Models\Country;
use App\Models\Language;
use App\Models\Publisher;
use Carbon\Carbon;
use Illuminate\Support\Facades\Http;

class NYTAggregator implements NewsAggregator
{
    protected $aggregator_name = "nyt";
    private $httpClient;
    private $publisher_id;

    private $aggregator_id;

    function __construct()
    {
        $this->httpClient = Http::baseUrl("https://api.nytimes.com/svc/search/v2/");
        $language_id = Language::firstOrCreate(["name" => "en"])->id;
        $country_id = Country::firstOrCreate(["name" => "us"])->id;
        $category_id = Category::firstOrCreate(["name" => "general"])->id;
        $this->publisher_id = Publisher::firstOrCreate(["url" => "https://nytimes.com","slug"=> "the_new_york_times", "name" => "The New York Times", "language_id" => $language_id, "country_id" => $country_id, "category_id" => $category_id])->id;
        $this->aggregator_id = Aggregator::firstOrCreate(["name"=>"nyt"])->id;
    }

    function sync()
    {
        // $this->syncMeta();
        $this->syncNews();
    }

    private function syncNews()
    {
        $count = 0;
        $page = 10;
        $begin_date = Carbon::now()->subDay()->format("Ymd");
        $end_date = Carbon::now()->format("Ymd");
        do {
            $data = $this->callApi($begin_date, $end_date, $page);
            foreach ($data as $d) {
                $published_at = Carbon::parse($d["pub_date"]);
                $category_id = Category::firstOrCreate(["name" => strtolower($d["news_desk"])])->id;
                $title = $d["headline"]["main"];
                $description = $d["abstract"];
                $url = $d["web_url"];
                $image_url = null;
                if(count($d["multimedia"])){
                    $image_url = "https://www.nytimes.com/".$d["multimedia"][0]["url"];
                }
                $news = new News($published_at,$title,$description,$url,$image_url,$this->publisher_id,$category_id,$this->aggregator_id);
                $news->save();
            }
            $count = count($data);
            echo "page $page count $count\n";
            $page++;
        } while ($count > 0);

    }


    function callApi($begin_date = "20231001", $end_date = "20231002", $page = 0)
    {
        sleep(10); // This sleep because adding artifical delay because the free version of api only allows 10 request per minute.

        $response = $this->httpClient->get("articlesearch.json?begin_date=$begin_date&end_date=$end_date&page=$page&api-key=" . env("NYT_KEY"));

        if (!$response->ok()) {
            $s = (string) $response->body();
            throw new \Exception("Error calling API:".$s);
        }
        $data = (array)$response->json();
        //  dd($data);
//        if(!isset($data["response"]["docs"]) ){
//            throw new \Exception("Error on parsing API");
//        }
        return $data["response"]["docs"];
    }
}
