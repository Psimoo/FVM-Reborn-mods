package com.aurora.ui.maogoutd.resource.shot.DoublePeng
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class DoublePengShot extends a_4348
   {
      
      private static var ms_arrDoublePengShotVector:Array = new Array();
      
      public function DoublePengShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1304 = 65565;
         a_1587 = 1;
         a_1573 = 1;
         a_1576 = false;
      }
      
      public static function GetFreeShot1() : DoublePengShot
      {
         return a_4344(DoublePengShotMovie);
      }
      
      public static function GetFreeShot2() : DoublePengShot
      {
         return a_4344(DoublePeng1ShotMovie);
      }
      
      public static function GetFreeShot3() : DoublePengShot
      {
         return a_4344(DoublePeng2ShotMovie);
      }
      
      public static function GetFreeDogShot1() : DoublePengShot
      {
         return a_4344(DoublePengDogShotMovie);
      }
      
      public static function GetFreeDogShot2() : DoublePengShot
      {
         return a_4344(DoublePeng1DogShotMovie);
      }
      
      public static function GetFreeDogShot3() : DoublePengShot
      {
         return a_4344(DoublePeng2DogShotMovie);
      }
      
      private static function a_4344(moveClipClass:Class) : DoublePengShot
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(DoublePengShot,moveClipClass) as DoublePengShot;
      }
   }
}

