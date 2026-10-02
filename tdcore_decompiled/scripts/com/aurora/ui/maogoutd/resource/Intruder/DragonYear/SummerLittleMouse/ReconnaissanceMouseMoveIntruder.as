package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.SummerLittleMouse
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class ReconnaissanceMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 750;
      
      private static const MAX_INJURED_LIFE:int = 400;
      
      private static const SPEED_ONE_GRID:int = 4;
      
      private static const JUMP_OVER_TIME:int = 40;
      
      private var m_isJumping:Boolean = false;
      
      private var m_bInSpecialSkill:Boolean = false;
      
      private var m_iSpecialSkillTick:int = 0;
      
      public function ReconnaissanceMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(ReconnaissanceMouseMoveIntruder) as ReconnaissanceMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return ReconnaissanceMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (20 * SPEED_ONE_GRID);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1473 = JUMP_OVER_TIME;
         this.m_isJumping = false;
         a_1279 = -width * 0.3;
         a_1272 = 0;
         this.m_bInSpecialSkill = false;
         return true;
      }
      
      override public function SpecialSkillCallBack(... args) : void
      {
         this.m_bInSpecialSkill = true;
         this.m_iSpecialSkillTick = 6 * 20;
         a_1350 = a_3491.a_1080 / (10 * SPEED_ONE_GRID);
         if(a_1283 == false)
         {
            a_1350 *= -1;
         }
      }
      
      private function CheckBack2Normal() : void
      {
         if(this.m_iSpecialSkillTick > 0)
         {
            --this.m_iSpecialSkillTick;
         }
         if(this.m_bInSpecialSkill == true && this.m_iSpecialSkillTick == 0)
         {
            this.m_bInSpecialSkill = false;
            a_1350 = a_3491.a_1080 / (20 * SPEED_ONE_GRID);
            if(a_1283 == false)
            {
               a_1350 *= -1;
            }
         }
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > MAX_INJURED_LIFE)
         {
            if(a_1275 != 0 && a_1473 == JUMP_OVER_TIME)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
         }
         else if(a_1339 > 0)
         {
            if(a_1275 != 1 && a_1473 == JUMP_OVER_TIME)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         else if(a_1339 <= 0)
         {
            if(a_1275 != 8)
            {
               a_1275 = 8;
               gotoAndStop((a_1276[8] as FrameLabel).frame);
            }
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            play();
         }
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iHurtRate <= 0)
         {
            return true;
         }
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
         return super.a_4215(stBaseDefense);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var iXGridNo:int = 0;
         var numMoveSpeed:Number = NaN;
         this.CheckBack2Normal();
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         if(Boolean(JUMP_OVER_TIME == a_1473) && Boolean(m_stCurrentFieldGrid) && BattleDestroyUtil.HasDefenseOnGridForJump(m_stCurrentFieldGrid,false))
         {
            if(null == a_1278)
            {
               return true;
            }
            --a_1473;
            this.m_isJumping = true;
            if(a_1339 > MAX_INJURED_LIFE)
            {
               a_1275 = 3;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
               a_3419();
            }
            else if(a_1339 > 0)
            {
               a_1275 = 6;
               gotoAndStop((a_1276[5] as FrameLabel).frame);
               a_3419();
            }
            else
            {
               this.m_isJumping = false;
            }
            return true;
         }
         if(a_1473 > 0 && this.m_isJumping && Boolean(m_stCurrentFieldGrid))
         {
            --a_1473;
            if(a_1473 <= 0)
            {
               this.m_isJumping = false;
               a_1473 = JUMP_OVER_TIME;
               a_1350 = a_3491.a_1080 / (20 * SPEED_ONE_GRID);
               if(!a_1283)
               {
                  a_1350 *= -1;
               }
               this.ResetMovieStatus();
            }
            if(a_1473 <= 16)
            {
               if(a_1473 == 16)
               {
                  if(a_1339 > MAX_INJURED_LIFE)
                  {
                     a_1275 = 0;
                     gotoAndStop((a_1276[4] as FrameLabel).frame);
                     a_3419();
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = 1;
                     gotoAndStop((a_1276[7] as FrameLabel).frame);
                     a_3419();
                  }
               }
               if(a_1473 > 4)
               {
                  numMoveSpeed = 1 * a_3491.a_1080 / 12;
                  if(!a_1283)
                  {
                     numMoveSpeed *= -1;
                  }
                  if(Boolean(m_stCurrentFieldGrid.m_stAttackFighter) && m_stCurrentFieldGrid.m_stAttackFighter.iBreadFighterType > 1)
                  {
                     numMoveSpeed = 0;
                  }
                  x += numMoveSpeed;
               }
               iXGridNo = int(x / a_3491.a_1080);
               if(a_1283)
               {
                  iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
               }
               if(iXGridNo >= 0 && iXGridNo < BattleFieldView.a_1011 && m_stCurrentFieldGrid.m_iXGridNo != iXGridNo)
               {
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo).a_3459(this);
               }
               else if(iXGridNo < (a_1283 ? -1 : 0) || iXGridNo > BattleFieldView.a_1011)
               {
                  if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.isOwnBattleField)
                  {
                     a_1088.a_2062(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.iTimeIntervalNum,m_stCurrentFieldGrid.m_iYGridNo);
                  }
                  trace("iXGridNo < -1 || iXGridNo > BattleFieldView.ms_iXGridNum  Realease the MoveIntruder");
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
                  a_3940();
                  return true;
               }
            }
         }
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
   }
}

