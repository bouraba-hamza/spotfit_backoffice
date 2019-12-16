<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class AdminRequest extends FormRequest
{
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
            'gender' => 'in:m,f',
            'birthDay' => 'date_format:Y-m-d',
            'avatar' => 'image',
            'account.email' => 'required|email|unique:accounts,email',
            'account.username' => 'required|unique:accounts,username',
            'account.password' => 'required|min:6',
        ];
    }

    public function messages()
    {
        return [
            'birthDay.date_format' => 'la date de naissance dois respecter le format Année-Mois-jour',
            'avatar.image' => 'la photo de profile  dois respecter le format d\'image ',
            'account.email.required' => 'le champ email est requis',
            'account.email.email' => 'il faut respecter le format de mail',
            'account.email.unique' => 'l\'email déjà pris',
            'account.username.required' => 'le champ login est requis',
            'account.username.unique' => 'le nom d\'utilisateur déjà pris',
            'account.password.required' => 'le champ mote de passe est requis',
            'account.password.min' => 'la longueur du mot de passe doit être d\'au moins 6 caractères',
        ];
    }

    public function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(response()->json(["errors" => $validator->errors()->all()], 200));
    }

    // protected function failedValidation(Validator $validator)
    // {
    //      throw new HttpResponseException(response()->json($validator->errors(), 422));
    // }
}
