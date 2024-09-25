<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class News extends Model
{
    protected $fillable = ["published_at", "title", "description", "url", "image_url", "publisher_id", "aggregator_id","category_id"];
    public $timestamps = false;

    use HasFactory;

    function publisher(){
       return $this->belongsTo(Publisher::class);
    }
    function aggregator(){
        return $this->belongsTo(Aggregator::class);
    }

    function category(){
        return $this->belongsTo(Category::class);
    }
}
