<?php
namespace App\Console\Commands\NewsAggregator;

use App\Models\Aggregator;
use App\Models\NewsHash;
use App\Models\News as NewsModel;
class News{
    private $title;
    private $description;
    private $url;

    private $image_url;
    private $publisher_id;
    private $aggregator_id;

    private $published_at;

    private $hash;

    private $category_id;
    function __construct($published_at, $title,$description,$url, $image_url,$publisher_id, $category_id,$aggregator_id)
    {
        $this->published_at = $published_at;
        $this->title = $title;
        $this->description = substr(!empty($description)?$description:$title , 0, 500);
        $this->url = $url;
        $this->image_url = $image_url;
        $this->publisher_id = $publisher_id;
        $this->aggregator_id = $aggregator_id;
        $this->hash = $this->calculateHash();
        $this->category_id = $category_id;
    }
    private function calculateHash(){
        return hash('sha256', $this->url."_:_".$this->title."_:_".$this->description);
    }

    function isUnique(){
        return NewsHash::where("hash",$this->hash)->count() == 0;
    }

    function isURLAlreadyAvailable(){
        return NewsModel::where("url",$this->url)->count() == 0;
    }

    function isContentUpdated(){
        return $this->isUnique() && $this->isURLAlreadyAvailable();
    }
    function save(){
        if($this->isUnique()){
            if($this->isContentUpdated()){
                $ns =  NewsModel::select(["id"])->where("url",$this->url)->get();
                foreach($ns as $n){
                    NewsHash::where("news_id",$n->id)->delete();
                    $n->delete();
                }
            }

            $news = NewsModel::create([
                "published_at" => $this->published_at,
                "title" => $this->title,
                "description" => $this->description,
                "url" => $this->url,
                "image_url" => $this->image_url,
                "publisher_id" => $this->publisher_id,
                "aggregator_id" => $this->aggregator_id,
                "category_id" => $this->category_id
            ]);

            NewsHash::create(["hash"=> $this->hash,"news_id"=>$news->id]);
        }
    }
}
