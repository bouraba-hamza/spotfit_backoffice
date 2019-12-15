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

Route::post('/login', 'AuthController@login');
Route::post('/logout', 'AuthController@logout');

/* EMAIL VERIFICATION */
Route::get('/verify-email/{code}', 'AuthController@verifyEmail');

Route::group(['middleware' => ['jwt']], function () {

    /**
     * Auth
     */
    Route::get('/me', 'AuthController@getAuthenticatedUser');
    Route::get('/token/refresh', 'AuthController@refresh');

    /**
     * Admin
     */
    Route::get('/admins', 'AdminController@index');
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

});


