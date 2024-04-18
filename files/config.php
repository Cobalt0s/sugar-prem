<?php

$sugar_config = [
    'site_url' => 'http://localhost/ampersand-sugar',
    'installer_locked' => false,
    'dbconfig' => [
        // Database via Docker
        'db_type' => 'mysql',
        'db_host_name' => 'mysql:3306',
        // Credentials
        'db_name' => 'sugarcrm',
        'db_user_name' => 'root',
        'db_password' => 'root',
    ],
    array(
        'Elastic' =>
            array(
                'host' => 'elasticsearch',
                'port' => '9200',
            ),
    ),
    'demoData' => 'yes',
];
