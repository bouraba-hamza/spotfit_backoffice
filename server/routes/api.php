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

//Route::post('/test', function(Request $request) {
//    \Illuminate\Support\Facades\Log::info($request->all());
//});

//Route::get('/test', function() {
//    $accountId = 11;
//    return redirect(config('app.url')  . "login?accountId={$accountId}&verified=1");
//
//});

    /*TEST*/
    Route::get('/admins', 'AdminController@index');



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


Route::group(['middleware' => [ 'jwt', /* 'jwt.refresh' */]], function () {

    /* USERS PROFILE PICTURES */
    Route::get('profile-picture/{filename}', 'ProfilePictureController@getAvatar');

    /**
     * Auth
     */
    Route::get('/me', 'AuthController@getAuthenticatedUser');

    /**
     * Admin
     */
    // Route::get('/admins', 'AdminController@index');
    Route::post('/admins', 'AdminController@store');
    Route::post('/admins/{admin_id}', 'AdminController@update');
    Route::get('/admins/{admin_id}', 'AdminController@show');
    // Route::delete('/admins/{admin_id}', 'AdminController@destroy');

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
    Route::post('/customers', 'CustomerController@store');
    Route::post('/customers/{customer_id}', 'CustomerController@update');
    Route::get('/customers/{customer_id}', 'CustomerController@show');
    Route::delete('/customers/{customer_id}', 'CustomerController@destroy');

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
    * Upload Images
    */
    // Route::get("/upload_images", "UploadImagesController@index");
    // Route::post("/upload_images", "UploadImagesController@store");



    /**
    * Rights
    */
    // Route::get("/rights", "RightController@index");
    // Route::post("/rights", "RightController@store");
    // Route::put("/rights", "RightController@update");
    // Route::delete("/rights/{right_id}/delete", "RightController@destroy");



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
    * Parrainages
    */
    Route::get("/parrainages", "ParrainageController@index");
    Route::get("/parrainages/{parr_id}", "ParrainageController@get");
    Route::get("/parrainages/gym/{id_gym}", "ParrainageController@getByGym");
    Route::post("/parrainages", "ParrainageController@store");
    Route::put("/parrainages", "ParrainageController@update");
    Route::delete("/parrainages/{parr_id}/delete", "ParrainageController@destroy");


    /**
    * Parrainages_taux
    */
    Route::get("/parrainages_taux", "ParrainagetauxController@index");
    Route::get("/parrainages_taux/{parr_taux_id}", "ParrainagetauxController@get");
    Route::get("/parrainages_taux/gym/{id_gym}", "ParrainagetauxController@getByGym");
    Route::post("/parrainages_taux", "ParrainagetauxController@store");
    Route::put("/parrainages_taux", "ParrainagetauxController@update");
    Route::delete("/parrainages_taux/{parr_taux_id}/delete", "ParrainagetauxController@destroy");


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



    /**
    * Coupons
    */
    Route::get("/coupons", "CouponController@index");
    Route::get("/coupons/{coupon_id}", "CouponController@get");
    Route::get("/coupons/gym/{id_gym}", "CouponController@getByIdGym");
    Route::post("/coupons", "CouponController@store");
    Route::put("/coupons", "CouponController@update");
    Route::delete("/coupons/{coupon_id}/delete", "CouponController@destroy");




    /**
    * Passpartout
    */
    Route::get("/passpartout", "PasspartoutController@index");
    Route::get("/passpartout/{passpartout_id}", "PasspartoutController@get");
    Route::get("/passpartout/gym/{id_gym}", "PasspartoutController@getByIdGym");
    Route::post("/passpartout", "PasspartoutController@store");
    Route::put("/passpartout", "PasspartoutController@update");
    Route::delete("/passpartout/{coupon_id}/delete", "PasspartoutController@destroy");


    /**
     * Settings
     */
    Route::apiResource('settings', 'SettingController')->except([
        'store', 'destroy'
    ])->parameters([
        'settings' => 'key'
    ]);


});


