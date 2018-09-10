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

//Route::options('/{all}', function (Request $request) {
//})->middleware(\App\Http\Middleware\Cors::class);


Route::get('/', function (Request $request) {
    return '非法访问';
});

Route::get('/test', 'Test');

Route::get('/token', 'Token');
Route::post('/login', 'User@login')->middleware(\App\Http\Middleware\CheckToken::class);


Route::group(['middleware' => [
//    \App\Http\Middleware\CheckAccessToken::class,
]], function () {
    Route::post('upload', 'Upload');

    Route::resource('departments', 'DepartmentController');

    Route::resource('users', 'UserController');

    Route::post('articles/{id}/audit', 'Article@audit');
    Route::resource('articles', 'ArticleController');

    Route::resource('categories', 'CategoryController');

    Route::resource('comments', 'CommentController');

    Route::resource('exam_category', 'ExamCategoryController');
    Route::resource('exam_excel', 'ExamExcelController');
    Route::resource('exam_paper', 'ExamPaperController');
    Route::resource('exam_result', 'ExamResultController');
});

