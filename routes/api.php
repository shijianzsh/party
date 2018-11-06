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


Route::namespace('Api')->group(function () {
    Route::get('/', function (Request $request) {
        return '非法访问';
    });

    Route::get('/git_push', function (Request $request) {
        return 'yes';
    });

    Route::get('/test', 'Test');

    Route::get('/token', 'Token');

    Route::post('upload', 'Upload');

    Route::group(['middleware' => [
        \App\Http\Middleware\VerifyToken::class,
    ]], function () {
        Route::post('/login', 'User@login');

        Route::get('activists/{code}/code', 'Activist@getActivistByCode');
        Route::resource('activists', 'ActivistController')->only(['store']);

        Route::get('departments/select_component', 'Department@selectComponentList');

        Route::group(['middleware' => [
            \App\Http\Middleware\VerifyIsSocketServer::class,
        ]],
            function () {
                Route::post('chat_user_messages/{from_user_id}/{to_user_id}/create', 'ChatUserMessage@create');
                Route::get('chat_user_messages/{from_user_id}/{to_user_id}/check', 'ChatUserMessage@check');
            });

        Route::group(['middleware' => [
            \App\Http\Middleware\VerifyAccessToken::class,
//        \App\Http\Middleware\VerifyAuth::class,
        ]],
            function () {
                Route::resource('dictionaries', 'DictionaryController');

                Route::resource('auth_maps', 'AuthMapController');

                Route::resource('auth_roles', 'AuthRoleController');

                Route::get('departments/{id}/department', 'Department@departmentDepartmentList');
                Route::get('departments/{id}/coordinate', 'Department@getDepartmentCoordinateList');
                Route::resource('departments', 'DepartmentController');

                Route::resource('department_work_plans', 'DepartmentWorkPlanController');

                Route::resource('department_activity_plans', 'DepartmentActivityPlanController');

                Route::get('users/{department_id}/department', 'User@getDepartmentUserList');
                Route::get('users/{id}/party_info', 'User@getUserWithPartyInfo');
                Route::get('users/{id}/thumbnail', 'User@getUserThumbnail');
                Route::post('users/{id}/change_password', 'User@changePassword');
                Route::post('users/{id}/update_one_field', 'User@updateOneField');
                Route::resource('users', 'UserController');

                Route::resource('activists', 'ActivistController')->except(['store']);

                Route::get('user_notifications/{user_id}/unread_badge_count', 'UserNotification@getUserUnreadNotificationBadgeCount');
                Route::resource('user_notifications', 'UserNotificationController');

                Route::resource('user_info_party_relations', 'UserInfoPartyRelationController');

                Route::resource('user_payments', 'UserPaymentController');

                Route::get('articles/published', 'Article@publishedArticleList');
                Route::get('articles/user', 'Article@userArticleList');
                Route::get('articles/audit_user', 'Article@auditUserArticleList');
                Route::get('articles/{id}/check', 'Article@checkArticle');
                Route::post('articles/{id}/audit', 'Article@audit');
                Route::resource('articles', 'ArticleController');

                Route::resource('article_comments', 'ArticleCommentController');

                Route::get('categories/{id}/children_and_published_article', 'Category@getCategoryChildrenAndPublishedArticleList');
                Route::resource('categories', 'CategoryController');

                Route::get('comments/audit_user', 'Comment@auditUserCommentList');
                Route::post('comments/{id}/audit', 'Comment@audit');
                Route::resource('comments', 'CommentController');

                Route::get('meetings/department', 'Meeting@departmentMeetingList');
                Route::get('meetings/attend_user', 'Meeting@attendUserMeetingList');
                Route::get('meetings/audit_user', 'Meeting@auditUserMeetingList');
                Route::post('meetings/{id}/audit', 'Meeting@audit');
                Route::post('meetings/{id}/arrange_and_send_push', 'Meeting@arrangeAndSendPush');
                Route::post('meetings/{id}/sign_in', 'Meeting@signIn');
                Route::resource('meetings', 'MeetingController');

                Route::get('elections/{id}/publicized', 'Election@getPublicizedElection');
                Route::get('elections/{id}/attend', 'Election@getAttendElection');
                Route::post('elections/{id}/attend_submit', 'Election@AttendSubmit');
                Route::post('elections/{id}/update_publicity_content', 'Election@UpdatePublicityContent');
                Route::resource('elections', 'ElectionController');

                Route::get('votes/{id}/publicized', 'Vote@getPublicizedVote');
                Route::get('votes/{id}/attend', 'Vote@getAttendVote');
                Route::post('votes/{id}/attend_submit', 'Vote@AttendSubmit');
                Route::post('votes/{id}/update_publicity_content', 'Vote@UpdatePublicityContent');
                Route::resource('votes', 'VoteController');

                Route::resource('exam_categories', 'ExamCategoryController');

                Route::resource('exam_excels', 'ExamExcelController');

                Route::resource('exam_papers', 'ExamPaperController');

                Route::get('exam_results/{user_id}/user_submitted', 'ExamResult@getSubmittedList');
                Route::get('exam_results/{user_id}/{paper_id}/get_user_exam_result_by_paper_id', 'ExamResult@getUserExamResultByPaperId');
                Route::post('exam_results/{paperId}/start', 'ExamResult@start');
                Route::post('exam_results/{id}/submit', 'ExamResult@submit');
                Route::resource('exam_results', 'ExamResultController');

                Route::resource('exam_collect_questions', 'ExamCollectQuestionController');

                Route::post('pusher/{user_id}/socket/{send_key}', 'Pusher@Socket');
                Route::post('pusher/{user_id}/sms', 'Pusher@Sms');
            });

    });
});

