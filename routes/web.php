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


Route::get('/', function () {
    $flight = new App\Models\PortalPost();
    $a=$flight->with('audit')->get();

    $flight = new App\Models\PortalPostAudit();
    $b=$flight->with('post')->get();

    return [$a??[],$b];
});
