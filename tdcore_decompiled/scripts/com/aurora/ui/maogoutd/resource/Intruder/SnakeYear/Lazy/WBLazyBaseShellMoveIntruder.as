package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Lazy
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class WBLazyBaseShellMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 30000;
      
      private static const MAX_INJURED_LIFE:int = 30000 * 0.3;
      
      private var m_stBoss:a_4206;
      
      private var m_iMoveType:int = 0;
      
      private var m_iEndX:int = 0;
      
      private var m_iEndY:int = 0;
      
      private var m_iRemainSeconds:int = 0;
      
      private var iStartTick:int = -1;
      
      private var iLastTick:int = -1;
      
      private var iCreateTick:int = -1;
      
      public function WBLazyBaseShellMoveIntruder()
      {
         super();
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         this.SetSpeed(0);
         a_1339 = MAX_LIFE;
         a_1272 = 0;
         a_1481 = false;
         a_1464 = true;
         a_1463 = true;
         BoomIsReduceLife = true;
         return true;
      }
      
      private function SetSpeed(speed:Number) : void
      {
         a_1350 = a_3491.a_1080 / (20 * speed);
         if(!a_1283)
         {
            a_1350 *= -1;
         }
      }
      
      public function InitBoss(boss:a_4206, moveType:int, iNoX:int, iNoY:int, remainSeconds:int = 50) : void
      {
         this.m_stBoss = boss;
         this.m_iMoveType = moveType;
         this.m_iEndX = iNoX;
         this.m_iEndY = iNoY;
         this.iLastTick = -1;
         this.m_iRemainSeconds = remainSeconds;
         if(moveType == 0)
         {
            this.SetSpeed(0);
            this.SetAnimationOnce2Loop(0,2,0,4);
         }
         else
         {
            this.SetAnimation2(1);
            this.SetSpeed(0.5);
         }
      }
      
      override protected function a_3940() : Boolean
      {
         this.AddTag2Boss();
         super.a_3940();
         return true;
      }
      
      private function AddTag2Boss() : void
      {
         if(tagCom.HasTag(120) == true)
         {
            this.AddShellTag(125);
         }
         else if(tagCom.HasTag(121) == true)
         {
            this.AddShellTag(126);
         }
         else if(tagCom.HasTag(122) == true)
         {
            this.AddShellTag(127);
         }
         else if(tagCom.HasTag(123) == true)
         {
            this.AddShellTag(128);
         }
         this.m_stBoss = null;
      }
      
      private function AddShellTag(tag:int) : void
      {
         if(this.m_stBoss == null)
         {
            return;
         }
         if(tag == 128)
         {
            this.m_stBoss.tagCom.AddTag(tag);
         }
         else if(!this.m_stBoss.tagCom.HasTag(125) && !this.m_stBoss.tagCom.HasTag(126) && !this.m_stBoss.tagCom.HasTag(127))
         {
            this.m_stBoss.tagCom.AddTag(tag);
         }
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var grid:a_3491 = null;
         var iEndX:Number = NaN;
         if(!a_1460)
         {
            a_1460 = true;
            this.iLastTick = -1;
            this.iCreateTick = iCurrentTime;
         }
         if(this.iLastTick != -1 && iCurrentTime - this.iLastTick == 10 * 20)
         {
            this.SetAnimationOnce2Loop(3,2,5,4);
            this.iLastTick = iCurrentTime;
         }
         if(this.m_iMoveType == 0)
         {
            if(a_1273 == 11)
            {
               grid = m_stCurrentFieldGrid;
               BattleDestroyUtil.ClearOneGrid(grid.m_stCurrentBattbleFieldView.a_3438(grid.m_iXGridNo + 2,grid.m_iYGridNo));
            }
            else if(a_1273 == 23)
            {
               BattleDestroyUtil.ClearOneGrid(m_stCurrentFieldGrid);
               this.iLastTick = iCurrentTime;
            }
         }
         else if(this.iLastTick == -1)
         {
            this.SetAnimation(1,1);
            BattleDestroyUtil.ClearOneGrid(m_stCurrentFieldGrid);
            iEndX = a_3491.a_1080 * (this.m_iEndX + 0.5);
            if(x <= iEndX)
            {
               x = iEndX;
               this.iLastTick = iCurrentTime;
               this.SetSpeed(0);
               this.SetAnimation(2,4);
            }
         }
         if(iCurrentTime - this.iCreateTick == this.m_iRemainSeconds * 20)
         {
            this.m_stBoss = null;
            this.a_3940();
         }
         return super.a_4216(iCurrentTime);
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(this.iLastTick != -1)
            {
               this.SetAnimation(2,4);
            }
         }
         else
         {
            this.SetAnimation(6,6);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(tagCom.HasTag(120) && iEffectTime > 0)
         {
            if(b_182.a_433 == iEffectType)
            {
               ReduceLife2(3000,[130]);
            }
            else if(b_182.a_434 == iEffectType)
            {
               ReduceLife2(30000,[130]);
            }
         }
         else if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      public function InDamage() : Boolean
      {
         return a_1339 > 0 && a_1339 < MAX_INJURED_LIFE;
      }
      
      override protected function set a_1275(value:int) : void
      {
         super.a_1275 = value;
      }
      
      public function SetAnimation(animIdx:int, animIdx2:int) : void
      {
         if(this.InDamage())
         {
            animIdx = animIdx2;
         }
         if(a_1275 != animIdx)
         {
            this.a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimation2(animIdx:int) : void
      {
         this.a_1275 = animIdx;
         gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
         a_3419();
      }
      
      override public function ReduceAllLife(iRduceLifeValue:int, bIsIgnoreArmor:Boolean = false, ishowHuijing:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(this.iLastTick == -1)
         {
            return false;
         }
         if(tagCom.HasTag(120))
         {
            return true;
         }
         if(!tagCom.HasTag(121))
         {
            if(tagCom.HasTag(122))
            {
               if(_damageParam.indexOf(132) != -1)
               {
                  return super.a_4209(3000);
               }
            }
            else if(tagCom.HasTag(123))
            {
               if(iRduceLifeValue > 100000)
               {
                  iRduceLifeValue = iLifeValue;
                  return super.a_4209(iRduceLifeValue);
               }
               return false;
            }
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(this.iLastTick == -1)
         {
            return false;
         }
         if(_damageParam.indexOf(130) != -1)
         {
            return super.a_3969(iRduceLifeValue);
         }
         if(tagCom.HasTag(120))
         {
            return true;
         }
         if(!tagCom.HasTag(121))
         {
            if(tagCom.HasTag(122))
            {
               if(_damageParam.indexOf(132) != -1)
               {
                  return super.a_3969(3000);
               }
            }
            else if(tagCom.HasTag(123))
            {
               if(iRduceLifeValue > 100000)
               {
                  iRduceLifeValue = iLifeValue;
                  return super.a_3969(iRduceLifeValue);
               }
               return false;
            }
         }
         return true;
      }
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int, onceAnimIdx2:int, loopAnimIdx2:int) : void
      {
         if(this.InDamage())
         {
            onceAnimIdx = onceAnimIdx2;
            loopAnimIdx = loopAnimIdx2;
         }
         this.a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      override public function a_4210() : Boolean
      {
         if(tagCom.HasTag(121))
         {
            ReduceLife2(30000,[130]);
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
   }
}

