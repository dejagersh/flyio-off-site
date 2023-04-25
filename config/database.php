<?php

return [
    'connections' => [
        'your-fly-mysql-database' => [
            'driver' => 'mysql',
            'host' => 'your-fly-db-app-name.internal',
            'port' => 3306,
            'database' => 'name-of-database',
            'username' => 'root',
            'password' => env('YOUR_FLY_MYSQL_DB_PASSWORD'),
        ],

        'your-fly-postgres-database' => [
            'driver' => 'pgsql',
            'url' => env('YOUR_FLY_POSTGRES_DB_URL'),
        ]
    ],
];
