package com.aurora.ui.maogoutd.resource.defender.RabbitYear.BeeSlime
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class SmallBeeSlimeBaseShot extends a_4348
   {
      
      private static var ms_stSmallBeeSlimeBaseShotVector:Array = new Array();
      
      public function SmallBeeSlimeBaseShot()
      {
         super();
         a_1279 = 0;
         a_1573 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         var stSmallBeeSlimeBaseShot:SmallBeeSlimeBaseShot = ms_stSmallBeeSlimeBaseShotVector.pop();
         if(null == stSmallBeeSlimeBaseShot)
         {
            stSmallBeeSlimeBaseShot = new SmallBeeSlimeBaseShot();
         }
         return stSmallBeeSlimeBaseShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return SmallBeeSlimeBaseShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         a_1587 = 1;
         a_1275 = 0;
         m_isPenetrate = false;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         super.a_4216(iCurrentTime);
      }
      
      override protected function CalculationBoundary() : Boolean
      {
         if(x < 0 || x >= BattleFieldView.a_1013 || a_1576 && y > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            m_bActive.Value = false;
            this.a_3940();
            return true;
         }
         return false;
      }
      
      override protected function ReboundHandler() : void
      {
         rotationY = rotationY == -180 ? 0 : -180;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stSmallBeeSlimeBaseShotVector.indexOf(this))
         {
            ms_stSmallBeeSlimeBaseShotVector.push(this);
         }
         return true;
      }
   }
}

