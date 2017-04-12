<?php 

namespace app\commands;

use yii\console\Controller;
use app\frontend\models\Post;

class RemoveOldPostsController extends Controller
{
    
    public function actionRemove()
    {   
        Post::delete()->where('id = 1');
        echo "done";
    }
}   

?>