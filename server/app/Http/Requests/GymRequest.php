<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class GymRequest extends FormRequest
{ 
    public const VALIDATION_MESSAGES = [
'gym.group_id' => 'le group_id du gym est obligatoire ', 
'gym.logo' => 'le logo du gym est obligatoire ', 
'gym.name' => 'le name du gym est obligatoire ', 
'gym.rate' => 'le rate du gym est obligatoire ', 
'gym.qrcode' => 'le qrcode du gym est obligatoire ', 
'gym.class_id' => 'le class_id du gym est obligatoire ', 
'gym.facilities' => 'le facilities du gym est obligatoire ', 
'gym.planning' => 'le planning du gym est obligatoire ', 

    ];
 
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
 'group_id' => 'required', 
'logo' => 'required', 
'name' => 'required', 
'rate' => 'required', 
'qrcode' => 'required', 
'class_id' => 'required', 
'facilities' => 'required', 
'planning' => 'required', 

        ];
    }

    public function messages()
    {
        return Self::VALIDATION_MESSAGES;
    }

    public function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(response()->json(["errors" => $validator->errors()->all()], 200));
    }
}




