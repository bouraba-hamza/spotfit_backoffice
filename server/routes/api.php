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

Route::group(['middleware' => [/*'jwt'*/]], function() {

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
     * Account
     */
    Route::post('/account/disable', 'AccountController@disable');    
    Route::post('/account/activate', 'AccountController@activate');    

});