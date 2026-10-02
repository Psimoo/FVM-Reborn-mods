package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.CrossServerMouse.WuShu
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class WuShuSaManMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 2000;
      
      private static const MAX_INJURED_LIFE:int = MAX_LIFE * 0.3;
      
      private var m_iAppearedTime:int;
      
      protected var m_iSkill:Boolean;
      
      private var m_iSkillTimes:int;
      
      private var m_iAppearedField:Array = new Array(8,5,2);
      
      public function WuShuSaManMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WuShuSaManMouseMoveIntruder) as WuShuSaManMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WuShuSaManMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 60;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2;
         this.m_iSkill = false;
         this.m_iSkillTimes = 0;
         this.m_iAppearedTime = 0;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > MAX_INJURED_LIFE)
         {
            if(!this.m_iSkill)
            {
               if(a_1475)
               {
                  if(a_1275 != 4)
                  {
                     a_1275 = 4;
                     gotoAndStop((a_1276[4] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(!this.m_iSkill)
            {
               if(a_1475)
               {
                  if(a_1275 != 5)
                  {
                     a_1275 = 5;
                     gotoAndStop((a_1276[5] as FrameLabel).frame);
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
            this.play();
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
         if(m_stCurrentFieldGrid != null)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         super.a_4210();
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var a_1598:a_3491 = null;
         var i:int = 0;
         if(!a_1460)
         {
            a_1465 = 0;
            a_1275 = 3;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
            a_1460 = true;
            this.m_iAppearedTime = iCurrentTime;
         }
         trace("m_iCurrentFrame::::" + a_1273);
         if(this.m_iSkill)
         {
            if(iCurrentTime % 2)
            {
               if(a_1273 == 51 || a_1273 == 75)
               {
                  for(i = 0; i < BattleFieldView.a_1011; i++)
                  {
                     a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,m_stCurrentFieldGrid.m_iYGridNo);
                     this.SleepSkill(a_1598);
                  }
               }
               if(a_1273 == 56 || a_1273 == 79)
               {
                  this.m_iSkill = false;
                  ++this.m_iSkillTimes;
                  this.ResetMovieStatus();
               }
            }
         }
         else
         {
            super.a_4216(iCurrentTime);
            if(m_stCurrentFieldGrid == null)
            {
               return true;
            }
            if(m_stCurrentFieldGrid.m_iXGridNo == 8 && !this.m_iSkill && this.m_iSkillTimes == 0)
            {
               this.PlaySkillMovie();
            }
            if(m_stCurrentFieldGrid.m_iXGridNo == 5 && !this.m_iSkill && this.m_iSkillTimes == 1)
            {
               this.PlaySkillMovie();
            }
            if(m_stCurrentFieldGrid.m_iXGridNo == 2 && !this.m_iSkill && this.m_iSkillTimes == 2)
            {
               this.PlaySkillMovie();
            }
         }
         return true;
      }
      
      private function PlaySkillMovie() : void
      {
         if(a_1339 > MAX_INJURED_LIFE)
         {
            a_1275 = 2;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
         }
         else if(a_1339 > 0)
         {
            a_1275 = 3;
            gotoAndStop((a_1276[3] as FrameLabel).frame);
         }
         this.m_iSkill = true;
      }
      
      private function SleepSkill(stTempFieldGrid:a_3491) : void
      {
         if(Boolean(stTempFieldGrid) && null != stTempFieldGrid.m_stAttackFighter)
         {
            stTempFieldGrid.m_stAttackFighter.SleepTime2(10 * 20);
         }
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}

