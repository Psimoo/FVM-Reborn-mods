package com.aurora.ui.maogoutd.resource.Intruder.Desert.Anubis
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class AnubisSecondShot extends a_4348
   {
      
      private var a_1596:int = -1;
      
      public var m_isParentAttackDie:Boolean = false;
      
      public function AnubisSecondShot()
      {
         super();
         a_1279 = -66;
         m_iYDisplayCenterPos = -45;
         a_1573 = 2;
         a_1588 = true;
         a_1275 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(AnubisSecondShot) as AnubisSecondShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return AnubisSecondShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         this.a_1596 = -1;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(this.a_1596 <= 0)
         {
            this.a_1596 = setTimeout(this.a_3940,10000);
         }
         this.SleepCard(a_1584,iCurrentTime);
         if(iCurrentTime % 2 == 0)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
      }
      
      private function SleepCard(stTempFieldGrid:a_3491, times:int) : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         if(stTempFieldGrid == null)
         {
            return;
         }
         var xStart:int = stTempFieldGrid.m_iXGridNo - 1;
         var xEnd:int = stTempFieldGrid.m_iXGridNo + 1;
         var yStart:int = stTempFieldGrid.m_iYGridNo - 1;
         var yEnd:int = stTempFieldGrid.m_iXGridNo + 1;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stTargetFieldGrid = stTempFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(Boolean(stTargetFieldGrid) && null != stTargetFieldGrid.m_stAttackFighter)
               {
                  stTargetFieldGrid.m_stAttackFighter.setLastShotTimeNum(times);
               }
            }
         }
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(this.a_1596 >= 0)
         {
            clearTimeout(this.a_1596);
         }
         this.a_1596 = -1;
         return true;
      }
   }
}

