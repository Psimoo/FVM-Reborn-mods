package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.MagicBrush
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class SmallDragonFireMouseMoveIntruder extends a_4206
   {
      
      public var FULL_HP:int = 20000;
      
      private var HURT_HP:int = 500;
      
      private var DEAD_HP:int = 0;
      
      private var m_iSummonUpMoveIntruderSequence:int = 1;
      
      private var m_iAppearedTime:int;
      
      protected var m_isSpittingFire:Boolean = false;
      
      protected var m_isBorning:Boolean = false;
      
      private var m_iOrgXGridNo:int;
      
      protected var a_1598:a_3491;
      
      private var stLastFieldGrid:a_3491;
      
      public function SmallDragonFireMouseMoveIntruder()
      {
         a_1467 = 12;
         a_1279 = -52 + 20;
         m_iYDisplayCenterPos = -40;
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(SmallDragonFireMouseMoveIntruder) as SmallDragonFireMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return SmallDragonFireMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (4 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1465 = 3;
         a_1464 = true;
         BoomIsReduceLife = true;
         this.m_iAppearedTime = 0;
         this.stLastFieldGrid = null;
         this.m_isSpittingFire = false;
         this.m_isBorning = false;
         this.m_iOrgXGridNo = 0;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.stLastFieldGrid = null;
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
            if(!this.m_isBorning)
            {
               if(this.m_isSpittingFire)
               {
                  if(a_1275 != 3)
                  {
                     a_1275 = 3;
                     gotoAndStop((a_1276[3] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(!this.m_isBorning)
            {
               if(this.m_isSpittingFire)
               {
                  if(a_1275 != 6)
                  {
                     a_1275 = 6;
                     gotoAndStop((a_1276[6] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 4)
               {
                  a_1275 = 4;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 <= 0)
         {
            if(a_1275 != 7)
            {
               a_1275 = 7;
               gotoAndStop((a_1276[7] as FrameLabel).frame);
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
         if(!a_1460)
         {
            a_1460 = true;
            this.m_iAppearedTime = iCurrentTime;
            this.m_isBorning = true;
            this.m_iOrgXGridNo = m_stCurrentFieldGrid.m_iXGridNo;
            a_1275 = 2;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         if(!this.m_isBorning)
         {
            super.a_4216(iCurrentTime);
         }
         if(null != m_stCurrentFieldGrid)
         {
            if(this.m_isBorning && !this.m_isSpittingFire && a_1273 == 23)
            {
               this.m_isBorning = false;
               this.m_isSpittingFire = true;
               this.ResetMovieStatus();
            }
            if(m_stCurrentFieldGrid.m_iXGridNo < this.m_iOrgXGridNo - 3 && this.m_isSpittingFire)
            {
               this.m_isSpittingFire = false;
               this.ResetMovieStatus();
            }
            if(this.m_isSpittingFire && m_stCurrentFieldGrid != null && this.stLastFieldGrid != m_stCurrentFieldGrid && (a_1273 == 26 || a_1273 == 46))
            {
               this.stLastFieldGrid = m_stCurrentFieldGrid;
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
               this.addBurnEffect(this.a_1598);
            }
         }
         return true;
      }
      
      override protected function ChangeFieldGrid(stNextFieldGrid:a_3491) : void
      {
         super.ChangeFieldGrid(stNextFieldGrid);
      }
      
      private function addBurnEffect(stFieldGrid:a_3491) : void
      {
         var stLastWaitShot:a_4348 = null;
         var iPosX:int = 0;
         var iPosY:int = 0;
         if(stFieldGrid != null)
         {
            stLastWaitShot = MagicBurnBuff.a_4344();
            MagicBurnBuff(stLastWaitShot).WaitTime = 15;
            MagicBurnBuff(stLastWaitShot).stTargetFieldGrid = stFieldGrid;
            iPosX = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            iPosY = (stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
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

