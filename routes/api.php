<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::options('/{all}', function (Request $request) {
})->middleware(\App\Http\Middleware\Cors::class);


Route::get('/', function (Request $request) {
    return '非法访问';
});

Route::get('/test', 'Test');

Route::get('/token', 'Token');
Route::get('/login', 'User@login')->middleware(\App\Http\Middleware\CheckToken::class);


Route::group(['middleware' => [
//    \App\Http\Middleware\CheckAccessToken::class,
]], function () {
    Route::post('upload', 'Upload');

    Route::prefix('super')->group(function () {
        Route::resource('users', 'UserController');
        Route::resource('articles', 'ArticleController');
        Route::resource('categories', 'CategoryController');
    });
});

