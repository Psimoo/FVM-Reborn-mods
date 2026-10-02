package com.aurora.ui.maogoutd.resource.shot.Sagittarius
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class SagittariusShot extends a_4348
   {
      
      private static var ms_arrSagittariusShotVector:Array = new Array();
      
      public function SagittariusShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1304 = 65565;
         a_1587 = 1;
         a_1573 = 1;
         a_1576 = false;
      }
      
      public static function a_4344() : a_4348
      {
         var stSagittariusShot:SagittariusShot = ms_arrSagittariusShotVector.pop();
         if(null == stSagittariusShot)
         {
            stSagittariusShot = new SagittariusShot();
         }
         BattleFieldView.a_1017.play();
         return stSagittariusShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return SagittariusShotMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_arrSagittariusShotVector.indexOf(this))
         {
            ms_arrSagittariusShotVector.push(this);
         }
         return true;
      }
   }
}

