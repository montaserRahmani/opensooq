<?php
return [
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'components' => [
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'authClientCollection' => [
        'class'   => \yii\authclient\Collection::className(),
        'clients' => [
        	'facebook' => [
			    'class'        => 'dektrium\user\clients\Facebook',
			    'clientId'     => '908577745948490',
			    'clientSecret' => '46378fced7bd90c060697164d5c62dd9',
			],
    	],
    	],
    ],
    'modules' => [
        'user' => [
            'class' => 'dektrium\user\Module',
            'enableUnconfirmedLogin' => true,
            'confirmWithin' => 21600,
            'cost' => 12,
            'admins' => ['admin'],
            'enableConfirmation' => false
        ],
    ],
];
