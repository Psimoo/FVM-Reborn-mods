package com.aurora.ui.maogoutd.resource.Intruder.zombie
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.zombie.handEffect.JumpingMouseHandEffect;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class ZombieJumpingMouseSecondTransMoveIntruder extends BaseZombieMoveIntruder
   {
      
      private var m_isJumping:Boolean = false;
      
      private var a_1506:Boolean = true;
      
      public function ZombieJumpingMouseSecondTransMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(ZombieJumpingMouseSecondTransMoveIntruder) as ZombieJumpingMouseSecondTransMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return ZombieJumpingMouseSecondTransMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 40;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1473 = 32;
         this.m_isJumping = false;
         this.a_1506 = true;
         a_1339 = 2400;
         a_1279 = -width * 0.3;
         a_1272 = 0;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 300)
         {
            if(a_1475)
            {
               if(a_1275 != 6)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[6] as FrameLabel).frame);
               }
            }
            else if(this.a_1506)
            {
               if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 4)
            {
               a_1275 = 4;
               gotoAndStop((a_1276[4] as FrameLabel).frame);
            }
         }
         else if(a_1339 > 0)
         {
            OnZombify(JumpingMouseHandEffect.a_3926());
            if(a_1475)
            {
               if(a_1275 != 7)
               {
                  a_1275 = 7;
                  gotoAndStop((a_1276[7] as FrameLabel).frame);
               }
            }
            else if(this.a_1506)
            {
               if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 5)
            {
               a_1275 = 5;
               gotoAndStop((a_1276[5] as FrameLabel).frame);
            }
         }
         else if(a_1339 <= 0)
         {
            if(this.a_1506)
            {
               if(a_1275 != 9)
               {
                  a_1275 = 9;
                  gotoAndStop((a_1276[9] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 8)
            {
               a_1275 = 8;
               gotoAndStop((a_1276[8] as FrameLabel).frame);
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
         if(a_1339 == 100)
         {
            if(a_1475)
            {
               if(a_1275 != 7)
               {
                  a_1275 = 7;
                  gotoAndStop((a_1276[7] as FrameLabel).frame);
               }
            }
            else if(this.a_1506)
            {
               if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 5)
            {
               a_1275 = 5;
               gotoAndStop((a_1276[5] as FrameLabel).frame);
            }
         }
         else if(a_1339 <= 0)
         {
            if(this.a_1506)
            {
               if(a_1275 != 9)
               {
                  a_1275 = 9;
                  gotoAndStop((a_1276[9] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 8)
            {
               a_1275 = 8;
               gotoAndStop((a_1276[8] as FrameLabel).frame);
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
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numMoveSpeed:Number = NaN;
         var numYSpeed:Number = NaN;
         var iXGridNo:int = 0;
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         if(Boolean(32 == a_1473) && Boolean(m_stCurrentFieldGrid) && BattleDestroyUtil.HasDefenseOnGridForJumpWithTool(m_stCurrentFieldGrid))
         {
            if(null == a_1278)
            {
               return true;
            }
            --a_1473;
            this.m_isJumping = true;
            if(a_1339 > 100)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
               a_3419();
            }
            else if(a_1339 > 50)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
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
               a_1473 = 32;
               a_1350 = a_3491.a_1080 / 40;
               if(!a_1283)
               {
                  a_1350 *= -1;
               }
               play();
            }
            if(a_1473 <= 16)
            {
               numMoveSpeed = 1 * a_3491.a_1080 / 16;
               if(!a_1283)
               {
                  numMoveSpeed *= -1;
               }
               x += numMoveSpeed;
               numYSpeed = a_3491.a_1081 / 8;
               y += a_1473 > 8 ? -numYSpeed : numYSpeed;
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
                  if(m_stCurrentFieldGrid)
                  {
                     m_stCurrentFieldGrid.a_3457(this);
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
                  }
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

