<?php
return array (
  'MAGE_MODE' => 'production',
  'cache_types' => 
  array (
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
    'vertex' => 1,
  ),
  'backend' => 
  array (
    'frontName' => 'cou1403112c1admin',
  ),
  'db' => 
  array (
    'connection' => 
    array (
      'default' => 
      array (
        'username' => 'a11c8de6_new',
        'host' => 'localhost',
        'dbname' => 'a11c8de6_new',
        'password' => 'NarrowTuxedoTogeBobbed',
      ),
      'indexer' => 
      array (
        'username' => 'a11c8de6_new',
        'host' => 'localhost',
        'dbname' => 'a11c8de6_new',
        'password' => 'NarrowTuxedoTogeBobbed',
      ),
    ),
  ),
  'crypt' => 
  array (
    'key' => '520c6a5cfeda3763402308dd17b87d75',
  ),
  'resource' => 
  array (
    'default_setup' => 
    array (
      'connection' => 'default',
    ),
  ),
  'x-frame-options' => 'SAMEORIGIN',
  'session' => 
  array (
    'save' => 'redis',
    'redis' => 
    array (
      'host' => '10.75.112.252',
      'port' => 54998,
      'database' => 0,
      'disable_locking' => 1,
    ),
  ),
  'install' => 
  array (
    'date' => 'Fri, 15 Jun 2018 20:09:37 +0000',
  ),
  'static_content_on_demand_in_production' => 0,
  'force_html_minification' => 1,
  'cron_consumers_runner' => 
  array (
    'cron_run' => true,
    'max_messages' => 10000,
    'consumers' => 
    array (
    ),
  ),
  'cache' => 
  array (
    'frontend' => 
    array (
      'default' => 
      array (
        'backend' => 'Cm_Cache_Backend_Redis',
        'backend_options' => 
        array (
          'server' => '10.75.112.252',
          'port' => 54998,
          'database' => 1,
          'password' => '',
          'compress_data' => '0',
          'compression_lib' => ''
        ),
      ),
      'page_cache' => 
      array (
        'backend' => 'Cm_Cache_Backend_Redis',
        'backend_options' => 
        array (
          'server' => '10.75.112.252',
          'port' => 54998,
          'database' => 2,
          'password' => '',
          'compress_data' => '0',
          'compression_lib' => ''
        ),
      ),
    ),
  ),
  'system' => 
  array (
    'default' => 
    array (
      'catalog' => 
      array (
        'search' => 
        array (
          'engine' => 'elasticsearch6',
          'elasticsearch6_server_hostname' => 'cg-6697-elasticsearch.us-midwest-1.nxcli.net',
          'elasticsearch6_server_port' => 27050,
        ),
      ),
    ),
  ),
  'directories' => 
  array (
    'document_root_is_pub' => true,
  ),
  'cron' => 
  array (
  ),
  'lock' => 
  array (
    'provider' => 'db',
    'config' => 
    array (
      'prefix' => NULL,
    ),
  ),
  'queue' => 
  array (
    'consumers_wait_for_messages' => 0,
  ),
  'downloadable_domains' => 
  array (
    0 => 'www.curricanes.com',
  ),
);
