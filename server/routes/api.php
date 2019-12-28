<?php

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


Route::post('/login', 'AuthController@login');
Route::post('/logout', 'AuthController@logout');

/**
 * PASSWORD
 */

Route::post('/password/update', 'PasswordController@update');
Route::get('/password/{ticket}/verify', 'PasswordController@verify');
// send reset password link to email passed as parameter
Route::post('/reset-password', 'PasswordController@sendResetLink');

/* EMAIL VERIFICATION */
Route::get('/verify-email/{code}', 'AuthController@verifyEmail');
Route::get('/token/refresh', 'AuthController@refresh');


Route::group(['middleware' => ['jwt', /* 'jwt.refresh' */]], function () {

    /* USERS PROFILE PICTURES */
    Route::get('profile-picture/{filename}', 'ProfilePictureController@getAvatar');

    /**
     * Auth
     */
    Route::get('/me', 'AuthController@getAuthenticatedUser');

    /**
     * Admin
     */
    Route::get('/admins', 'AdminController@index');
    Route::post('/admins', 'AdminController@store');
    Route::post('/admins/{admin_id}', 'AdminController@update');
    Route::get('/admins/{admin_id}', 'AdminController@show');

    /**
     * Partner
     */
    Route::get('/partners', 'PartnerController@index');
    Route::post('/partners', 'PartnerController@store');
    Route::post('/partners/{partner_id}', 'PartnerController@update');
    Route::get('/partners/{partner_id}', 'PartnerController@show');
    Route::delete('/partners/{partner_id}', 'PartnerController@destroy');

    /**
     * Customer
     */
    Route::get('/customers', 'CustomerController@index');
    Route::post('/customers/{customer_id}', 'CustomerController@update');
    Route::get('/customers/{customer_id}', 'CustomerController@show');
    Route::put('/becomeAmbassador/{customer_id}/{promote}', 'CustomerController@becomeAmbassador');

    /**
     * Trainer
     */
    Route::get('/trainers', 'TrainerController@index');
    Route::post('/trainers', 'TrainerController@store');
    Route::post('/trainers/{trainer_id}', 'TrainerController@update');
    Route::get('/trainers/{trainer_id}', 'TrainerController@show');
    Route::delete('/trainers/{trainer_id}', 'TrainerController@destroy');

    /**
     * Account
     */
    Route::put('/accounts/{id}/disable', 'AccountController@disable');
    Route::put('/accounts/{id}/enable', 'AccountController@enable');


    /**
     * Class
     */
    Route::resource('/class', 'ClassesController');

    /**
     * Subscription
     */
    Route::resource('/pass', 'SubscriptionController');

    /**
     * Settings
     */
    Route::apiResource('settings', 'SettingController')->except([
        'store', 'destroy'
    ])->parameters([
        'settings' => 'key'
    ]);


});

    /**
     * Gyms
     */
    Route::get("/gyms", "GymController@index");
    Route::get("/gyms/show", "GymController@show");
    Route::get("/gyms/{gym_id}", "GymController@get");
    Route::get("/gyms/admin/{id_gerant}", "GymController@getByAdmin");
    Route::post("/gyms/add", "GymController@store");
    Route::post("/gyms/update", "GymController@update");
    Route::delete("/gyms/del/{id}", "GymController@destroy");

    /**
     * Equipements
     */
    Route::get("/equipements", "EquipementController@index");
    Route::get("/equipements/show", "EquipementController@show");
    Route::get("/equipements/{equipement_id}", "EquipementController@get");
    Route::post("/equipements", "EquipementController@store");
    Route::put("/equipements", "EquipementController@update");
    Route::post("/equipements/update", "EquipementController@update");
    Route::delete("/equipements/del/{equipement_id}", "EquipementController@destroy");
