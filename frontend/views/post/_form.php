<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Post */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="post-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>

   	<?= $form->field($model, 'user_id')->hiddenInput(['value' => Yii::$app->user->getId()])->label(false); ?>

    <?=
    $form->field($model, 'cat_id')->dropDownList($model->getCategories(), 
             ['prompt'=>'- Choose Post Category -'])->label('Select Category') ?>

    <?=
    $form->field($model, 'tags')->ListBox($model->getTags(), 
             ['multiple' => 'multiple'])->label('Select tags (use CTRL key to choose multi tags)') ?>


    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
