package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.SummerLittleMouse
{
   import a_4718.b_181;
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.AddBloodEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.effect.a_4143;
   import flash.display.FrameLabel;
   
   public class FlyWheelMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 2800;
      
      private static const MAX_INJURED_LIFE:int = MAX_LIFE * 0.3;
      
      private static const ONE_GRID_SPEED:int = 6;
      
      private static const SPRINTING_SPEED:int = 0.5;
      
      private static const JUMP_OVER_TIME:int = 45;
      
      private var m_isJumping:Boolean = false;
      
      private var m_bInSpecialSkill:Boolean = false;
      
      private var m_iSpecialSkillTick:int = 0;
      
      public function FlyWheelMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(FlyWheelMouseMoveIntruder) as FlyWheelMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return FlyWheelMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         this.m_isJumping = false;
         a_1339 = MAX_LIFE;
         a_1473 = JUMP_OVER_TIME;
         a_1279 = -52;
         a_1272 = 0;
         a_1481 = true;
         BoomIsReduceLife = true;
         this.m_bInSpecialSkill = false;
         return true;
      }
      
      override public function SpecialSkillCallBack(... args) : void
      {
         var stAddBloodEffect:AddBloodEffect = null;
         if(m_stCurrentFieldGrid == null)
         {
            return;
         }
         this.m_bInSpecialSkill = true;
         this.m_iSpecialSkillTick = 6 * 20;
         this.a_3969(iLifeValue - 100000);
         stAddBloodEffect = AddBloodEffect.a_3926();
         stAddBloodEffect.a_1797(false);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,m_stCurrentFieldGrid);
         stAddBloodEffect.x = x;
         stAddBloodEffect.y = y - 10;
         a_1350 = a_3491.a_1080 / (10 * ONE_GRID_SPEED);
         if(a_1283 == false)
         {
            a_1350 *= -1;
         }
      }
      
      private function CheckBack2Normal() : void
      {
         var old:Number = NaN;
         if(this.m_iSpecialSkillTick > 0)
         {
            --this.m_iSpecialSkillTick;
         }
         if(this.m_bInSpecialSkill == true && this.m_iSpecialSkillTick == 0)
         {
            a_1350 = a_3491.a_1080 / 130;
            this.m_bInSpecialSkill = false;
            if(a_1283 == false)
            {
               a_1350 *= -1;
            }
            if(iLifeValue > 2400)
            {
               if(m_stCurrentFieldGrid != null)
               {
                  old = m_stCurrentFieldGrid.m_iHurtRate;
                  m_stCurrentFieldGrid.m_iHurtRate = 1;
                  this.a_3969(iLifeValue - 2400);
                  m_stCurrentFieldGrid.m_iHurtRate = old;
               }
            }
         }
      }
      
      public function SetAnimation(animIdx:int, addIdx:int = 0) : void
      {
         if(a_1339 > 0 && a_1339 < MAX_INJURED_LIFE)
         {
            animIdx += addIdx;
         }
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int, addIdx:int = 0) : void
      {
         if(a_1339 > 0 && a_1339 < MAX_INJURED_LIFE)
         {
            onceAnimIdx += addIdx;
            loopAnimIdx += addIdx;
         }
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            this.SetAnimation(8);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         else if(!this.m_isJumping)
         {
            this.SetAnimation(0,4);
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
         var stSmallMouseBoomdie:a_4143 = null;
         if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iHurtRate <= 0)
         {
            return true;
         }
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
      
      override public function a_4213() : Boolean
      {
         this.a_3969(900);
         if(a_1339 <= 0)
         {
            a_4212();
         }
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var iXGridNo:int = 0;
         var numMoveSpeed:Number = NaN;
         if(!a_1460)
         {
            a_1460 = true;
         }
         this.CheckBack2Normal();
         var numOrigXPos:Number = x;
         if(!this.m_isJumping)
         {
            a_1481 = true;
            super.a_4216(iCurrentTime);
         }
         else
         {
            a_1481 = false;
         }
         if(Boolean(m_stCurrentFieldGrid) && Boolean(m_stCurrentFieldGrid.m_iXGridNo <= 1) && JUMP_OVER_TIME == a_1473)
         {
            this.a_3502(m_stCurrentFieldGrid);
         }
         if(Boolean(m_stCurrentFieldGrid && m_stCurrentFieldGrid.m_iXGridNo > 1) && Boolean(JUMP_OVER_TIME == a_1473) && BattleDestroyUtil.HasDefenseOnGridForJump(m_stCurrentFieldGrid,false,false))
         {
            if(null == a_1278)
            {
               return true;
            }
            --a_1473;
            this.m_isJumping = true;
            this.SetAnimationOnce2Loop(1,2,4);
            return true;
         }
         if(a_1473 > 0 && this.m_isJumping && Boolean(m_stCurrentFieldGrid))
         {
            --a_1473;
            if(a_1473 <= 0)
            {
               this.m_isJumping = false;
               a_1473 = JUMP_OVER_TIME;
               a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
               if(!a_1283)
               {
                  a_1350 *= -1;
               }
               this.ResetMovieStatus();
            }
            if(a_1473 <= 28)
            {
               if(a_1473 == 8)
               {
                  this.SetAnimationOnce2Loop(3,0,4);
               }
               if(a_1473 > 8)
               {
                  if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.a_3492())
                  {
                     this.a_3502(m_stCurrentFieldGrid);
                  }
                  numMoveSpeed = 1 * a_3491.a_1080 / 10;
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
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return true;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      override public function play() : void
      {
         super.play();
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(this.m_isJumping == true && b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
         else if(this.m_isJumping == false)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
   }
}

