<?php

use yii\db\Migration;

class m170409_223236_add_admin_user extends Migration
{
    public function up()
    {
        $this->insert('user', array(
         'username'=>'admin',
         'email' => 'admin@admin.com',
         'password_hash' => '$2y$13$5o8JWVJSq0O8TnYneGlr5.BhKcO5gBDzUaS9.m6HACx95mIZzDP1e',
         'Auth_key' => 'FjYjJFVVYaGhGMmMwVFCYBkSBU6hpGu4'
        ));
    }

    public function down()
    {
        echo "m170409_223236_add_admin_user cannot be reverted.\n";

        return false;
    }

    /*
    // Use safeUp/safeDown to run migration code within a transaction
    public function safeUp()
    {
    }

    public function safeDown()
    {
    }
    */
}
