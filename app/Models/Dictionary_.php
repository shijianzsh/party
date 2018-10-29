<?php

namespace App\Models;

/**
 * 字典表
 */
class Dictionary_ extends Dictionary
{
    static public function getDictionaryList()
    {
        return Dictionary::get();
    }

    static public function getDictionaryValue(string $key)
    {
        return Dictionary::where('key', $key)->firstOrFail()->value;
    }
}
