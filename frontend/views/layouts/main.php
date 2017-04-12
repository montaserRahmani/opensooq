<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use frontend\assets\AppAsset;
use common\widgets\Alert;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>

    <style type="text/css">
        .main-intro {
            padding: 35px;
            margin: 50px 0 0 0;
            background-color: #013356;
            color: #f5f5f5;
        }

        .icon {
            font-size: 60px;
            padding: 25px;
            margin-bottom: 20px;
        }
    </style>

</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
    <?php
    NavBar::begin([
        'brandLabel' => 'OS Blog',
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar-default navbar-fixed-top',
        ],
    ]);
    $menuItems = [
        ['label' => 'Home', 'url' => ['/site/index']],
        ['label' => 'About', 'url' => ['/site/about']],
        ['label' => 'Contact', 'url' => ['/site/contact']],
    ];
    if (Yii::$app->user->isGuest) {
        $menuItems[] = ['label' => 'Signup', 'url' => ['/user/signup']];
        $menuItems[] = ['label' => 'Login', 'url' => ['/user/login']];
    } else {
        if(Yii::$app->user->identity->isAdmin){
           $menuItems[] = ['label' => 'Admin Panel', 'url' => ['/admin']];
        }
        $menuItems[] = '<li>'
            . Html::beginForm(['/user/logout'], 'post')
            . Html::submitButton(
                'Logout (' . Yii::$app->user->identity->username . ')',
                ['class' => 'btn btn-link logout']
            )
            . Html::endForm()
            . '</li>';
    }
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => $menuItems,
    ]);
    NavBar::end();
    ?>

    <div class="main-intro row"><div class="col-md-10 col-md-offset-1 text-center rulesContainer">
        <h1 style="
        font-weight: bold;
        color: #fff;
        ">Welcome to OS Blog!</h1>
        <h2>A place where you can share your intrest and posts!</h2>
        <div class="col-md-4">
          <i class="glyphicon glyphicon-plus icon"></i>
          <br>
          <span style="">Add any number of posts</span>
      </div>

    <div class="col-md-4"><i class="glyphicon glyphicon glyphicon-share icon"></i>
        <br>
        <span>Share it with friends</span>
    </div>
    <div class="col-md-4">
        <i class="glyphicon glyphicon-heart icon"></i>
        <br>
        <span style="
        ">HAVE FUN!</span>
    </div>
</div></div>


    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= Alert::widget() ?>
        <?= $content ?>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p class="pull-left">&copy; OS Blog <?= date('Y') ?></p>

        <p class="pull-right"><?= Yii::powered() ?></p>
    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
