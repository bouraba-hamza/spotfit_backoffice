<?php

namespace App\Http\Controllers;

use App\Repositories\SubscriptionRepository;
use App\Services\SubscriptionImageService;
use App\Subscription;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class SubscriptionController extends Controller
{

    protected $subscriptionImageService;
    /**
     * @var Subscription
     */
    private $subscription;

    /**
     * GroupController constructor.
     * @param ProjectsRepository $ProjectsRepository
     */
    public function __construct(SubscriptionRepository $SubscriptionRepository, SubscriptionImageService $subscriptionImageService)
    {
        $this->subscription = $SubscriptionRepository;

        $this->subscriptionImageService = $subscriptionImageService;

    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return $this->subscription->all();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // filter unwanted inputs from request
        $subscription = $request->all();
        \Log::info($subscription);
//                 \Log::info($request->hasFile("image"));
        // save the file in storage
        if ($request->hasFile("image")) {

            $subscription["image"] = $this->subscriptionImageService->store($request->file('image'))["fakeName"];
        }

        $subscription["description"] = Str::random(17);

        // create partner account
        $subscription_id = $this->subscription->insert($subscription)->id;

        // return the id of the resource just created
        return ['subscription_id' => $subscription_id];
    }

    /**
     * Display the specified resource.
     *
     * @param \App\Subscription $subscription
     * @return \Illuminate\Http\Response
     */
    public function show(Subscription $subscription)
    {
        return $this->subscription->find($subscription);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\Subscription $subscription
     * @return \Illuminate\Http\Response
     */
    public function edit(Subscription $subscription)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Subscription $subscription
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Subscription $subscription)
    {
        // check if the the requested resource exist in database
        $subscription = $this->subscription->find($subscription);
        $data = $request->all();
        //Todo control de validation

        if ($request->hasFile("image")) {
            $data["image"] = $this->subscriptionImageService->update($subscription->image, $request->file("image"))["fakeName"];
        }

        $updated = $this->partner->update($subscription, $data);

        if (!$updated) return ['errors' => "somme problems"];


        return ['subscription_id' => $subscription];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Subscription $subscription
     * @return \Illuminate\Http\Response
     */
    public function destroy(Subscription $subscription)
    {

        $this->partner->destroy($subscription);

        return ['status' => 'success', 'deleted_resource_id' => $subscription];

    }
}
