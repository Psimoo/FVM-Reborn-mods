package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldMouse
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class WBHermitMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 3200;
      
      private static const MAX_INJURED_LIFE:int = 1600;
      
      private static const ONE_GRID_SPEED:int = 4;
      
      private var m_iState:int = 0;
      
      private var m_bEatDie:Boolean = false;
      
      private var m_bSkillCreate:Boolean = false;
      
      public function WBHermitMouseMoveIntruder()
      {
         super();
         a_1279 = -26;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBHermitMouseMoveIntruder,WBHermitMouseMoveIntruderMovie) as WBHermitMouseMoveIntruder;
      }
      
      override public function get height() : Number
      {
         return 96;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1339 = MAX_LIFE;
         a_1272 = 0;
         BoomIsReduceLife = true;
         a_1462 = false;
         a_1464 = true;
         a_1377 = 200;
         this.m_bEatDie = false;
         a_1275 = -1;
         this.m_iState = -1;
         this.SetState(this.m_bSkillCreate ? 0 : 1);
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.m_bSkillCreate = false;
         return true;
      }
      
      private function SetState(state:int) : void
      {
         if(this.m_iState == state)
         {
            return;
         }
         this.m_iState = state;
         if(state == 0)
         {
            this.SetAnimation(0);
         }
         else
         {
            this.SetAnimation(state,5);
         }
         if(state == 1)
         {
            this.SetSpeed(ONE_GRID_SPEED);
         }
         else
         {
            this.SetSpeed(0);
         }
         if(state == 0)
         {
            a_1481 = true;
            this.SetCannotSee(true);
         }
         else if(state == 1)
         {
            a_1481 = true;
            this.SetCannotSee(true);
         }
         else if(state == 2)
         {
            a_1481 = true;
            this.SetCannotSee(false);
         }
         else if(state == 3)
         {
            a_1481 = true;
            this.SetCannotSee(false);
         }
         else if(state == 4)
         {
            a_1481 = true;
            this.SetCannotSee(false);
         }
         else if(state == 5)
         {
            a_1481 = false;
            this.SetCannotSee(true);
         }
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            this.SetAnimation(11);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         if(int(x / a_3491.a_1080) <= 0)
         {
            SetCannotSeeByFighter(false);
         }
         this.Eat(iCurrentTime);
         SetGameMapModePicnicPosition(numOrigXPos);
         return true;
      }
      
      private function DoEatDefence(stBaseDefense:a_3962, iCurrentTime:int) : Boolean
      {
         if(stBaseDefense == null)
         {
            return false;
         }
         if(!this.IsCanEat2(stBaseDefense))
         {
            return false;
         }
         a_1477 = iCurrentTime;
         a_1475 = true;
         BattleFieldView.ms_kenShi29.play();
         stBaseDefense.m_iDieType = 1;
         stBaseDefense.a_3969(stBaseDefense is a_3924 ? 10 : a_1377);
         if(stBaseDefense.iLifeValue <= 0)
         {
            this.m_bEatDie = true;
         }
         return true;
      }
      
      protected function IsCanEat2(stBaseDefense:a_3962) : Boolean
      {
         if(stBaseDefense == null)
         {
            return false;
         }
         if(stBaseDefense is a_3960 && !(stBaseDefense as a_3960).isCanBeEaten)
         {
            return false;
         }
         return !stBaseDefense.m_isShowFrozen && stBaseDefense.CanBeEat();
      }
      
      private function CanDoEat() : Boolean
      {
         if(m_stCurrentFieldGrid == null)
         {
            return false;
         }
         if(this.IsCanEat2(m_stCurrentFieldGrid.m_stProtector) || this.IsCanEat2(m_stCurrentFieldGrid.m_stAttackFighter) || this.IsCanEat2(m_stCurrentFieldGrid.m_stFlowerDefense) || this.IsCanEat2(m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter) || this.IsCanEat2(m_stCurrentFieldGrid.m_stTrayDefense) || this.IsCanEat2(m_stCurrentFieldGrid.m_stBoomDefense))
         {
            return true;
         }
         return false;
      }
      
      private function Eat(iCurrentTime:int) : void
      {
         if(m_stCurrentFieldGrid == null)
         {
            return;
         }
         if(this.m_iState == 1)
         {
            if(this.CanDoEat())
            {
               this.SetState(2);
            }
         }
         else if(this.m_iState == 3)
         {
            if(a_1473 <= 0 && iCurrentTime >= a_1477 + a_1476 * (1 / a_1470))
            {
               if(this.DoEatDefence(m_stCurrentFieldGrid.m_stProtector,iCurrentTime) || this.DoEatDefence(m_stCurrentFieldGrid.m_stAttackFighter,iCurrentTime) || this.DoEatDefence(m_stCurrentFieldGrid.m_stFlowerDefense,iCurrentTime) || this.DoEatDefence(m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter,iCurrentTime) || this.DoEatDefence(m_stCurrentFieldGrid.m_stTrayDefense,iCurrentTime) || this.DoEatDefence(m_stCurrentFieldGrid.m_stBoomDefense,iCurrentTime))
               {
               }
            }
         }
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == 14)
            {
               this.SetState(1);
            }
            else if(a_1273 == 30 || a_1273 == 73)
            {
               this.SetState(3);
               this.m_bEatDie = false;
            }
            else if(a_1273 == 34 || a_1273 == 77)
            {
               if(this.m_bEatDie)
               {
                  this.SetState(5);
               }
               else if(!this.CanDoEat())
               {
                  this.SetState(4);
               }
            }
            else if(a_1273 == 51 || a_1273 == 94)
            {
               this.CreateMouse(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo - 1);
               this.CreateMouse(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo + 1);
            }
            else if(a_1273 == 41 || a_1273 == 84)
            {
               this.SetState(1);
            }
            else if(a_1273 == 57 || a_1273 == 100)
            {
               this.SetState(1);
            }
         }
      }
      
      private function CreateMouse(iNoX:int, iNoY:int) : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         if(m_stCurrentFieldGrid == null)
         {
            return;
         }
         stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(stTargetFieldGrid == null)
         {
            return;
         }
         stBaseMoveIntruder = a_4255.getInstance().a_4256(8389646);
         if(stBaseMoveIntruder)
         {
            stBaseMoveIntruder.SpecialSkillCallBack(99999);
            stBaseMoveIntruder.a_1797((1 << 16) + iNoY + 50,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389646;
            stBaseMoveIntruder.x = x;
            stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stTargetFieldGrid,true,BattleLayerDefine.INTRUDER_LAND_TYPE);
            stBaseMoveIntruder.iDIYLife = iLifeValue;
         }
      }
      
      override public function SpecialSkillCallBack(... args) : void
      {
         if(args[0] == 99999)
         {
            this.m_bSkillCreate = true;
         }
      }
      
      public function InDamage() : Boolean
      {
         return a_1339 > 0 && a_1339 < MAX_INJURED_LIFE;
      }
      
      public function SetAnimation(animIdx:int, addIdx:int = 0) : void
      {
         if(this.InDamage())
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
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(this.m_iState == 0 || this.m_iState == 1 || this.m_iState == 5)
         {
            return true;
         }
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(this.m_iState == 0 || this.m_iState == 1 || this.m_iState == 5)
         {
            return true;
         }
         super.a_4209(iRduceLifeValue);
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
      
      private function SetCannotSee(visible:Boolean) : void
      {
         if(int(x / a_3491.a_1080) <= 0)
         {
            SetCannotSeeByFighter(false);
         }
         else
         {
            SetCannotSeeByFighter(visible);
         }
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
         else
         {
            if(this.m_iState == 5 || this.m_iState == 0)
            {
               return;
            }
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
   }
}

