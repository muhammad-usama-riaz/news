<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class NewsResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            "id" => $this->id,
            "title" => $this->title,
            "description" => $this->description,
            "url" => $this->url,
            "image_url" => $this->image_url,
            "publisher" => $this->publisher->name,
            "aggregator" => $this->aggregator->name,
            "category" => $this->category->name,
            "country" => $this->publisher->country->name,
            "language" => $this->publisher->language->name,
        ];
    }
}
