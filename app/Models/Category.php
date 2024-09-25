<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = ["name"];

    public $timestamps = false;

    use HasFactory;

    function news(){
        return $this->hasMany(News::class);
    }

    function publishers(){
        return $this->hasMany(Publisher::class);
    }
}
