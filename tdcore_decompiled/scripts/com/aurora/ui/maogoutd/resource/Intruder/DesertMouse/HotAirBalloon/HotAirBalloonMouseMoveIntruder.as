package com.aurora.ui.maogoutd.resource.Intruder.DesertMouse.HotAirBalloon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4143;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class HotAirBalloonMouseMoveIntruder extends a_4206
   {
      
      private static const MOVE_SPEED:Number = 60 / (3 * 20);
      
      protected var m_isFlying:Boolean = true;
      
      protected var m_iSkill:Boolean;
      
      private var m_iSkillTimes:int;
      
      private var m_iThrowBoomTime:int;
      
      private const FULL_HP:int = 2000;
      
      private const MAX_MOUSE_DOWN_LIFE:int = 1200;
      
      private const HURT_HP:int = 1000;
      
      private var dropBomField:Array = new Array(8,6,4,2);
      
      public function HotAirBalloonMouseMoveIntruder()
      {
         a_1467 = -25;
         super();
         m_IsAirElite = true;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(HotAirBalloonMouseMoveIntruder) as HotAirBalloonMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return HotAirBalloonMouseMoveIntruderMovie;
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
         this.m_iSkill = false;
         this.m_iSkillTimes = 0;
         this.m_iThrowBoomTime = -10;
         a_1339 = this.FULL_HP;
         a_1279 = -42;
         a_1465 = 3;
         a_1464 = true;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
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
               if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
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
         else if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(a_1275 != 8)
               {
                  a_1275 = 8;
                  gotoAndStop((a_1276[8] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 6)
            {
               a_1275 = 6;
               gotoAndStop((a_1276[6] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= 0 && a_1275 != 9)
         {
            a_1275 = 9;
            gotoAndStop((a_1276[9] as FrameLabel).frame);
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
         if(!this.m_isFlying)
         {
            super.a_4216(iCurrentTime);
            return false;
         }
         if(this.m_iThrowBoomTime > 0)
         {
            --this.m_iThrowBoomTime;
            super.a_4216(iCurrentTime);
         }
         if(this.m_iThrowBoomTime == 15)
         {
            if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
            this.m_iSkill = true;
         }
         else if(this.m_iThrowBoomTime == 2)
         {
            this.DropDownBomb();
         }
         else if(this.m_iThrowBoomTime == 0)
         {
            this.m_iSkill = false;
            this.m_iThrowBoomTime = -10;
            ++this.m_iSkillTimes;
            this.ResetMovieStatus();
         }
         if(this.m_iThrowBoomTime == -10)
         {
            super.a_4216(iCurrentTime);
            if(m_stCurrentFieldGrid.m_iXGridNo == 8 && !this.m_iSkill && this.m_iSkillTimes == 0)
            {
               this.m_iThrowBoomTime = 40;
            }
            if(m_stCurrentFieldGrid.m_iXGridNo == 6 && !this.m_iSkill && this.m_iSkillTimes == 1)
            {
               this.m_iThrowBoomTime = 40;
            }
            if(m_stCurrentFieldGrid.m_iXGridNo == 4 && !this.m_iSkill && this.m_iSkillTimes == 2)
            {
               this.m_iThrowBoomTime = 40;
            }
            if(m_stCurrentFieldGrid.m_iXGridNo == 2 && !this.m_iSkill && this.m_iSkillTimes == 3)
            {
               this.m_iThrowBoomTime = 40;
            }
         }
         if(this.m_isFlying && m_stCurrentFieldGrid.m_iXGridNo == 0)
         {
            if(a_1275 != 5)
            {
               a_1275 = 5;
               gotoAndStop((a_1276[4] as FrameLabel).frame);
            }
            this.m_isFlying = false;
            a_1465 = 0;
            a_1464 = false;
         }
         return true;
      }
      
      override public function ShowBoomDieEffect() : void
      {
         var stSmallMouseBoomdie:a_4143 = null;
         var iPosX:int = 0;
         var iPosY:int = 0;
         if(!a_1461 && a_1339 <= 0 && null != parent)
         {
            stSmallMouseBoomdie = a_4143.a_3926();
            stSmallMouseBoomdie.a_1797(a_1283);
            iPosX = (m_stCurrentFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            iPosY = m_stCurrentFieldGrid.m_iYGridNo * a_3491.a_1081;
            stSmallMouseBoomdie.x = iPosX;
            stSmallMouseBoomdie.y = iPosY - 24;
            parent.addChildAt(stSmallMouseBoomdie,parent.getChildIndex(this));
         }
      }
      
      protected function a_4265() : int
      {
         return globalMoveFighterID << 16;
      }
      
      private function DropDownBomb() : void
      {
         if(null == m_stCurrentFieldGrid)
         {
            return;
         }
         var stStartFieldGrid:a_3491 = m_stCurrentFieldGrid;
         var stBaseShot:a_4348 = HotAirBalloonMouseBombShot.a_4344();
         if(!stBaseShot)
         {
            return;
         }
         stBaseShot.a_1797(0,0,a_1377,x - 12,y + 182,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
         stStartFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stBaseShot,BattleLayerDefine.SHOT_TYPE);
      }
   }
}

