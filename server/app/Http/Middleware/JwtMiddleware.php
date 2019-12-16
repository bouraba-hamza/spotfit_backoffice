<?php

    namespace App\Http\Middleware;

    use Closure;
    use JWTAuth;
    use Exception;
    use Tymon\JWTAuth\Exceptions\TokenExpiredException;
    use Tymon\JWTAuth\Http\Middleware\BaseMiddleware;
    use \Tymon\JWTAuth\Exceptions\TokenInvalidException;

    class JwtMiddleware extends BaseMiddleware
    {

        /**
         * Handle an incoming request.
         *
         * @param  \Illuminate\Http\Request  $request
         * @param  \Closure  $next
         * @return mixed
         */
        public function handle($request, Closure $next)
        {
            try {
                $user = JWTAuth::parseToken()->authenticate();
            } catch (Exception $e) {
                if ($e instanceof TokenInvalidException){
                    return response()->json(['errors' => ['INVALID_TOKEN']], 500);
                }else if ($e instanceof TokenExpiredException){
                    return response()->json(['errors' => ['EXPIRED_TOKEN']], 401);
                }else{
                    return response()->json(['errors' => ['NOT_FOUND']], 404);
                }
            }
            return $next($request);
        }
    }
