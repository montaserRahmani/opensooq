<?php 

namespace app\commands;

use yii\console\Controller;
use app\frontend\models\Post;

class RemoveOldPostsController extends Controller
{
    //i didnt add created_at field in the post table so i cant delete old posts, its easy to do
    //but this to demonstrate the console command only
    public function actionRemove()
    {   
        Post::delete()->where('id = 1');
        echo "done";
    }
}   

?>