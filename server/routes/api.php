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
    Route::get('/me', 'AuthController@getAuthenticatedUser');
    Route::get('/token/refresh', 'AuthController@refresh');



    /**
     * Administration
     */
    Route::get('/{player_type}', 'UserController@index')->where('player_type', '(admins|partners|customers|trainers)');;




    // Route::post('/admins', 'AdminController@store');
    // Route::get('/admins/{admin_id}', 'AdminController@show')->where('admin_id', '\d');;
    // Route::put('/admins', 'AdminController@update');
    // Route::delete('/admins', 'AdminController@destroy');
    

});