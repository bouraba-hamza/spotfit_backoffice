<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class ClasseRequest extends FormRequest
{ 
    public const VALIDATION_MESSAGES = [
'classe.name' => 'le name du classe est obligatoire ', 
'classe.image' => 'le image du classe est obligatoire ', 
'classe.prix_min' => 'le prix_min du classe est obligatoire ', 
'classe.prix_max' => 'le prix_max du classe est obligatoire ', 

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
 'name' => 'required', 
'image' => 'required', 
'prix_min' => 'required', 
'prix_max' => 'required', 

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




