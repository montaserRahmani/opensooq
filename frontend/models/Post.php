<?php

namespace frontend\models;

use Yii;
use frontend\models\Category;
use frontend\models\Tag;
use frontend\models\User;

/**
 * This is the model class for table "post".
 *
 * @property integer $id
 * @property string $title
 * @property string $description
 * @property integer $cat_id
 *
 * @property PostTag[] $postTags
 */
class Post extends \yii\db\ActiveRecord
{

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'post';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['description'], 'string'],
            [['cat_id'], 'integer'],
            [['title'], 'string', 'max' => 255],
            [['user_id'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'description' => 'Description',
            'cat_id' => 'Category',
            'user_id' => 'Created By'
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPostTags()
    {
        return $this->hasMany(PostTag::className(), ['post_id' => 'id'])->with('tag');
    }

    public function getCategory()
    {
        return $this->hasOne(Category::className(), ['id' => 'cat_id']);
    }

    public function getUsername()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    public function getCategories()
    {
        return Category::find()->select('name')->indexBy('id')->column();
    }

    public function getTags()
    {
        return Tag::find()->select('text')->indexBy('id')->column();
    }

    public function getCategoryName($id)
    {   
        $cat = Category::findOne(['id' => $id]);
        return $cat ? $cat->name : 'not available';
    }

    // public function getUsername($id)
    // {   
    //     $user = User::findOne(['id' => $id]);
    //     return $user ? $user->username : 'not available';
    // }

}
