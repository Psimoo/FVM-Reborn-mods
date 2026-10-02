package com.aurora.ui.maogoutd.resource.Intruder.ThunderCity.FlyingFire
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class BurnBuffShot extends a_4348
   {
      
      private static var ms_stBurnBuffShotVector:Array = new Array();
      
      private var appearedTimes:int = 0;
      
      public var stTargetFieldGrid:a_3491;
      
      private var m_iWaitTime:int;
      
      public function BurnBuffShot()
      {
         super();
         a_1279 = -0.5 * 38 + 1;
         m_iYDisplayCenterPos = -0.5 * 34 + 7;
         a_1588 = true;
      }
      
      public static function a_4344() : a_4348
      {
         var stBurnBuffShot:BurnBuffShot = ms_stBurnBuffShotVector.pop();
         if(null == stBurnBuffShot)
         {
            stBurnBuffShot = new BurnBuffShot();
         }
         BattleFieldView.a_1017.play();
         return stBurnBuffShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return BurnBuffShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         this.appearedTimes = 0;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stBurnBuffShotVector.indexOf(this))
         {
            ms_stBurnBuffShotVector.push(this);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               m_bActive.Value = false;
               this.a_3940();
            }
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(this.appearedTimes == 0)
         {
            this.appearedTimes = iCurrentTime;
         }
         if((iCurrentTime - this.appearedTimes) % (2 * 20) == 0)
         {
            this.BurnFieldGridDefense(this.stTargetFieldGrid);
         }
         if(iCurrentTime - this.appearedTimes >= this.m_iWaitTime * 20)
         {
            this.a_3940();
         }
      }
      
      protected function BurnFieldGridDefense(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         return stFieldGrid.BurnFieldGridDefenseNormal(10);
      }
      
      public function get WaitTime() : int
      {
         return this.m_iWaitTime;
      }
      
      public function set WaitTime(iWaitTime:int) : void
      {
         this.m_iWaitTime = iWaitTime;
      }
   }
}

