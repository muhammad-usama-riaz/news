<?php

namespace App\Http\Controllers;

use App\Http\Filters\NewsFilter;
use App\Http\Filters\PropertyFilter;
use App\Http\Resources\NewsResource;
use App\Http\Resources\PropertyStatsResource;
use App\Models\News;
use App\Models\Property;
use Illuminate\Http\Request;

class NewsController extends Controller
{
    //
    function index(Request $request){
        $query = News::query();

        $filter = ( new NewsFilter($query))->applyFilter("base")->filter();
      //  dd($filter->query()->toRawSql());
        $news =  $filter->query()->paginate((int)($request->get('per_page') ?? 10));
        return NewsResource::collection($news);
    }
}
