<?php
namespace App\Http\Filters;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;

abstract class QueryFilter
{
    protected $filters = [];

    /** @var Builder */
    protected $query;

    /** @var Request */
    protected $request;

    public function __construct(Builder $query, Request $request = null)
    {
        $this->request = $request ?? request();
        $this->query = $query;
    }

    /**
     * Apply filters from the request
     *
     * @return $this
     */
    public function filter()
    {
        foreach ($this->getFilters() as $filter) {
            $value = $this->request->get($filter);
            if (!$value) {
                continue;
            }

            $this->applyFilter($filter, $value);
        }

        return $this;
    }

    /**
     * Get the base query builder
     *
     * @return Builder
     */
    function query() : Builder
    {
        return $this->query;
    }

    /**
     * This can be used to apply individual filters
     *
     * @param $filter string
     * @param $value mixed
     *
     * @return $this
     */
    public function applyFilter(string $filter, $value = null): self
    {
        $method = 'filter' . Str::studly($filter);
        if (method_exists($this, $method)) {
            $this->$method($value);
        }
        return $this;
    }


    /**
     * Get the filters
     * @return array
     */
    protected function getFilters() : array
    {
        return $this->filters;
    }

    static function make(Builder $query, Request $request = null)
    {
        $instance = new static($query, $request);
        return $instance->filter();
    }

    public function removeFilter(string $filterName)
    {
        $newFilters = [];
        $filters = $this->getFilters();
        if(!empty($filters))
        {
            foreach($filters as $filter)
            {
                if($filter == $filterName)
                {
                    continue;
                }
                $newFilters[] = $filter;
            }
        }

        $this->filters = $newFilters;

        //unset($this->filters[$filter]);
        return $this;
    }
    protected function arrayFilter($key,$arr){
        if (is_string($arr)) {
            $arr = explode(',', $arr);
        }
        $arr = array_filter($arr);
        if (!empty($arr)) {
            $this->query()->whereIn($key, $arr);
        }

    }

    protected function rangeFilter($key,$range){
        $this->query()->where($key,">=",$range["min"]);
        $this->query()->where($key,"<=",$range["max"]);
    }

    protected function dateRangeFilter($key,$range){
        $this->query()->where($key,">=", Carbon::createFromTimestamp($range["start"])->toDateTimeString());
        $this->query()->where($key,"<=", Carbon::createFromTimestamp($range["end"])->toDateTimeString());
    }

//    public function __call($name, $arguments)
//    {
//        return $this->query()->$name(...$arguments);
//    }
}
