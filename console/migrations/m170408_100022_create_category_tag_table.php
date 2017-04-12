<?php

use yii\db\Migration;

/**
 * Handles the creation of table `category_tag`.
 */
class m170408_100022_create_category_tag_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('category_tag', [
            'id' => $this->primaryKey(),
            'category_id' => $this->integer()->notNull(),
            'tag_id' => $this->integer()->notNull()
        ]);

        $this->addForeignKey('fk_category_tag_category', 'category_tag', 'category_id', 'category', 'id', 'CASCADE', 'CASCADE');

        $this->addForeignKey('fk_category_tag_tag', 'category_tag', 'tag_id', 'tag', 'id', 'CASCADE', 'CASCADE');
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
        $this->dropForeignKey('fk_category_tag_category', 'category_tag');
        $this->dropForeignKey('fk_category_tag_tag', 'category_tag');
        $this->dropTable('category_tag');
    }
}
