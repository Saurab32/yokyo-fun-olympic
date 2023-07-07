<?php

return [
    // app configs
    "app"=>[
        "debug"=>true,
        "name" => "Yokyo Fun Olympic",
    ],
    //database connection
    "database"=>[
        "host"=>"localhost",
        "user"=>"root",
        "password"=>"",
        "database"=>"newsportal"
    ],
    // smtp connection
    "smtp"=>[
        "name"=>"Yokyo Fun Olympic",
        "host"=>"sandbox.smtp.mailtrap.io",
        "port"=>2525,
        "username"=>"55a02409903fbf",
        "password"=>"91d209c46e9895",
    ],
    // recaptcha configs
    "recaptcha"=>[
        "site_key"=>"6Leo1fAmAAAAAJRBHNCxZdIbuMDAGjpxLJG9ATVP",
        "secret_key"=>"6Leo1fAmAAAAAE2lQyZmkkESDMgufrYkZ-r25Jr9"
    ]
];