<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Post */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Posts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="post-view">

    <h1><?= Html::encode($this->title); ?></h1>

    <p>
        <?= Yii::$app->user->getId() == $model->user_id ? Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) : ''  ?>

        <?= Yii::$app->user->getId() == $model->user_id ?
            Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]): '' ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'title',
            'description:ntext',
            [
                'label'=>'Category',
                'value'=>$model->getCategoryName($model->cat_id),
            ]
        ],
    ]) ?>

</div>
