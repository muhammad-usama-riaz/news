<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NewsHash extends Model
{
    protected $fillable = ["hash","news_id"];
    public $timestamps = false;

    use HasFactory;
}
