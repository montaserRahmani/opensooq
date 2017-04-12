<?php

/* @var $this yii\web\View */
use yii\grid\GridView;
use frontend\models\Post;

  if(sizeof($data) > 0) {
    $this->title = 'Post tagged with '.$data[0]['tag']['text'];
  } else {
    $this->title = 'No results';
  }

  $this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-tags">
    <?php if(sizeof($data) > 0) { ?>
    <div class="page-header">
        <h1><?php echo $data[0]['tag']['text'] ?> posts <small>from all users</small></h1>
    </div>

    <div class="row">
        <!-- showing posts -->
        <?php foreach ($data as $p) { ?>

        <div class="col-xs-12">
            <div class="panel panel-default">

              <div class="panel-body">
                <h3><?php echo $p['post']['title'] ?></h3>
                <p><?php echo $p['post']['description'] ?></p>
              </div>

            <ul class="list-group">
                <li class="list-group-item"><b>Category :</b> <?php echo $p['post']['category']['name'] ?></li>
                <li class="list-group-item"><b>Tags :</b> <?php 
                $tags = [];
                 foreach ($p['post']['postTags'] as $tagRow) {
                    $tags[]= '<a href="?id=1">'.$tagRow['tag']['text'].'</a>';
                 }
                 echo implode(", ", $tags);
                 ?></li>
            </ul>

              <div class="panel-footer"><b>by :</b> <?php echo $p['post']['username']['username'] ?>
              </div>
            </div>
        </div>

        <?php } ?>
    </div>

    <?php } else { var_dump($data) ?>
      <h3>Sorry we couldn't find any results</h3>
    <?php } ?>
</div>
