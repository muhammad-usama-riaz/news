<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Country extends Model
{
    protected $fillable = ["name"];
    public $timestamps = false;
    use HasFactory;
    function publishers(){
        return $this->hasMany(Publisher::class);
    }
}
