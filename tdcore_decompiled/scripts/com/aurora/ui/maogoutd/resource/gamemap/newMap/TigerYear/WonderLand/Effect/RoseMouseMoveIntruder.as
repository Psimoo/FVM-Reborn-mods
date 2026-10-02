package com.aurora.ui.maogoutd.resource.gamemap.newMap.TigerYear.WonderLand.Effect
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class RoseMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 900000;
      
      private var m_iAppearedTime:int;
      
      private var m_iWattingTime:int;
      
      public function RoseMouseMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(RoseMouseMoveIntruder) as RoseMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return RoseMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1339 = this.FULL_HP;
         a_1464 = true;
         a_1463 = true;
         this.m_iAppearedTime = 0;
         this.m_iWattingTime = 0;
         a_1279 = 15;
         m_iYDisplayCenterPos = -3;
         tagCom.AddTag(40003);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         super.a_4210();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            a_1465 = 0;
            a_1460 = true;
            this.m_iAppearedTime = iCurrentTime;
            this.m_iWattingTime = 20 * 3 + 10;
            a_1275 = 1;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         trace("m_iCurrentFrame::" + a_1273);
         if(this.m_iWattingTime > 0)
         {
            --this.m_iWattingTime;
            if(this.m_iWattingTime == 0)
            {
               if(a_1275 != 2)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
         }
         if(0 == iCurrentTime % 2)
         {
            if(a_1273 == 22)
            {
               this.addShot(m_stCurrentFieldGrid);
            }
            else if(a_1273 == a_1274)
            {
               a_3940();
            }
         }
         return true;
      }
      
      private function addShot(stFieldGrid:a_3491) : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var tempX2:int = 0;
         var tempY2:int = 0;
         var stLastWaitShot:RoseShot = null;
         if(stFieldGrid == null && this.m_iWattingTime != 0)
         {
            return;
         }
         stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo - 1);
         if(stTargetFieldGrid != null)
         {
            stLastWaitShot = RoseShot.a_4344() as RoseShot;
            if(null == stLastWaitShot)
            {
               return;
            }
            tempX2 = stTargetFieldGrid.m_iXGridNo * a_3491.a_1080 + 23;
            tempY2 = stTargetFieldGrid.m_iYGridNo * a_3491.a_1081 + 8 + 59;
            stLastWaitShot.m_isSpecial = 1;
            stLastWaitShot.a_1797(0,10,500,tempX2,tempY2,stFieldGrid.m_stCurrentBattbleFieldView,stTargetFieldGrid);
            parent.addChildAt(stLastWaitShot,stFieldGrid.m_stCurrentBattbleFieldView.a_3433());
         }
         stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo + 1,stFieldGrid.m_iYGridNo);
         if(stTargetFieldGrid != null)
         {
            stLastWaitShot = RoseShot.a_4344() as RoseShot;
            if(null == stLastWaitShot)
            {
               return;
            }
            tempX2 = stTargetFieldGrid.m_iXGridNo * a_3491.a_1080 - 10;
            tempY2 = stTargetFieldGrid.m_iYGridNo * a_3491.a_1081 + 26 + 3;
            stLastWaitShot.m_isSpecial = 2;
            stLastWaitShot.a_1797(0,10,500,tempX2,tempY2,stFieldGrid.m_stCurrentBattbleFieldView,stTargetFieldGrid);
            parent.addChildAt(stLastWaitShot,stFieldGrid.m_stCurrentBattbleFieldView.a_3433());
         }
         stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo + 1);
         if(stTargetFieldGrid != null)
         {
            stLastWaitShot = RoseShot.a_4344() as RoseShot;
            if(null == stLastWaitShot)
            {
               return;
            }
            tempX2 = stTargetFieldGrid.m_iXGridNo * a_3491.a_1080 + 23 + 21;
            tempY2 = stTargetFieldGrid.m_iYGridNo * a_3491.a_1081 + 8 - 13;
            stLastWaitShot.m_isSpecial = 3;
            stLastWaitShot.a_1797(0,10,500,tempX2,tempY2,stFieldGrid.m_stCurrentBattbleFieldView,stTargetFieldGrid);
            parent.addChildAt(stLastWaitShot,stFieldGrid.m_stCurrentBattbleFieldView.a_3433());
         }
         stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo - 1,stFieldGrid.m_iYGridNo);
         if(stTargetFieldGrid != null)
         {
            stLastWaitShot = RoseShot.a_4344() as RoseShot;
            if(null == stLastWaitShot)
            {
               return;
            }
            tempX2 = stTargetFieldGrid.m_iXGridNo * a_3491.a_1080 + 57;
            tempY2 = stTargetFieldGrid.m_iYGridNo * a_3491.a_1081 + 26 + 24;
            stLastWaitShot.m_isSpecial = 4;
            stLastWaitShot.a_1797(0,10,500,tempX2,tempY2,stFieldGrid.m_stCurrentBattbleFieldView,stTargetFieldGrid);
            parent.addChildAt(stLastWaitShot,stFieldGrid.m_stCurrentBattbleFieldView.a_3433());
         }
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
   }
}

