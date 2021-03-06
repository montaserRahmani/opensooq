<?php

use yii\helpers\Html;
use yii\grid\GridView;
use frontend\models\Post;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Admin page';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="post-index">

        <div class="page-header">
            <h1><?= Html::encode($this->title); ?></h1>
        </div>
    
    <h3>Duplicate Posts</h3>

     <?= GridView::widget([
        'dataProvider' => $duplicates,
        'columns' => [
            'title',
            'description',
        ],
    ]); ?>

    <h3>All Posts</h3>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            'id',
            'title',
            'description',   
            [
                'attribute'=>'category',
                'value'=>'category.name'
            ],
            [
                'attribute'=>'By',
                'value'=>'username.username'
            ],
            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
