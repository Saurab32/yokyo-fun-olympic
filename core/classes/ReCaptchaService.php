<?php
namespace  core\classes;

class ReCaptchaService{
    public static function verify($response)
    {
        try {
            $client = new \GuzzleHttp\Client();
            $response = $client->post('https://www.google.com/recaptcha/api/siteverify', [
                'form_params' => [
                    'secret' => config('recaptcha.secret_key'),
                    'response' => $response
                ]
            ]);
            $body = json_decode((string)$response->getBody());
            return $body->success;
        }catch (\Exception $exception){
            return false;
        }
    }
}