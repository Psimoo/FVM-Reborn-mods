package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldBoss
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.display.FrameLabel;
   
   public class WBHamburgerSoliderMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 100000;
      
      private static const MAX_INJURED_LIFE:int = 50000;
      
      private static const ONE_GRID_SPEED:int = 0;
      
      private var m_iRamainTick:int = 35;
      
      private var m_iRamainTick2:int = 200;
      
      private var m_bUseBoom:Boolean = false;
      
      public var m_stBoss:WBGluttonyKingBossMoveIntruder;
      
      private var m_iTargetNoX:int = 0;
      
      private var m_iTargetNoY:int = 0;
      
      public function WBHamburgerSoliderMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBHamburgerSoliderMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBHamburgerSoliderMouseMoveIntruder) as WBHamburgerSoliderMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBHamburgerSoliderMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2 + 15;
         m_iYDisplayCenterPos = 30;
         a_1272 = 0;
         a_1481 = false;
         a_1462 = true;
         a_1464 = true;
         BoomIsReduceLife = true;
         a_1463 = true;
         this.SetAnimation2(0);
         this.m_iRamainTick = 35;
         this.m_iRamainTick2 = 200;
         this.m_bUseBoom = false;
         return true;
      }
      
      public function CreateTarget(iNoX:int, iNoY:int) : void
      {
         this.m_iTargetNoX = iNoX;
         this.m_iTargetNoY = iNoY;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            this.SetAnimation(2,1);
         }
         else
         {
            this.SetAnimation(4);
            if(m_stCurrentFieldGrid)
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
         if(iLifeValue <= 0)
         {
            return false;
         }
         super.a_3969(iRduceLifeValue);
         if(this.m_iRamainTick2 > 0 && iLifeValue <= 0)
         {
            this.m_stBoss.a_3969(20000);
            a_3940();
         }
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(iLifeValue <= 0)
         {
            return false;
         }
         super.a_4209(iRduceLifeValue);
         if(this.m_iRamainTick2 > 0 && iLifeValue <= 0)
         {
            this.m_stBoss.a_3969(20000);
            a_3940();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         if(this.m_iRamainTick > 0)
         {
            --this.m_iRamainTick;
            if(this.m_iRamainTick == 15)
            {
               this.SetAnimationOnce2Loop2(1,2);
            }
            else if(this.m_iRamainTick == 8)
            {
               this.a_3502(m_stCurrentFieldGrid);
            }
            else if(this.m_iRamainTick == 0)
            {
               SetCannotSeeByFighter(false);
            }
         }
         else
         {
            --this.m_iRamainTick2;
            if(this.m_iRamainTick2 == 0)
            {
               this.a_3969(iLifeValue);
            }
         }
         SetGameMapModePicnicPosition(numOrigXPos);
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(null != stFieldGrid.m_stBaseToolDefense)
         {
            stFieldGrid.m_stBaseToolDefense.m_iDieType = 1;
            stFieldGrid.m_stBaseToolDefense.a_3969(stFieldGrid.m_stBaseToolDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
      
      override public function a_4140(iCurrentTime:int) : void
      {
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var indexY:int = 0;
         var indexX:int = 0;
         if(a_1273 == 53 && this.m_bUseBoom == false)
         {
            this.m_bUseBoom = true;
            yStart = Math.max(this.m_iTargetNoY - 1,0);
            xStart = Math.max(this.m_iTargetNoX - 1,0);
            yEnd = Math.min(this.m_iTargetNoY + 1,BattleFieldView.a_1012);
            xEnd = Math.min(this.m_iTargetNoX + 1,BattleFieldView.a_1011);
            for(indexY = yStart; indexY <= yEnd; indexY++)
            {
               for(indexX = xStart; indexX <= xEnd; indexX++)
               {
                  this.CreateEtChat(indexX,indexY);
               }
            }
         }
         super.a_4140(iCurrentTime);
      }
      
      private function CreateEtChat(iNoX:int, iNoY:int) : void
      {
         var stFieldGrid:a_3491 = null;
         var stEffect:WBEtchatEffect = null;
         stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(stFieldGrid == null)
         {
            return;
         }
         if(stFieldGrid != null)
         {
            this.a_3502(stFieldGrid);
            stEffect = WBEtchatEffect.a_3926();
            stEffect.m_iRemainTick = 200;
            stEffect.m_TargetFieldGrid = stFieldGrid;
            stEffect.a_1797(false);
            stEffect.x = iNoX * a_3491.a_1080 + 8;
            stEffect.y = iNoY * a_3491.a_1081 + 10;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,stFieldGrid);
            stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(stEffect);
         }
      }
      
      public function InDamage() : Boolean
      {
         return a_1339 > 0 && a_1339 < MAX_INJURED_LIFE;
      }
      
      override public function a_4213() : Boolean
      {
         a_1339 = 0;
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         a_3940();
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         this.a_3969(900);
         return true;
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
      
      public function SetAnimation2(animIdx:int) : void
      {
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int, addIdx:int = 0) : void
      {
         if(this.InDamage())
         {
            onceAnimIdx += addIdx;
            loopAnimIdx += addIdx;
         }
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      public function SetAnimationOnce2Loop2(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
   }
}

