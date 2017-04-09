<?php

use yii\db\Migration;

/**
 * Handles the creation of table `category`.
 */
class m170408_095843_create_category_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('category', [
            'id' => $this->primaryKey(),
            'name' => $this->string(100)->notNull()->unique()
        ]);

        $this->insert('category', array(
         'name'=>'Cars'
        ));

        $this->insert('category', array(
         'name'=>'Mobiles'
        ));

        $this->insert('category', array(
         'name'=>'Tablets'
        ));
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
        $this->dropTable('category');
    }
}
