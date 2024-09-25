<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Aggregator extends Model
{
    protected $fillable = ["name"];

    public $timestamps = false;

    use HasFactory;

    function news(){
        return $this->hasMany(News::class);
    }
}
