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

class NewsApiAggregator implements NewsAggregator
{
    private $httpClient;
    private  $countries = array(
        'ae', 'ar', 'at', 'au', 'be', 'bg', 'br', 'ca', 'ch', 'cn', 'co', 'cu', 'cz', 'de', 'eg', 'fr', 'gb', 'gr',
        'hk', 'hu','id','ie','il','in','it','jp','kr','lt','lv','ma','mx','my','ng','nl','no','nz','ph','pl', 'pt',
        'ro','rs','ru','sa','se','sg','si','sk','th','tr','tw','ua','us','ve','za');

    private  $languages = array('ar','en','cn','de','es','fr','he','it','nl','no','pt','ru','sv','ud');
    private  $categories = array('business', 'entertainment', 'general', 'health', 'science', 'sports', 'technology');
    private $aggregator_id;

    function __construct(){
        $this->httpClient =  Http::withHeaders([
            'x-api-key' => env("NEWS_API_KEY")
        ])->baseUrl('https://newsapi.org/v2');
        $this->aggregator_id = Aggregator::firstOrCreate(["name"=>"newsapi"])->id;

    }
    function sync(){
     // $this->syncMeta();
      $this->syncNews();
    }

    private function syncNews(){
       foreach( Publisher::select(["id","slug","category_id"])->get() as $publisher){
           $source = $publisher->slug;
          try{
              $data = $this->callApi("everything?sources=$source","articles");
              foreach($data as $d ){
                  $published_at = Carbon::parse($d["publishedAt"])->toDateTimeString();
                  $news = new News($published_at,$d["title"],$d["description"],$d["url"],$d["urlToImage"],$publisher->id,$publisher->category_id,$this->aggregator_id);
                  $news->save();
              }
          }catch (\Exception $ex){

          }
       }

    }
    private function syncMeta(){
        $this->syncCountries();
        $this->syncCategories();
        $this->syncLanguages();
        $this->syncSources();
    }
    private function syncCountries(){
        Country::upsert(array_map(function ($n){return ["name"=>$n];},$this->countries),[ "name" ]);
    }
    private function syncLanguages(){
        Language::upsert(array_map(function ($n){return ["name"=>$n];},$this->languages),[ "name" ]);
    }

    private function syncCategories(){
        Category::upsert(array_map(function ($n){return ["name"=>$n];},$this->categories),[ "name" ]);
    }
    private function syncSources(){
        $data = $this->callApi("sources","sources");
        foreach($data as $s){
            $language = Language::firstOrCreate(["name" => $s["language"] ]);
            $category = Category::firstOrCreate(["name"=>$s["category"]]);
            $country = Country::firstOrCreate(["name"=>$s["country"]]);

            Publisher::updateOrCreate([
                "name" => $s["name"],
                "slug" => $s["id"],
                "url" => $s["url"],
                "category_id" => $category->id,
                "language_id" => $language->id,
                "country_id" => $country->id,
            ]);
        }
    }

    function callApi($uri,$key){
        $response = $this->httpClient->get($uri);
        if(!$response->ok()){
            throw new \Exception("Error calling API");
        }
        $data = (array) $response->json();
        if(!isset($data["status"]) || $data["status"] !="ok" || !isset($data["sources"]) ){
            throw new \Exception("Error on parsing API");
        }
        return $data[$key];
    }
}
