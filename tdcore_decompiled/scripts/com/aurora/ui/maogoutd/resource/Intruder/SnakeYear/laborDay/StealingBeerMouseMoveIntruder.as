package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.laborDay
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class StealingBeerMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 2700;
      
      private static const MAX_INJURED_LIFE:int = 1200;
      
      private var m_isJumpState:int = 0;
      
      private var _state:int = -1;
      
      private var _laborDayWineryBaseGameMap:Object;
      
      private var _forceRemoveArmor:Boolean = false;
      
      public function StealingBeerMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(StealingBeerMouseMoveIntruder) as StealingBeerMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return StealingBeerMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1339 = MAX_LIFE;
         a_1466 = 900000;
         a_1473 = 0;
         a_1279 = -width * 0.5 + 5;
         a_1272 = 0;
         this.m_isJumpState = 0;
         a_1481 = true;
         this._state = -1;
         this.UpdateStateByArmor();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if((this.m_isJumpState == 0 || this.m_isJumpState == 1) && a_1466 == 0 && a_1339 > 0)
         {
            this.SetAnimationOnce2Loop(5,6,0,1);
            this.m_isJumpState = 3;
            this.forceRemoveArmor();
            SetCannotSeeByFighter(false);
         }
         else if(a_1339 > 0 && !this.IsInUseJump())
         {
            if(a_1466 > 0)
            {
               this.SetAnimation(0);
            }
            else if(a_1475)
            {
               this.SetAnimation(8,1);
            }
            else
            {
               this.SetAnimation(6,1);
            }
         }
         else if(a_1339 <= 0)
         {
            if(a_1466 > 0)
            {
               this.SetAnimation(11);
            }
            else
            {
               this.SetAnimation(10);
            }
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      private function UpdateStateByArmor() : void
      {
         var iMapID:int = 0;
         if(Boolean(m_stCurrentFieldGrid != null && this._laborDayWineryBaseGameMap == null) && Boolean(root) && root.hasOwnProperty("m_stGameData"))
         {
            iMapID = int((root as Object).m_stGameData["iMapID"]);
            if(iMapID == 109 || iMapID == 110 || iMapID == 614 || iMapID == 615 || iMapID == 616)
            {
               this._laborDayWineryBaseGameMap = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap();
            }
         }
         var state:int = -1;
         if(this.m_isJumpState == 1)
         {
            state = 0;
            a_1350 = 0;
         }
         else if(a_1473 > 0)
         {
            if(this.m_isJumpState == 2)
            {
               a_1350 = a_3491.a_1080 / (20 * 0.2);
               if(a_1473 > 7)
               {
                  y -= 4;
               }
               else
               {
                  y += 4;
               }
            }
            else if(this.m_isJumpState == 12)
            {
               a_1350 = a_3491.a_1080 / (20 * 0.13);
               if(a_1473 > 7)
               {
                  y -= 4;
               }
               else
               {
                  y += 4;
               }
            }
            else
            {
               a_1350 = 0;
            }
            state = 1;
         }
         else if(a_1466 > 0)
         {
            a_1350 = a_3491.a_1080 / (20 * 2);
            state = 2;
         }
         else
         {
            a_1350 = a_3491.a_1080 / (20 * 4);
            state = 3;
         }
         if(this._state != state)
         {
            this._state = state;
            switch(this._state)
            {
               case 0:
                  break;
               case 1:
                  a_1464 = true;
                  break;
               case 2:
                  a_1464 = true;
                  break;
               case 3:
                  a_1464 = false;
            }
         }
         if(!a_1283)
         {
            a_1350 *= -1;
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      private function CreateEffect() : void
      {
         var effect:StealingBeerEffect = null;
         effect = StealingBeerEffect.a_3926();
         effect.a_1797(false);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_TOP_TYPE,m_stCurrentFieldGrid);
         effect.x = x - 68;
         effect.y = y + 32;
      }
      
      private function CheckDefense(grid:a_3491) : int
      {
         if(grid == null)
         {
            return 0;
         }
         if(this._laborDayWineryBaseGameMap != null)
         {
            return this._laborDayWineryBaseGameMap.a_3492(grid.m_iXGridNo,grid.m_iYGridNo);
         }
         if(grid.a_3492())
         {
            return 1;
         }
         return 0;
      }
      
      private function forceRemoveArmor() : void
      {
         this._forceRemoveArmor = true;
         if(a_1466 > 0)
         {
            this.a_3969(a_1466);
         }
         this._forceRemoveArmor = false;
      }
      
      protected function DamageFieldGridDefense(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(10);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(10);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(10);
         }
         stFieldGrid.DamageNewSlot(true,0,false,10,1);
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(10);
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(10);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var ss:int = 0;
         this.UpdateStateByArmor();
         if(this.m_isJumpState == 0 && this.CheckDefense(m_stCurrentFieldGrid) > 0 && x / a_3491.a_1080 % 1 > 0.5)
         {
            this.m_isJumpState = 1;
            this.SetAnimation(1);
            this.DamageFieldGridDefense(m_stCurrentFieldGrid);
            SetCannotSeeByFighter(false);
            a_1473 = 4;
         }
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == 28)
            {
               ss = this.CheckDefense(m_stCurrentFieldGrid);
               if(ss == 1)
               {
                  this.m_isJumpState = 2;
                  this.a_3502(m_stCurrentFieldGrid);
                  this.CreateEffect();
                  this.forceRemoveArmor();
                  SetCannotSeeByFighter(true);
                  this.SetAnimationOnce2Loop(2,3);
                  a_1473 = 14;
                  a_1481 = false;
               }
               else if(ss == 2)
               {
                  this.m_isJumpState = 12;
                  this.a_3502(m_stCurrentFieldGrid);
                  this.CreateEffect();
                  this._laborDayWineryBaseGameMap.OnScoopPlace(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
                  this.forceRemoveArmor();
                  SetCannotSeeByFighter(true);
                  this.SetAnimationOnce2Loop(2,3);
                  a_1473 = 14;
                  a_1481 = false;
               }
               else
               {
                  a_1481 = true;
                  this.m_isJumpState = 3;
                  this.forceRemoveArmor();
                  SetCannotSeeByFighter(false);
                  this.SetAnimationOnce2Loop(4,6,0,1);
                  a_1473 = 8;
               }
            }
         }
         if(a_1473 > 0)
         {
            --a_1473;
            if(a_1473 == 0)
            {
               if(this.m_isJumpState == 1)
               {
                  a_1481 = false;
               }
               else if(this.m_isJumpState == 2 || this.m_isJumpState == 12)
               {
                  if(x <= 0)
                  {
                     a_1088.a_2062(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.iTimeIntervalNum,m_stCurrentFieldGrid.m_iYGridNo);
                  }
                  a_1473 = 8;
                  this.m_isJumpState = 3;
                  a_1481 = true;
                  SetCannotSeeByFighter(false);
               }
               else
               {
                  SetCannotSeeByFighter(false);
                  this.ResetMovieStatus();
                  a_1481 = true;
               }
            }
         }
         if(this.m_isJumpState == 2 || this.m_isJumpState == 12)
         {
            x += a_1350;
         }
         else
         {
            super.a_4216(iCurrentTime);
         }
         return true;
      }
      
      private function IsInUseJump() : Boolean
      {
         if(this.m_isJumpState == 1 || this.m_isJumpState == 2 || this.m_isJumpState == 12)
         {
            return true;
         }
         return false;
      }
      
      private function IsInJumping() : Boolean
      {
         if(this.m_isJumpState == 2 || this.m_isJumpState == 12)
         {
            return true;
         }
         return false;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(this.IsInUseJump())
         {
            return;
         }
         super.a_4208(iEffectType,iEffectTime,stBaseEffect);
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
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int, onceAddIdx:int = 0, loopAddIdx:int = 0) : void
      {
         if(a_1339 > 0 && a_1339 < MAX_INJURED_LIFE)
         {
            onceAnimIdx += onceAddIdx;
            loopAnimIdx += loopAddIdx;
         }
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(this._forceRemoveArmor)
         {
            super.a_3969(iRduceLifeValue);
         }
         else if(!this.IsInJumping())
         {
            super.a_3969(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(!this.IsInJumping())
         {
            super.a_4209(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(this.IsInJumping() || a_1466 > 0)
         {
            return true;
         }
         super.a_4210();
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         if(!this.IsInJumping())
         {
            super.a_4212();
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         if(!this.IsInJumping())
         {
            a_1339 = 0;
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.a_3940();
         }
         return true;
      }
      
      override protected function SetClarmLanderTime() : Boolean
      {
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this._laborDayWineryBaseGameMap = null;
         return true;
      }
   }
}

