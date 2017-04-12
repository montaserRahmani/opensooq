<?php

/* @var $this yii\web\View */
use yii\grid\GridView;
use frontend\models\Post;
use yii\helpers\Url;

$this->title = 'Posts Blog';

?>
<div class="site-index">
<div class="row text-center" style="background-color: #f5f5f5; padding: 20px"><a href=<?php echo Url::base()."/post/create" ?> >
<h2>Create a new post now</h2></a></div>
    <div class="row">
        <div class="col-xs-12">
        <div class="page-header">
            <h1>Popular Tags</h1>
        </div>
            <p style="font-size: 15pt;"> <?php 
                $temp = [];
                foreach ($tags as $tagRow) {
                    $temp[]= '<a href="'.Url::base().'/site/tags?id='.$tagRow['tag']['id'].'">'.$tagRow['tag']['text'].'</a>';
                }
                echo implode(", ", $temp);
                ?></p>
        </div>
    </div>

    <div class="page-header">
        <h1>Latest posts <small>from all users</small></h1>
    </div>

    <div class="row">
        <!-- showing posts -->
        <?php foreach ($data as $p) { ?>

        <div class="col-xs-12">
            <div class="panel panel-default">

              <div class="panel-body">
                <h3><?php echo $p['title'] ?></h3>
                <p><?php echo $p['description'] ?></p>
              </div>

            <ul class="list-group">
                <li class="list-group-item"><b>Category :</b> <?php echo $p['category']['name'] ?></li>
                <li class="list-group-item"><b>Tags :</b> <?php 
                $tags = [];
                 foreach ($p['postTags'] as $tagRow) {
                    $tags[]= '<a href="'.Url::base().'/site/tags?id='.$tagRow['id'].'">'.$tagRow['tag']['text'].'</a>';
                 }
                 echo implode(", ", $tags);
                 ?></li>
            </ul>

              <div class="panel-footer">
              <div class="row">
              <div class="col-md-10 col-xs-12" style="padding: 10px 20px"><b>by :</b><?php echo $p['username']['username'] ?></div>
              <div class="col-md-2 col-xs-12">
              <a href=<?php echo Url::base().'/post/view?id='.$p['id'] ?> class="btn btn-primary">View post</a>
              </div>
              </div>
            </div>
        </div>
    </div>
        <?php } ?>

</div>
