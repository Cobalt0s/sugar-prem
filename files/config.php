<?php

$sugar_config = [
    'site_url' => 'http://localhost/ampersand-sugar',
    'installer_locked' => false,
    'dbconfig' => [
        // Database via Docker
        'db_type' => 'mysql',
        'db_host_name' => 'mysql:3306',
        // Credentials
        'db_name' => 'sugarcrmDB',
        'db_user_name' => 'ampUser',
        'db_password' => 'password',
    ]
];
