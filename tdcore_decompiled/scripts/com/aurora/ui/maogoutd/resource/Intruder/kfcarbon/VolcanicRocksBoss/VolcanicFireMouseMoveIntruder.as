package com.aurora.ui.maogoutd.resource.Intruder.kfcarbon.VolcanicRocksBoss
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class VolcanicFireMouseMoveIntruder extends a_4206
   {
      
      private var m_iStartTimeNum:int;
      
      private var m_numTargetYPos:Number;
      
      private var m_iGoTargetFieldTime:int;
      
      public var m_iFinalTargetXGridNo:uint;
      
      protected var m_stPosFieldGrid:a_3491;
      
      public var a_1598:a_3491;
      
      public function VolcanicFireMouseMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(VolcanicFireMouseMoveIntruder) as VolcanicFireMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return VolcanicFireMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 120;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 900;
         a_1279 = -width * 0.85;
         a_1272 = 0;
         a_1463 = true;
         a_1464 = true;
         this.m_iFinalTargetXGridNo = 0;
         this.m_iGoTargetFieldTime = 0;
         gotoAndStop(1);
         a_1275 = 0;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 300)
         {
         }
         if(a_1339 <= 0 && a_1275 != 3)
         {
            a_1275 = 3;
            gotoAndStop((a_1276[3] as FrameLabel).frame);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 <= 0 && a_1275 != 3)
         {
            a_1275 = 3;
            gotoAndStop((a_1276[3] as FrameLabel).frame);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         a_3419();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         m_stCurrentFieldGrid.a_3457(this);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         super.a_4210();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            this.m_iStartTimeNum = iCurrentTime;
            a_1460 = true;
            this.m_stPosFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_iFinalTargetXGridNo,this.a_1598.m_iYGridNo);
            this.m_numTargetYPos = y;
            a_1350 = (this.a_1598.m_iYGridNo - m_stCurrentFieldGrid.m_iYGridNo) * a_3491.a_1081 / 20;
         }
         if(this.m_iGoTargetFieldTime > 0)
         {
            --this.m_iGoTargetFieldTime;
            y += a_1350;
            if(0 == this.m_iGoTargetFieldTime)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
               y = this.iYPosSkewing + a_3491.a_1081 * this.a_1598.m_iYGridNo + (a_3491.a_1081 - this.height) - stDisplayBitmap.y;
               a_1350 = a_3491.a_1080 / 15;
               if(!a_1283)
               {
                  a_1350 *= -1;
               }
               ChangeFieldGrid(this.a_1598);
            }
         }
         else
         {
            super.a_4216(iCurrentTime);
            if(Boolean(m_stCurrentFieldGrid) && m_stCurrentFieldGrid == this.m_stPosFieldGrid)
            {
               this.a_3502(m_stCurrentFieldGrid);
               this.a_3969(iLifeValue);
            }
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_433 != iEffectType && b_182.a_434 != iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      public function GoTargetFieldGrid() : void
      {
         this.m_iGoTargetFieldTime = 20;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
   }
}

