package com.aurora.ui.maogoutd.resource.shot
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class MouseAirshipBossLaserShot extends a_4348
   {
      
      private static var ms_stMouseAirshipBossLaserShotVector:Array = new Array();
      
      private var a_1598:a_3491;
      
      public function MouseAirshipBossLaserShot()
      {
         super();
         a_1279 = -width * 0;
         a_1573 = 1;
         a_1576 = false;
         a_1588 = true;
         a_1275 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var stMouseAirshipBossLaserShot:MouseAirshipBossLaserShot = ms_stMouseAirshipBossLaserShotVector.pop();
         if(null == stMouseAirshipBossLaserShot)
         {
            stMouseAirshipBossLaserShot = new MouseAirshipBossLaserShot();
         }
         BattleFieldView.a_1017.play();
         return stMouseAirshipBossLaserShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return MouseAirshipBossLaserShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numXSpeed *= -1;
         m_isHited = true;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         rotation = 0;
         if(-1 == ms_stMouseAirshipBossLaserShotVector.indexOf(this))
         {
            ms_stMouseAirshipBossLaserShotVector.push(this);
         }
         return true;
      }
   }
}

