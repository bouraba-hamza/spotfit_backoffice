<?php

namespace App\Http\Controllers;
use App\Account;
use Illuminate\Http\Request;
use JWTAuth;
use JWTException;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        // $validator = \Validator::make($request->all(), [
        //     'username' => 'required|string|max:255',
        //     'email' => 'required|string|email|max:255|unique:accounts',
        //     'password' => 'required|string|min:3',
        // ]);

        // if($validator->fails()){
        //     return response()->json($validator->errors()->toJson(), 400);
        // }

        // $user = Account::create([
        //     'username'  => $request->username,
        //     'email'    => $request->email,
        //     'password' => $request->password,
        //     'disabled' => 0,
        //     'owner_id' => 2,
        //     'owner' => 'App\Customer',
        //  ]);

        // $token = JWTAuth::fromUser($user);

        // // return response()->json(compact('user','token'),201);


        // return $this->respondWithToken($token);
    }

    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        try {
            if (! $token = JWTAuth::attempt($credentials)) {
                return response()->json(['error' => 'invalid_credentials'], 400);
            }
        } catch (JWTException $e) {
            return response()->json(['error' => 'could_not_create_token'], 500);
        }

        return $this->respondWithToken($token);
    }

    public function logout()
    {
        auth('api')->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type'   => 'bearer',
            'expires_in'   => auth('api')->factory()->getTTL() * 60
        ]);
    }


    public function getAuthenticatedUser()
    {
        try {

            if (! $user = JWTAuth::parseToken()->authenticate()) {
                    return response()->json(['user_not_found'], 404);
            }

        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {

            return response()->json(['token_expired'], $e->getStatusCode());

        } catch (Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {

            return response()->json(['token_invalid'], $e->getStatusCode());

        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {

            return response()->json(['token_absent'], $e->getStatusCode());

        }

        return $user;
    }

    public function refresh()
    {
        return $this->respondWithToken(auth('api')->refresh());
    }
}
