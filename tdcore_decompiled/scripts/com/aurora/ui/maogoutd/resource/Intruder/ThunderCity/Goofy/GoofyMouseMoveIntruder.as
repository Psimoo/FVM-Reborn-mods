package com.aurora.ui.maogoutd.resource.Intruder.ThunderCity.Goofy
{
   import a_4718.b_181;
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class GoofyMouseMoveIntruder extends a_4206
   {
      
      private var a_1537:int;
      
      private var stRollingAttackTimes:int;
      
      private var stBoomState:Boolean;
      
      private const FULL_HP:int = 52000;
      
      private const HURT_HP:int = 500;
      
      private const DEAD_HP:int = 0;
      
      private var isboo:Boolean = false;
      
      public function GoofyMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(GoofyMouseMoveIntruder) as GoofyMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoofyMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 100;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1466 = 200;
         a_1279 = -width * 0.2 - 37;
         this.stRollingAttackTimes = -10;
         a_1272 = 0;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(a_1466 > 0)
            {
               if(a_1475)
               {
                  if(a_1275 != 1)
                  {
                     a_1275 = 1;
                     gotoAndStop((a_1276[1] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
               }
            }
         }
         else if(a_1339 <= 0)
         {
            if(this.stRollingAttackTimes == -10 && a_1275 != 5)
            {
               a_1275 = 5;
               gotoAndStop((a_1276[5] as FrameLabel).frame);
            }
            if(m_stCurrentFieldGrid != null)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         trace("m_iLifeValue::" + a_1339);
         this.ResetMovieStatus();
         if(a_1466 <= 0 && Math.abs(a_1350) != a_3491.a_1080 / 40)
         {
            a_1350 = a_3491.a_1080 / 40;
            if(!a_1283)
            {
               a_1350 *= -1;
            }
         }
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         super.a_4209(iRduceLifeValue);
         trace("m_iLifeValue::" + a_1339);
         this.ResetMovieStatus();
         if(a_1466 <= 0 && Math.abs(a_1350) != a_3491.a_1080 / 40)
         {
            a_1350 = a_3491.a_1080 / 40;
            if(!a_1283)
            {
               a_1350 *= -1;
            }
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         super.a_4210();
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_433 != iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = x;
         if(iCurrentTime % 2 == 0)
         {
            return false;
         }
         if(this.stRollingAttackTimes <= 0)
         {
            a_1350 = a_3491.a_1080 / 50;
            if(!a_1283)
            {
               a_1350 *= -1;
            }
            super.a_4216(iCurrentTime);
            if(a_1466 <= 0 && this.stRollingAttackTimes == -10)
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
               this.stRollingAttackTimes = 3 * (2 * 20);
            }
         }
         if(this.stRollingAttackTimes > 0)
         {
            a_1350 = a_3491.a_1080 / (1 * 20);
            if(!a_1283)
            {
               a_1350 *= -1;
            }
            super.a_4216(iCurrentTime);
            --this.stRollingAttackTimes;
            if(m_stCurrentFieldGrid.a_3492())
            {
               this.TriggerBoom();
            }
            else if(m_stCurrentFieldGrid.m_iXGridNo == 1)
            {
               this.TriggerBoom();
            }
            else if(this.stRollingAttackTimes <= 0)
            {
               this.TriggerBoom();
            }
         }
         if(a_1273 == (a_1276[5] as FrameLabel).frame - 5)
         {
            if(!this.isboo)
            {
               this.isboo = true;
               this.boomCard(m_stCurrentFieldGrid);
            }
         }
         if(a_1273 == (a_1276[5] as FrameLabel).frame - 1)
         {
            this.a_3969(a_1339);
         }
         super.a_4216(iCurrentTime);
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      public function TriggerBoom() : void
      {
         this.stRollingAttackTimes = 0;
         this.isboo = false;
         if(a_1275 != 4)
         {
            a_1275 = 4;
            gotoAndStop((a_1276[4] as FrameLabel).frame);
         }
      }
      
      override public function SpecialSkillCallBack(... args) : void
      {
         a_1466 = 0;
         this.TriggerBoom();
      }
      
      override public function play() : void
      {
         super.play();
      }
      
      private function boomCard(stFieldGrid:a_3491) : void
      {
         var xIndex:int = 0;
         var stCurFieldGrid:a_3491 = null;
         if(stFieldGrid == null)
         {
            return;
         }
         var xStart:int = Math.max(stFieldGrid.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(stFieldGrid.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(stFieldGrid.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(stFieldGrid.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stCurFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               this.a_3502(stCurFieldGrid);
            }
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
   }
}

