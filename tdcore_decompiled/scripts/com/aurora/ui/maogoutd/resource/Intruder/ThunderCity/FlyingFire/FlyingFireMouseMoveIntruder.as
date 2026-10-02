package com.aurora.ui.maogoutd.resource.Intruder.ThunderCity.FlyingFire
{
   import a_4718.b_182;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class FlyingFireMouseMoveIntruder extends a_4206
   {
      
      protected var m_isSpittingFire:Boolean = false;
      
      protected var m_isFlying:Boolean = true;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      protected var a_1598:a_3491;
      
      protected var m_numTargetYPos:Number;
      
      private var m_iSummonUpMoveIntruderSequence:int = 1;
      
      private var stLastFieldGrid:a_3491;
      
      private const FULL_HP:int = 1200;
      
      private const HURT_HP:int = 500;
      
      private const DEAD_HP:int = 0;
      
      public function FlyingFireMouseMoveIntruder()
      {
         a_1467 = -25;
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(FlyingFireMouseMoveIntruder) as FlyingFireMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return FlyingFireMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (4 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         this.m_isSpittingFire = false;
         this.m_isFlying = true;
         a_1339 = this.FULL_HP;
         a_1279 = -width * 0.5 - 20;
         m_iYDisplayCenterPos = -22;
         a_1465 = 3;
         a_1464 = true;
         this.m_iSummonUpMoveIntruderSequence = 1;
         BoomIsReduceLife = true;
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_433 != iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(this.m_isSpittingFire)
            {
               if(a_1275 != 2)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(this.m_isSpittingFire)
            {
               if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 3)
            {
               a_1275 = 3;
               gotoAndStop((a_1276[3] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= 0)
         {
            if(a_1275 != 6)
            {
               a_1275 = 6;
               gotoAndStop((a_1276[6] as FrameLabel).frame);
            }
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         super.a_4210();
         return true;
      }
      
      override public function a_4214() : Boolean
      {
         a_4212();
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         if(!a_1460)
         {
            this.m_stRandomSeed.setSeed(globalMoveFighterID - m_stCurrentFieldGrid.m_iYGridNo,globalMoveFighterID + m_stCurrentFieldGrid.m_iYGridNo);
            do
            {
               m_iXGridNo = 6 + this.m_stRandomSeed.nextInt(2);
               m_iYGridNo = int(this.m_stRandomSeed.nextInt(6));
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
            }
            while(this.a_1598 == null || m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_iRandomYGridNo == m_iYGridNo);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_iRandomYGridNo = m_iYGridNo;
            x = a_3491.a_1080 * (this.a_1598.m_iXGridNo + 0.5);
            y = -60;
            this.m_numTargetYPos = iYPosSkewing + a_3491.a_1081 * this.a_1598.m_iYGridNo + (a_3491.a_1081 - height);
            a_1460 = true;
            this.m_isFlying = true;
            parent.addChild(this);
         }
         if(this.m_numTargetYPos - y > 5)
         {
            y += 5;
         }
         else if(y != this.m_numTargetYPos && this.m_isFlying == true)
         {
            ChangeFieldGrid(this.a_1598);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.addChildAt(this,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3440(this.a_1598.m_iYGridNo));
            y = this.m_numTargetYPos + 13;
            this.m_isFlying = false;
            if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         if(a_1273 == 17)
         {
            this.m_isSpittingFire = true;
         }
         if(!this.m_isFlying)
         {
            if(m_stCurrentFieldGrid.m_iXGridNo < 3 && this.m_isSpittingFire)
            {
               this.m_isSpittingFire = false;
               this.ResetMovieStatus();
            }
            if(this.m_isSpittingFire && m_stCurrentFieldGrid != null && this.stLastFieldGrid != m_stCurrentFieldGrid)
            {
               this.stLastFieldGrid = m_stCurrentFieldGrid;
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 3,m_stCurrentFieldGrid.m_iYGridNo);
               this.addBurnEffect(this.a_1598);
            }
            super.a_4216(iCurrentTime);
         }
         return true;
      }
      
      private function addBurnEffect(stFieldGrid:a_3491) : void
      {
         var stLastWaitShot:a_4348 = null;
         var iPosX:int = 0;
         var iPosY:int = 0;
         if(stFieldGrid != null)
         {
            stLastWaitShot = BurnBuffShot.a_4344();
            BurnBuffShot(stLastWaitShot).WaitTime = 15;
            BurnBuffShot(stLastWaitShot).stTargetFieldGrid = stFieldGrid;
            iPosX = stFieldGrid.m_iXGridNo * a_3491.a_1080;
            iPosY = stFieldGrid.m_iYGridNo * a_3491.a_1081;
            stLastWaitShot.a_1797(0,0,50,iPosX,iPosY,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,stFieldGrid,false,1,0);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.EFFECTS_BASE_TYPE,stFieldGrid);
         }
      }
      
      protected function a_4265() : int
      {
         return (globalMoveFighterID << 16) + this.m_iSummonUpMoveIntruderSequence++;
      }
   }
}

