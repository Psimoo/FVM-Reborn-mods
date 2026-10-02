package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.SummerLittleMouse
{
   import a_4718.b_181;
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_4012;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class LimeSpaceMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 1200;
      
      private static const MAX_INJURED_LIFE:int = MAX_LIFE * 0.3;
      
      private static const ONE_GRID_SPEED:int = 4;
      
      private static const JUMP_EAT_TIME:int = 44;
      
      private var m_bLimeMoving:Boolean = true;
      
      private var m_bEated:Boolean = false;
      
      private var m_bEating:Boolean = false;
      
      private var m_iEatNum:int = 0;
      
      private var m_bMoveTarget:Boolean = false;
      
      private var m_EatFiledGrid:a_3491 = null;
      
      public function LimeSpaceMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(LimeSpaceMouseMoveIntruder,LimeSpaceMouseMoveIntruderMovie) as LimeSpaceMouseMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1464 = true;
         a_1462 = false;
         a_1339 = MAX_LIFE;
         this.m_bLimeMoving = true;
         this.m_bEated = false;
         this.m_bEating = false;
         this.m_iEatNum = 0;
         this.m_bMoveTarget = false;
         a_1279 = -width * 0.2 + 10;
         a_1272 = 0;
         a_1481 = false;
         return true;
      }
      
      private function addSmallDefense(grid:a_3491) : void
      {
         var addResult:Boolean = false;
         var stInitialFieldGrid:a_3491 = null;
         if(grid == null)
         {
            return;
         }
         var stSmallSlimeDefense:a_3953 = a_4012.getInstance().a_4013(286401088) as a_3953;
         var xNo:int = this.m_iEatNum;
         var yNo:int = grid.m_iYGridNo;
         if(stSmallSlimeDefense)
         {
            stSmallSlimeDefense.iDefenseTypeID = 286401088;
            stSmallSlimeDefense.m_iPlaceTimeIntervals = grid.m_stCurrentBattbleFieldView.iTimeIntervalNum;
            stSmallSlimeDefense.m_iDefenseGlobalID = grid.m_stCurrentBattbleFieldView.a_2180();
            addResult = grid.m_stCurrentBattbleFieldView.a_3441(stSmallSlimeDefense,xNo,yNo);
            if(addResult)
            {
               stInitialFieldGrid = grid.m_stCurrentBattbleFieldView.a_3438(xNo,yNo);
               a_3962.a_1088.a_2059(stSmallSlimeDefense.m_iDefenseGlobalID,stSmallSlimeDefense.a_3512(),stInitialFieldGrid.m_iInitialXGridNo,stInitialFieldGrid.m_iInitialYGridNo,0);
               stSmallSlimeDefense.a_3940();
            }
            else
            {
               stSmallSlimeDefense.a_3940();
            }
         }
      }
      
      override protected function a_3940() : Boolean
      {
         if(this.m_bMoveTarget == true)
         {
            this.addSmallDefense(m_stCurrentFieldGrid);
         }
         super.a_3940();
         return true;
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
            this.SetAnimation(6);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         else if(this.m_bEating == false)
         {
            this.SetAnimation(0,1);
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iHurtRate <= 0)
         {
            return true;
         }
         if(!this.m_bLimeMoving || a_1468 > 0 || a_1470 < 1)
         {
            if(m_stCurrentFieldGrid != null)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            super.a_4210();
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         var mustEffect:Boolean = a_1468 > 0 || a_1470 < 1;
         if(mustEffect)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
         else if(b_182.a_435 != iEffectType && b_182.enm_shotEffectXuanYun != iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(!this.m_bLimeMoving || a_1468 > 0 || a_1470 < 1)
         {
            super.a_4209(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            a_1460 = true;
         }
         if(this.m_bEated == false && this.m_bEating == false && null != m_stCurrentFieldGrid.m_stAttackFighter && m_stCurrentFieldGrid.m_stAttackFighter.tagCom.HasTag(30030))
         {
            this.m_bEating = true;
            this.SetAnimationOnce2Loop(2,0,1);
            this.m_bLimeMoving = false;
            this.m_iEatNum = m_stCurrentFieldGrid.m_iXGridNo;
            this.m_EatFiledGrid = m_stCurrentFieldGrid;
         }
         if(this.m_bEating == true)
         {
            if(a_1273 == 33 || a_1273 == 53)
            {
               this.a_3502(m_stCurrentFieldGrid);
            }
            if(a_1273 == 36 || a_1273 == 56)
            {
               this.m_bLimeMoving = true;
               this.m_bEated = true;
               this.m_bEating = false;
            }
         }
         else
         {
            super.a_4216(iCurrentTime);
         }
         if(this.m_bEated && x <= this.m_iEatNum * a_3491.a_1080)
         {
            this.m_bMoveTarget = true;
            a_1339 = 0;
            this.SetAnimation(4,1);
            if(this.m_EatFiledGrid)
            {
               this.a_3502(this.m_EatFiledGrid);
               this.m_EatFiledGrid.a_3457(this);
               this.m_EatFiledGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
            return true;
         }
         var iXGridNo:int = int(x / a_3491.a_1080);
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
         }
         if(x <= a_3491.a_1080 / 4)
         {
            SetCannotSeeByFighter(false);
         }
         else if(a_1468 > 0 || this.m_bLimeMoving == false || a_1470 < 1)
         {
            SetCannotSeeByFighter(false);
         }
         else
         {
            SetCannotSeeByFighter(true);
         }
         var numOrigXPos:Number = x;
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

