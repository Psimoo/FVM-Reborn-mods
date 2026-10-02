package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.GreedyDemon
{
   import a_4718.b_181;
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class WBGreedyHoleMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 100000;
      
      private static const MAX_INJURED_LIFE:int = 30000;
      
      private static const ONE_GRID_SPEED:Number = 0;
      
      public var m_iOldFieldGridType:int;
      
      private var attackList:Array = new Array();
      
      private var inFront:Boolean = false;
      
      private var iState:int = 0;
      
      public function WBGreedyHoleMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBGreedyHoleMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBGreedyHoleMoveIntruder) as WBGreedyHoleMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBGreedyHoleMoveIntruderMovie;
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
         a_1279 = -30;
         m_iYDisplayCenterPos = 15 - 470;
         a_1272 = 0;
         a_1481 = false;
         a_1464 = true;
         a_1463 = true;
         a_1462 = false;
         a_1465 = 0;
         a_1275 = 1;
         a_1272 = 0;
         this.SetAnimationOnce2Loop(0,1,0,2);
         this.attackList.length = 0;
         this.m_iOldFieldGridType = -1;
         return true;
      }
      
      public function SetMove2Front() : void
      {
         this.inFront = true;
         this.iState = 0;
         a_1283 = true;
         this.UpdateSpeed();
      }
      
      public function SetMove2Back() : void
      {
         this.inFront = false;
         this.iState = 0;
         a_1283 = false;
         this.UpdateSpeed();
      }
      
      private function UpdateSpeed() : void
      {
         a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         if(!a_1283)
         {
            a_1350 *= -1;
         }
      }
      
      override protected function GetiNoX() : int
      {
         var iXGridNo:int = 0;
         iXGridNo = int((x + 15) / a_3491.a_1080);
         if(iXGridNo < 0)
         {
            iXGridNo = 0;
         }
         if(iXGridNo >= BattleFieldView.a_1011)
         {
            iXGridNo = BattleFieldView.a_1011 - 1;
         }
         return iXGridNo;
      }
      
      override protected function a_3940() : Boolean
      {
         if(m_stCurrentFieldGrid != null && this.m_iOldFieldGridType != -1)
         {
            m_stCurrentFieldGrid.m_iFieldGridType = this.m_iOldFieldGridType;
         }
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            this.SetAnimation(1,2);
         }
         else
         {
            this.SetAnimation(3,3);
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
         if(!a_1460)
         {
            a_1460 = true;
         }
         if(a_1273 == 7 && iCurrentTime % 2 == 1)
         {
            if(!this.a_3502(m_stCurrentFieldGrid))
            {
               super.a_3969(iLifeValue);
               return true;
            }
            if(m_stCurrentFieldGrid != null)
            {
               this.m_iOldFieldGridType = m_stCurrentFieldGrid.m_iFieldGridType;
               m_stCurrentFieldGrid.m_iFieldGridType = 8;
            }
         }
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         var hasKill:Boolean = false;
         if(null != stFieldGrid.m_stAttackFighter)
         {
            if(stFieldGrid.m_stAttackFighter is a_3924)
            {
               return false;
            }
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
            hasKill = true;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
            hasKill = true;
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
            hasKill = true;
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
            hasKill = true;
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
            hasKill = true;
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
            hasKill = true;
         }
         if(hasKill == true && null != stFieldGrid.m_stBaseToolDefense)
         {
            stFieldGrid.m_stBaseToolDefense.m_iDieType = 1;
            stFieldGrid.m_stBaseToolDefense.a_3969(stFieldGrid.m_stBaseToolDefense.iLifeValue);
         }
         return hasKill;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      public function InDamage() : Boolean
      {
         return a_1339 > 0 && a_1339 < MAX_INJURED_LIFE;
      }
      
      public function SetAnimation(animIdx:int, animIdx2:int) : void
      {
         if(this.InDamage())
         {
            animIdx = animIdx2;
         }
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int, onceAnimIdx2:int, loopAnimIdx2:int) : void
      {
         if(this.InDamage())
         {
            onceAnimIdx = onceAnimIdx2;
            loopAnimIdx = loopAnimIdx2;
         }
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      override public function a_4213() : Boolean
      {
         a_1339 = 0;
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         this.a_3940();
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         if(m_stCurrentFieldGrid)
         {
            this.a_3969(900);
         }
         else
         {
            a_1339 = 0;
            this.a_3940();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(a_1273 < 13)
         {
            return true;
         }
         return super.a_4210();
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function ReduceAllLife(iRduceLifeValue:int, bIsIgnoreArmor:Boolean = false, ishowHuijing:Boolean = false) : Boolean
      {
         return true;
      }
   }
}

