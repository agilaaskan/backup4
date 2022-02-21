<?php
return [
    'MAGE_MODE' => 'production',
    'cache_types' => [
        'compiled_config' => 1,
        'config' => 1,
        'layout' => 1,
        'block_html' => 1,
        'collections' => 1,
        'reflection' => 1,
        'db_ddl' => 1,
        'eav' => 1,
        'customer_notification' => 1,
        'full_page' => 0,
        'config_integration' => 1,
        'config_integration_api' => 1,
        'target_rule' => 1,
        'translate' => 1,
        'config_webservice' => 1,
        'vertex' => 1
    ],
    'backend' => [
        'frontName' => 'cou1403112c1admin'
    ],
    'db' => [
        'connection' => [
            'default' => [
                'username' => 'a11c8de6_new',
                'host' => 'localhost',
                'dbname' => 'a11c8de6_new',
                'password' => 'FussStubSearchElects'
            ],
            'indexer' => [
                'username' => 'a11c8de6_new',
                'host' => 'localhost',
                'dbname' => 'a11c8de6_new',
                'password' => 'FussStubSearchElects'
            ]
        ]
    ],
    'crypt' => [
        'key' => '520c6a5cfeda3763402308dd17b87d75'
    ],
    'resource' => [
        'default_setup' => [
            'connection' => 'default'
        ]
    ],
    'x-frame-options' => 'SAMEORIGIN',
    'session' => [
        'save' => 'redis',
        'redis' => [
            'host' => '10.75.112.252',
            'port' => 54998,
            'database' => 0,
            'disable_locking' => 1
        ]
    ],
    'install' => [
        'date' => 'Fri, 15 Jun 2018 20:09:37 +0000'
    ],
    'static_content_on_demand_in_production' => 0,
    'force_html_minification' => 1,
    'cron_consumers_runner' => [
        'cron_run' => true,
        'max_messages' => 10000,
        'consumers' => [

        ]
    ],
    'cache' => [
        'frontend' => [
            'default' => [
                'backend' => 'Cm_Cache_Backend_Redis',
                'backend_options' => [
                    'server' => '10.75.112.252',
                    'port' => 54998,
                    'database' => 1,
                    'password' => '',
                    'compress_data' => '0',
                    'compression_lib' => ''
                ]
            ],
            'page_cache' => [
                'backend' => 'Cm_Cache_Backend_Redis',
                'backend_options' => [
                    'server' => '10.75.112.252',
                    'port' => 54998,
                    'database' => 2,
                    'password' => '',
                    'compress_data' => '0',
                    'compression_lib' => ''
                ]
            ]
        ]
    ],
    'directories' => [
        'document_root_is_pub' => true
    ],
    'cron' => [

    ],
    'lock' => [
        'provider' => 'db',
        'config' => [
            'prefix' => NULL
        ]
    ],
    'queue' => [
        'consumers_wait_for_messages' => 0
    ],
    'downloadable_domains' => [
        'www.curricanes.com'
    ]
];
