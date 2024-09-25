<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Publisher extends Model
{
    public $timestamps = false;
    protected $fillable = ["slug","name","url","category_id","language_id","country_id"];
    use HasFactory;

    function news(){
        return $this->hasMany(News::class);
    }
    function category(){
        return $this->belongsTo(Category::class);
    }

    function country(){
        return $this->belongsTo(Country::class);
    }

    function language(){
        return $this->belongsTo(Language::class);
    }

}
