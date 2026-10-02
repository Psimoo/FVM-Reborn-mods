package com.aurora.ui.maogoutd.resource.shot.boss.skyTrain
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.boss.BaseBossShot;
   
   public class SkyTrainMissileShot extends BaseBossShot
   {
      
      private static var ms_arrShot:Array = new Array();
      
      public function SkyTrainMissileShot()
      {
         super();
         a_1279 = -50;
      }
      
      public static function a_4344() : a_4348
      {
         var stBaseShot:a_4348 = null;
         stBaseShot = ms_arrShot.pop();
         if(null == stBaseShot)
         {
            stBaseShot = new SkyTrainMissileShot();
         }
         stBaseShot.visible = true;
         BattleFieldView.a_1017.play();
         return stBaseShot;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_arrShot.indexOf(this))
         {
            ms_arrShot.push(this);
         }
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return SkyTrainMissileShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         return true;
      }
   }
}

