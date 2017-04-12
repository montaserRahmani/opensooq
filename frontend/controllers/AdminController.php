<?php

namespace frontend\controllers;
use frontend\models\Post;
use yii\data\ActiveDataProvider;
use Yii;

class AdminController extends \yii\web\Controller
{
    public function actionIndex()
    {	
        //checking if the user is logged in and is an admin
    	if(!Yii::$app->user->isGuest && Yii::$app->user->identity->isAdmin){
    		$dataProvider = new ActiveDataProvider([
            	'query' => Post::find(),
	        ]);

            $duplicates = new ActiveDataProvider([
                'query' => Post::find()->select('title, description, COUNT(*)')
            ->groupBy('title','description')
            ->having('COUNT(*) > 1')
            ]);

	        return $this->render('index', [
	            'dataProvider' => $dataProvider,
                'duplicates' => $duplicates
	        ]);
	       
        //otherwise redirect to main page
    	} else {
    		return $this->goHome();
    	}

    }

    public function actionView($id)
    {
        return $this->redirect(['/post/view', 'id' => $id]);
    }

    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    public function actionUpdate($id)
    {
        return $this->redirect(['/post/update', 'id' => $id]);
    }

    protected function findModel($id)
    {
        if (($model = Post::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

}
