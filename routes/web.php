<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/test', 'Test@index');

Route::namespace('Web')->group(function () {
    Route::get('/index/{is_iframe?}', 'Index@index')->where('is_iframe', '[0-1]+');
    Route::get('/index/category/{id}', 'Index@category');
    Route::get('/index/post/{id}', 'Index@post');

    Route::get('/monitor/index', 'Monitor@index');
    Route::get('/monitor/department', 'Monitor@department');
    Route::get('/monitor/party_member', 'Monitor@partyMember');
    Route::get('/monitor/party_business', 'Monitor@partyBusiness');
    Route::get('/monitor/meeting', 'Monitor@meeting');
    Route::get('/monitor/learning', 'Monitor@learning');
});
