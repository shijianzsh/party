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

    Route::resource('department_work_plans', 'DepartmentWorkPlanController');

    Route::resource('department_activity_plans', 'DepartmentActivityPlanController');

    Route::resource('users', 'UserController');

    Route::resource('user_payments', 'UserPaymentController');

    Route::post('articles/{id}/audit', 'Article@audit');
    Route::resource('articles', 'ArticleController');

    Route::resource('categories', 'CategoryController');

    Route::resource('comments', 'CommentController');

    Route::get('meetings/department', 'Meeting@department');
    Route::get('meetings/attend_user', 'Meeting@attendUser');
    Route::get('meetings/audit_user', 'Meeting@auditUser');
    Route::resource('meetings', 'MeetingController');

    Route::resource('exam_categorys', 'ExamCategoryController');

    Route::resource('exam_excels', 'ExamExcelController');

    Route::resource('exam_papers', 'ExamPaperController');

    Route::post('exam_results/{paperId}/start', 'ExamResult@start');
    Route::post('exam_results/{id}/submit', 'ExamResult@submit');
    Route::resource('exam_results', 'ExamResultController');
});

