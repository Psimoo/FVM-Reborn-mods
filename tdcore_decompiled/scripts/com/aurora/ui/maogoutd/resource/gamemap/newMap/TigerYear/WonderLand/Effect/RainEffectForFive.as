package com.aurora.ui.maogoutd.resource.gamemap.newMap.TigerYear.WonderLand.Effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   
   public class RainEffectForFive extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stCallBackFunc:Function = null;
      
      public var m_TargetFieldGrid:a_3491;
      
      private var m_iWaitTime:int;
      
      public function RainEffectForFive()
      {
         super();
         a_1279 = -213 + 80;
         m_iYDisplayCenterPos = -106 - 75;
      }
      
      public static function a_3926() : RainEffectForFive
      {
         return PoolManager.getInstance().CheckOutOne(RainEffectForFive) as RainEffectForFive;
      }
      
      override protected function getBindMovie() : Class
      {
         return RainEffectForFiveMovie;
      }
      
      override public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.visible = true;
         gotoAndStop(1);
         this.m_iStartTime = 0;
         if(this.m_TargetFieldGrid)
         {
            this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.m_stFieldRowSlipStatusArray[this.m_TargetFieldGrid.m_iYGridNo - 1] = true;
            this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.m_stFieldRowSlipStatusArray[this.m_TargetFieldGrid.m_iYGridNo] = true;
            this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.m_stFieldRowSlipStatusArray[this.m_TargetFieldGrid.m_iYGridNo + 1] = true;
         }
         return true;
      }
      
      public function get WaitTime() : int
      {
         return this.m_iWaitTime;
      }
      
      public function set WaitTime(iWaitTime:int) : void
      {
         this.m_iWaitTime = iWaitTime;
      }
      
      override public function a_3940() : Boolean
      {
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         if(this.m_TargetFieldGrid)
         {
            this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.m_stFieldRowSlipStatusArray[this.m_TargetFieldGrid.m_iYGridNo - 1] = false;
            this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.m_stFieldRowSlipStatusArray[this.m_TargetFieldGrid.m_iYGridNo] = false;
            this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.m_stFieldRowSlipStatusArray[this.m_TargetFieldGrid.m_iYGridNo + 1] = false;
         }
         return true;
      }
      
      public function a_4003(iTimeNum:int) : void
      {
         if(this.m_iStartTime == 0)
         {
            this.m_iStartTime = iTimeNum;
         }
         if(iTimeNum % 2 == 0)
         {
            nextFrame();
            if(null != a_1278 || a_1273 == a_1274)
            {
               gotoAndStop(1);
            }
         }
         if(iTimeNum - this.m_iStartTime > this.WaitTime * 20)
         {
            this.a_3940();
            if(this.stCallBackFunc != null)
            {
               this.stCallBackFunc(this);
            }
         }
      }
   }
}

