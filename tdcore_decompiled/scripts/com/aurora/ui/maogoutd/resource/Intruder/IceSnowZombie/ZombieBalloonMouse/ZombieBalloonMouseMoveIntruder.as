package com.aurora.ui.maogoutd.resource.Intruder.IceSnowZombie.ZombieBalloonMouse
{
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class ZombieBalloonMouseMoveIntruder extends a_4206
   {
      
      private static const MOVE_SPEED:Number = 60 / (3 * 20);
      
      protected var m_isFlying:Boolean = true;
      
      protected var a_1496:int;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      protected var a_1598:a_3491;
      
      protected var m_numTargetYPos:Number;
      
      private var m_iSummonUpMoveIntruderSequence:int = 1;
      
      private const FULL_HP:int = 1200;
      
      private const MAX_MOUSE_DOWN_LIFE:int = 720;
      
      private const HURT_HP:int = 600;
      
      private const DEAD_HP:int = 0;
      
      private var m_startDropTimers:int = -10;
      
      private var stTargetFieldGrid:a_3491;
      
      public function ZombieBalloonMouseMoveIntruder()
      {
         a_1467 = -25;
         super();
         m_IsAirElite = true;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(ZombieBalloonMouseMoveIntruder) as ZombieBalloonMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return ZombieBalloonMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = MOVE_SPEED;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         this.m_isFlying = true;
         this.a_1496 = 12;
         a_1339 = this.FULL_HP;
         a_1279 = -30;
         trace("m_iXDisplayCenterPos:" + a_1279);
         a_1465 = 3;
         a_1464 = true;
         this.m_iSummonUpMoveIntruderSequence = 1;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.m_startDropTimers = -10;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         trace("m_iLifeValue:" + a_1339);
         if(this.m_isFlying)
         {
            if(a_1339 > this.MAX_MOUSE_DOWN_LIFE)
            {
               if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
               }
            }
            else
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
               a_1465 = 0;
               this.m_isFlying = false;
               a_1464 = false;
            }
         }
         else if(a_1339 > this.HURT_HP)
         {
            if(a_1475)
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
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(a_1275 != 7)
               {
                  a_1275 = 7;
                  gotoAndStop((a_1276[7] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 5)
            {
               a_1275 = 5;
               gotoAndStop((a_1276[5] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= 0 && a_1275 != 8)
         {
            a_1275 = 8;
            gotoAndStop((a_1276[8] as FrameLabel).frame);
            a_3419();
            if(null != m_stCurrentFieldGrid)
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
         this.ResetMovieStatus();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(null != m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
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
         if(a_1273 == (a_1276[3] as FrameLabel).frame)
         {
            a_1275 = 4;
            gotoAndStop((a_1276[4] as FrameLabel).frame);
         }
         if(this.m_isFlying)
         {
            if(this.m_startDropTimers > 0)
            {
               --this.m_startDropTimers;
            }
            else
            {
               this.stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
               if(this.stTargetFieldGrid != null && this.stTargetFieldGrid.a_3492())
               {
                  this.m_startDropTimers = 5 * 20;
               }
               else if(m_stCurrentFieldGrid.m_iXGridNo == 0)
               {
                  if(a_1275 != 3)
                  {
                     a_1275 = 3;
                     gotoAndStop((a_1276[3] as FrameLabel).frame);
                  }
                  this.m_isFlying = false;
                  a_1465 = 0;
                  a_1464 = false;
               }
            }
            if(this.m_startDropTimers == 3.5 * 20)
            {
               if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
               this.DropDownBomb();
            }
            else if(this.m_startDropTimers == 1 * 20)
            {
               if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
               this.DropDownBomb();
            }
            else if(this.m_startDropTimers == 0)
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
               this.m_isFlying = false;
               a_1465 = 0;
               a_1464 = false;
            }
         }
         super.a_4216(iCurrentTime);
         return true;
      }
      
      protected function a_4265() : int
      {
         return (globalMoveFighterID << 16) + this.m_iSummonUpMoveIntruderSequence++;
      }
      
      private function DropDownBomb() : void
      {
         if(null == m_stCurrentFieldGrid)
         {
            return;
         }
         var stStartFieldGrid:a_3491 = m_stCurrentFieldGrid;
         var stBaseShot:a_4348 = ZombieBalloonMouseBombShot.a_4344();
         if(!stBaseShot)
         {
            return;
         }
         stBaseShot.a_1797(0,0,a_1377,x - 12,y + 160,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
         stStartFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stBaseShot,BattleLayerDefine.SHOT_TYPE);
         if(a_1275 != 0)
         {
            a_1275 = 0;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
      }
   }
}

