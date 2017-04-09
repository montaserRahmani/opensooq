<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\models\Post;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Posts';
$this->params['breadcrumbs'][] = $this->title;
foreach ($dataProvider->getModels() as $model) {
            $model->cat_id = Post::getCategoryName($model->cat_id);
    }
?>
<div class="post-index">

    <h1><?= Html::encode($this->title); ?></h1>

    <p>
        <?= Html::a('Create Post', ['create'], ['class' => 'btn btn-success']); ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'title',
            'description:ntext',   
            'cat_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
