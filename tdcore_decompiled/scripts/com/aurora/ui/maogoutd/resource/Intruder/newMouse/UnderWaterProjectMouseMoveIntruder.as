package com.aurora.ui.maogoutd.resource.Intruder.newMouse
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4143;
   import com.aurora.ui.maogoutd.resource.effect.baseClimb.BaseClimbEffect;
   import com.aurora.ui.maogoutd.resource.effect.baseClimb.LanderDestroyEffect;
   import com.aurora.ui.maogoutd.resource.effect.baseClimb.LanderFullEffect;
   import flash.display.FrameLabel;
   
   public class UnderWaterProjectMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 1620;
      
      private static const MAX_INJURED_LIFE:int = MAX_LIFE / 2;
      
      private var a_1531:int = 0;
      
      private var a_1532:Boolean;
      
      public function UnderWaterProjectMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(UnderWaterProjectMouseMoveIntruder) as UnderWaterProjectMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return UnderWaterProjectMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 60;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1473 = 0;
         this.a_1531 = 0;
         this.a_1532 = true;
         a_1339 = MAX_LIFE;
         a_1466 = 240;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > MAX_INJURED_LIFE)
         {
            if(a_1466 > 90)
            {
               if(a_1475)
               {
                  if(a_1275 != 12)
                  {
                     a_1275 = 12;
                     gotoAndStop((a_1276[12] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
               }
            }
            else if(a_1466 > 0)
            {
               if(a_1475)
               {
                  if(a_1275 != 13)
                  {
                     a_1275 = 13;
                     gotoAndStop((a_1276[13] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            else if(a_1466 <= 0)
            {
               if(a_1475)
               {
                  if(a_1275 != 16)
                  {
                     a_1275 = 16;
                     if(-100 != a_1466)
                     {
                        gotoAndStop((a_1276[10] as FrameLabel).frame);
                        a_1466 = -100;
                     }
                     else
                     {
                        gotoAndStop((a_1276[16] as FrameLabel).frame);
                     }
                  }
               }
               else if(a_1275 != 2)
               {
                  a_1275 = 2;
                  if(-100 != a_1466)
                  {
                     gotoAndStop((a_1276[10] as FrameLabel).frame);
                     a_1466 = -100;
                  }
                  else
                  {
                     gotoAndStop((a_1276[2] as FrameLabel).frame);
                  }
               }
            }
         }
         else if(a_1339 > 0)
         {
            if(a_1466 > 90)
            {
               if(a_1475)
               {
                  if(a_1275 != 14)
                  {
                     a_1275 = 14;
                     gotoAndStop((a_1276[14] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            else if(a_1466 > 0)
            {
               if(a_1475)
               {
                  if(a_1275 != 15)
                  {
                     a_1275 = 15;
                     gotoAndStop((a_1276[15] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 6)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[6] as FrameLabel).frame);
               }
            }
            else if(a_1466 <= 0)
            {
               if(a_1475)
               {
                  if(a_1275 != 17)
                  {
                     a_1275 = 17;
                     if(-100 != a_1466)
                     {
                        gotoAndStop((a_1276[11] as FrameLabel).frame);
                        a_1466 = -100;
                     }
                     else
                     {
                        gotoAndStop((a_1276[17] as FrameLabel).frame);
                     }
                  }
               }
               else if(a_1275 != 9)
               {
                  a_1275 = 9;
                  if(-100 != a_1466)
                  {
                     gotoAndStop((a_1276[11] as FrameLabel).frame);
                     a_1466 = -100;
                  }
                  else
                  {
                     gotoAndStop((a_1276[9] as FrameLabel).frame);
                  }
               }
            }
         }
         else if(a_1339 <= 0 && a_1275 != 19 && a_1275 != 18)
         {
            if(a_1466 > 0)
            {
               a_1275 = 19;
               gotoAndStop((a_1276[19] as FrameLabel).frame);
            }
            else
            {
               a_1275 = 18;
               gotoAndStop((a_1276[18] as FrameLabel).frame);
            }
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            this.play();
         }
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         this.ResetMovieStatus();
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         super.a_4209(iRduceLifeValue);
         this.ResetMovieStatus();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         var stSmallMouseBoomdie:a_4143 = null;
         this.a_3969(900);
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            stSmallMouseBoomdie = a_4143.a_3926();
            stSmallMouseBoomdie.a_1797(a_1283);
            stSmallMouseBoomdie.x = x;
            stSmallMouseBoomdie.y = y;
            parent.addChildAt(stSmallMouseBoomdie,parent.getChildIndex(this));
            a_3940();
         }
         return true;
      }
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         if(iCutLifeValue > 200)
         {
            iCutLifeValue = 200;
         }
         a_1339 -= iCutLifeValue;
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            a_3940();
         }
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         this.a_3969(900);
         if(a_1339 <= 0)
         {
            a_4212();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numMoveSpeed:Number = NaN;
         var iXGridNo:int = 0;
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         if(a_1474 > 0)
         {
            return true;
         }
         if(Boolean(a_1466 > 0 && a_1473 == 0 && this.a_1531 == 0) && Boolean(m_stCurrentFieldGrid) && (Boolean(null != m_stCurrentFieldGrid.m_stProtector) || Boolean(m_stCurrentFieldGrid.m_stAttackFighter && m_stCurrentFieldGrid.m_stAttackFighter.iBreadFighterType > 0)))
         {
            a_1473 = 32;
         }
         if(Boolean(32 == a_1473 && m_stCurrentFieldGrid) && Boolean(m_stCurrentFieldGrid.m_stBaseLander == null) && BattleDestroyUtil.HasDefenseOnGridForJump(m_stCurrentFieldGrid,false))
         {
            --a_1473;
            this.a_1531 = 1;
            if(a_1466 > 90)
            {
               if(a_1339 > 100)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = 9;
                  gotoAndStop((a_1276[7] as FrameLabel).frame);
               }
               a_1466 = -100;
               this.a_1532 = true;
               a_3419();
            }
            else if(a_1466 > 0)
            {
               if(a_1339 > 100)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = 9;
                  gotoAndStop((a_1276[8] as FrameLabel).frame);
               }
               a_1466 = -100;
               this.a_1532 = false;
               a_3419();
            }
            else
            {
               this.a_1531 = 2;
               a_1473 = 0;
            }
            return true;
         }
         if(a_1473 > 0 && this.a_1531 == 1 && Boolean(m_stCurrentFieldGrid))
         {
            --a_1473;
            if(a_1473 <= 0)
            {
               this.a_1531 = 3;
               a_1350 = a_3491.a_1080 / 120;
               if(!a_1283)
               {
                  a_1350 *= -1;
               }
            }
            this.play();
            if(a_1473 > 21)
            {
               return true;
            }
            if(a_1473 == 21 && m_stCurrentFieldGrid.ClimbIsEmpty() && (Boolean(m_stCurrentFieldGrid.m_stProtector) || Boolean(m_stCurrentFieldGrid.m_stAttackFighter && m_stCurrentFieldGrid.m_stAttackFighter.iBreadFighterType > 0)))
            {
               m_stCurrentFieldGrid.m_stBaseLander = this.a_1532 ? LanderFullEffect.a_3926() : LanderDestroyEffect.a_3926();
               m_stCurrentFieldGrid.m_stBaseLander.x = x;
               m_stCurrentFieldGrid.m_stBaseLander.y = y + a_3491.a_1081 / 2;
               m_stCurrentFieldGrid.m_stBaseLander.a_1797(a_1283);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(m_stCurrentFieldGrid.m_stBaseLander,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,m_stCurrentFieldGrid);
               if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
               {
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(m_stCurrentFieldGrid.m_stBaseLander,m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
               }
            }
            numMoveSpeed = a_3491.a_1080 / 20;
            if(!a_1283)
            {
               numMoveSpeed *= -1;
            }
            x += numMoveSpeed;
            y += 6 * (10 - a_1473 > 0 ? 1 : -1);
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
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}

