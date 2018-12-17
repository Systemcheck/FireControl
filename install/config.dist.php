<?php

class DATABASE_CONFIG
{
	var $default = array(
		'driver' => 'mysqli',
		'persistent' => false,
		'host' => '%%host%%',
		'login' => '%%username%%',
		'password' => '%%password%%',
		'database' => '%%database%%',
		'prefix' => '',
        'install' => false,
	);
}
?>