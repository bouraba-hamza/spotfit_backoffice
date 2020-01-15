<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class FacilitieRequest extends FormRequest
{ 
    public const VALIDATION_MESSAGES = [
'facilitie.icon' => 'le icon du facilitie est obligatoire ', 
'facilitie.name' => 'le name du facilitie est obligatoire ', 
'facilitie.order' => 'le order du facilitie est obligatoire ', 

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
 'icon' => 'required', 
'name' => 'required', 
'order' => 'required', 

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




