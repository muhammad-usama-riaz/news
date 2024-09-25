<?php

namespace App\Http\Filters;

use App\Models\Location;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Arr;

class NewsFilter extends QueryFilter
{
    protected $filters = [
        'base', 'published_at', "keyword", "publishers","languages","categories","countries"
    ];

    protected function filterBase(){
        $this->query()->select(["news.*"]);
        $this->query()->leftJoin("publishers","news.publisher_id","publishers.id");
        $this->query()->orderBy('published_at', 'DESC');

    }

    protected function filterPublishedAt($date_range){
        $this->dateRangeFilter("news.published_at", $date_range);
    }

    protected function filterPublishers($publishers){
        $this->query()->whereIn("publishers.name",$publishers);
    }

    protected function filterLanguages($languages){
        $this->query()->leftJoin("languages","languages.id","publishers.language_id");
        $this->query()->whereIn("languages.name", $languages);
    }

    protected function filterCountries($countires){
        $this->query()->leftJoin("countries","publishers.country_id","countries.id");
        $this->query()->whereIn("countries.name", $countires);
    }

    protected function filterCategories($catgories){
        $this->query()->leftJoin("categories","categories.id","news.category_id");
        $this->query()->whereIn("categories.name", $catgories);
    }

    protected function filterKeyword($keyword){
        $this->query()->where(function($query) use ($keyword){
            $query->orWhere("title","like","%".$keyword."%");
            $query->orWhere("description","like","%".$keyword."%");
        });
    }
}
