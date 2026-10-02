package com.aurora.ui.maogoutd.resource.gamemap.newMap.RabbitYear
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   import flash.utils.Timer;
   
   public class DayWaterWheelEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iStartTime:int;
      
      public var m_TargetFieldGrid:a_3491;
      
      private var m_iWaitTime:int = 0;
      
      private var m_iSkillTime:int = 0;
      
      private var m_iWaitCD:int = 0;
      
      private var m_iSkillCD:int = 0;
      
      private var m_MouseArr:Array = new Array(8388649,8389221);
      
      public function DayWaterWheelEffect()
      {
         super();
         a_1279 = 0;
         m_iYDisplayCenterPos = 15;
      }
      
      public static function a_3926() : DayWaterWheelEffect
      {
         return PoolManager.getInstance().CheckOutOne(DayWaterWheelEffect) as DayWaterWheelEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return DayWaterWheelEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean, iWaitCD:* = 20, iSkillCD:* = 20) : Boolean
      {
         a_1283 = isReseaved;
         this.m_iWaitCD = iWaitCD;
         this.m_iSkillCD = iSkillCD;
         a_1275 = 0;
         gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         this.m_iWaitTime = this.m_iWaitCD;
         this.m_iSkillTime = 0;
         return true;
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         this.m_iStartTime = 0;
         return true;
      }
      
      public function a_4003(iTimeNum:int) : void
      {
         if(this.m_iWaitTime > 0)
         {
            --this.m_iWaitTime;
            if(this.m_iWaitTime == 0)
            {
               this.m_iSkillTime = this.m_iSkillCD;
               if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
               }
            }
         }
         if(this.m_iSkillTime > 0)
         {
            --this.m_iSkillTime;
            if(this.m_iSkillTime == 0)
            {
               this.m_iWaitTime = this.m_iWaitCD;
               if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
               }
            }
         }
         if(iTimeNum % 2 == 0)
         {
            nextFrame();
            if(null != a_1278 || a_1273 == a_1274)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(this.m_iSkillTime > 0)
            {
               this.ChageMouseX();
            }
         }
      }
      
      private function ChageMouseX() : void
      {
         var stMoveIntruder:a_4206 = null;
         var stNextFieldGrid:a_3491 = null;
         if(this.m_TargetFieldGrid == null)
         {
            return;
         }
         var arrBaseMoveIntruderVector:Array = this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
         for each(stMoveIntruder in this.m_TargetFieldGrid.a_1511.slice())
         {
            stNextFieldGrid = this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_TargetFieldGrid.m_iXGridNo - 1,this.m_TargetFieldGrid.m_iYGridNo);
            if(stNextFieldGrid != null && stMoveIntruder.m_stCurrentFieldGrid.m_isNeedTray == stNextFieldGrid.m_isNeedTray)
            {
               if(Boolean(stMoveIntruder && stMoveIntruder.iLifeValue > 0) && Boolean(this.m_MouseArr.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) == -1) && !stMoveIntruder.isCannotSeeByInsurance)
               {
                  this.m_TargetFieldGrid.a_3457(stMoveIntruder);
                  this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.a_3457(stMoveIntruder);
                  if(-1 != arrBaseMoveIntruderVector.indexOf(stMoveIntruder))
                  {
                     arrBaseMoveIntruderVector.splice(arrBaseMoveIntruderVector.indexOf(stMoveIntruder),1);
                  }
                  this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(stMoveIntruder,stNextFieldGrid,false);
                  stMoveIntruder.x -= a_3491.a_1080;
               }
            }
         }
      }
   }
}

