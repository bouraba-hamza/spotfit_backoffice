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

 /*
Route::get('/clear-cache', function() {
    $run = Artisan::call('config:clear');
    $run = Artisan::call('cache:clear');
    $run = Artisan::call('config:cache');
    return 'FINISHED';
});
*/
/*
Route::get('images/{filename}', function ($filename)
{
    $file = '../public/uploads/logo/'($filename); //gymLogo_d620a8e6-0106-d78a-6197-9d84ce47ed18.png
    return response($file, 200)->header('Content-Type', 'image/jpeg');
});
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


    /**
     * Base64ToPngs
     */
    Route::get("/base64ToPng", "Base64ToPngController@index");
    Route::put('/base64ToPng/{base64ToPng_id}', 'Base64ToPngController@destroy');
    Route::post('/base64ToPng', 'Base64ToPngController@store');
    //Route::post('/base64ToPng/{name}/{code}', 'Base64ToPngController@store');
    Route::post('/base64ToPng/{base64ToPng_id}', 'Base64ToPngController@update');
    Route::get('/base64ToPng/{base64ToPng_id}', 'Base64ToPngController@show');




Route::group(['middleware' => ['jwt', /* 'jwt.refresh' */]], function(){

    /**
     * Homes
     */
    Route::get("/home", "HomeController@index");
    Route::put('/home/{home_id}', 'HomeController@destroy');
    Route::post('/home', 'HomeController@store');
    Route::post('/home/{home_id}', 'HomeController@update');
    Route::get('/home/{home_id}', 'HomeController@show');
    

    /**
     * Classes
     */
    Route::get("/classe", "ClasseController@index");
    Route::put('/classe/{classe_id}', 'ClasseController@destroy');
    Route::post('/classe', 'ClasseController@store');
    Route::post('/classe/{classe_id}', 'ClasseController@update');
    Route::get('/classe/{classe_id}', 'ClasseController@show');
    

    /**
     * Activities
     */
    Route::get("/activitie", "ActivitieController@index");
    Route::put('/activitie/{activitie_id}', 'ActivitieController@destroy');
    Route::post('/activitie', 'ActivitieController@store');
    Route::post('/activitie/{activitie_id}', 'ActivitieController@update');
    Route::get('/activitie/{activitie_id}', 'ActivitieController@show');
    

    /**
     * Facilities
     */
    Route::get("/facilitie", "FacilitieController@index");
    Route::put('/facilitie/{facilitie_id}', 'FacilitieController@destroy');
    Route::post('/facilitie', 'FacilitieController@store');
    Route::post('/facilitie/{facilitie_id}', 'FacilitieController@update');
    Route::get('/facilitie/{facilitie_id}', 'FacilitieController@show');
    


    /**
     * Gyms
     */
    Route::get("/gym", "GymController@index");
    Route::put('/gym/{gym_id}', 'GymController@destroy');
    Route::post('/gym', 'GymController@store');
    Route::post('/gym/{gym_id}', 'GymController@update');
    Route::get('/gym/{gym_id}', 'GymController@show');
 //   Route::post('/gym/base64ToPng/{name}/{code}', 'Base64ToPngController@store');


    /**
     * Factures
     */
    Route::get("/equipement", "EquipementController@index");
    Route::put('/equipement/{equipement_id}', 'EquipementController@destroy');
    Route::post('/equipement', 'EquipementController@store');
    Route::post('/equipement/{equipement_id}', 'EquipementController@update');
    Route::get('/equipement/{equipement_id}', 'EquipementController@show');

    /**
     * Factures
     */
    Route::get("/facture", "FactureController@index");
    Route::put('/facture/{facture_id}', 'FactureController@destroy');
    Route::post('/facture', 'FactureController@store');
    Route::post('/facture/{facture_id}', 'FactureController@update');
    Route::get('/facture/{facture_id}', 'FactureController@show');



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
     * Groups
     */
    Route::get("/group", "GroupController@index");
    Route::put('/group/{group_id}', 'GroupController@destroy');
    Route::post('/group', 'GroupController@store');
    Route::post('/group/{group_id}', 'GroupController@update');
    Route::get('/group/{group_id}', 'GroupController@show');


    /**
     * Gyms
     */
    /*
    Route::get("/gym", "GymController@index_");
    Route::get("/gym/show", "GymController@show");
    Route::get("/gym/{gym_id}", "GymController@get");
    Route::get("/gym/admin/{id_gerant}", "GymController@getByAdmin");
    Route::post("/gym/add", "GymController@store");
    Route::post("/gym/update", "GymController@update");
    Route::delete("/gym/del/{id}", "GymController@destroy");
*/
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
