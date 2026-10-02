package com.aurora.ui.maogoutd.resource.Intruder.ThunderCity.JumpMouse
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class JumpMouseMoveIntruder extends a_4206
   {
      
      private var m_isJumping:Boolean = false;
      
      private var m_clearCard:Boolean;
      
      public function JumpMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(JumpMouseMoveIntruder) as JumpMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return JumpMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 40;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1473 = 17;
         this.m_isJumping = false;
         this.m_clearCard = false;
         a_1464 = true;
         a_1339 = 800;
         a_1279 = -width * 0.3;
         m_iYDisplayCenterPos = -18;
         a_1272 = 0;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 100)
         {
            if(!this.m_isJumping)
            {
               if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
               }
            }
         }
         else if(a_1339 > 0)
         {
            if(!this.m_isJumping)
            {
               if(a_1275 != 2)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
         }
         else if(a_1339 <= 0)
         {
            if(a_1275 != 4)
            {
               a_1275 = 4;
               gotoAndStop((a_1276[4] as FrameLabel).frame);
            }
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
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(m_stCurrentFieldGrid)
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
         var numMoveSpeed:Number = NaN;
         var iXGridNo:int = 0;
         var numOrigXPos:Number = x;
         if(Boolean(m_stCurrentFieldGrid.m_stAttackFighter) && m_stCurrentFieldGrid.m_stAttackFighter.iBreadFighterType > 1)
         {
            return false;
         }
         if(iCurrentTime % 2 == 0)
         {
            return false;
         }
         super.a_4216(iCurrentTime);
         if(Boolean(m_stCurrentFieldGrid) && Boolean(!this.m_isJumping) && BattleDestroyUtil.HasDefenseOnGridForJump(m_stCurrentFieldGrid,false))
         {
            if(null == a_1278)
            {
               return true;
            }
            this.m_isJumping = true;
            this.m_clearCard = false;
            a_1350 = 0;
            if(a_1339 > 100)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
               a_3419();
            }
            else if(a_1339 > 50)
            {
               a_1275 = 3;
               gotoAndStop((a_1276[3] as FrameLabel).frame);
               a_3419();
            }
            else
            {
               this.m_isJumping = false;
            }
            return true;
         }
         if(a_1273 > 17 && a_1273 < 22 || a_1273 > 42 && a_1273 < 47)
         {
            numMoveSpeed = (1 * a_3491.a_1080 + 30) / 4;
            if(!a_1283)
            {
               numMoveSpeed *= -1;
            }
            if(Boolean(m_stCurrentFieldGrid.m_stAttackFighter) && m_stCurrentFieldGrid.m_stAttackFighter.iBreadFighterType > 1)
            {
               numMoveSpeed = 0;
            }
            x += numMoveSpeed * a_1470;
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
               if(m_stCurrentFieldGrid)
               {
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               }
               a_3940();
               return true;
            }
         }
         if((a_1273 == 22 || a_1273 == 47) && !this.m_clearCard)
         {
            this.m_clearCard = true;
            this.a_3502(m_stCurrentFieldGrid);
         }
         if((a_1273 == 24 || a_1273 == 49) && this.m_isJumping && Boolean(m_stCurrentFieldGrid))
         {
            this.m_isJumping = false;
            a_1350 = a_3491.a_1080 / 40;
            if(!a_1283)
            {
               a_1350 *= -1;
            }
            this.ResetMovieStatus();
            play();
         }
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return true;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
   }
}

