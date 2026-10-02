package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class WBPopcornMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 10000;
      
      private static const MAX_INJURED_LIFE:int = 4000;
      
      private static const ONE_GRID_SPEED:int = 5;
      
      private var m_iRealMaxHp:int = 0;
      
      private var m_bUseBoomState:int = 0;
      
      private var _grid:a_3491;
      
      private var a_1450:WBPopcornLittleMouseMoveIntruder;
      
      public function WBPopcornMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBPopcornMouseMoveIntruder) as WBPopcornMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBPopcornMouseMoveIntruderMovie;
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
         a_1279 = -width * 0.2;
         a_1272 = 0;
         a_1481 = false;
         a_1464 = true;
         BoomIsReduceLife = true;
         this.m_bUseBoomState = 0;
         AddTag(5);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         this.a_3969(BOOM_INJURE_LIFE);
         return true;
      }
      
      override public function ShowBatDieEffect() : void
      {
      }
      
      override public function PowerfulBombReduceLifeRate(fRate:Number = 0.3, bIsIgnoreArmor:Boolean = false) : Boolean
      {
         if(a_1339 <= 0)
         {
            return false;
         }
         if(bIsIgnoreArmor)
         {
            this.a_4209(BOOM_INJURE_LIFE * fRate);
         }
         else
         {
            this.a_3969(BOOM_INJURE_LIFE * fRate);
         }
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(iLifeValue > 0 && iLifeValue < MAX_INJURED_LIFE)
         {
            a_1350 = a_3491.a_1080 / (20 * 3);
            if(!a_1283)
            {
               a_1350 *= -1;
            }
         }
         if(a_1339 > 0)
         {
            this.SetAnimation(0,2);
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
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = x;
         if(!a_1460)
         {
            a_1460 = true;
            this.m_iRealMaxHp = iLifeValue;
         }
         super.a_4216(iCurrentTime);
         SetGameMapModePicnicPosition(numOrigXPos);
         if(this.m_bUseBoomState == 0)
         {
            if(x < 250)
            {
               this.ToDead();
            }
         }
         return true;
      }
      
      override public function a_4140(iCurrentTime:int) : void
      {
         if(a_1273 < 40)
         {
            if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.a_3492())
            {
               this.a_3502(m_stCurrentFieldGrid);
            }
         }
         else if(a_1273 == 45 && this.m_bUseBoomState == 1)
         {
            this.m_bUseBoomState = 2;
            this.a_4197();
         }
         else if(a_1273 == 46 && this.m_bUseBoomState == 2)
         {
            this.m_bUseBoomState = 3;
            this.a_4360(m_stCurrentFieldGrid);
         }
         super.a_4140(iCurrentTime);
      }
      
      private function a_4360(stHitenFieldGrid:a_3491) : void
      {
         var stFieldGrid:a_3491 = null;
         var j:int = 0;
         if(stHitenFieldGrid == null)
         {
            return;
         }
         var iXGridNo:int = int((x + 61) / a_3491.a_1080);
         for(var i:int = iXGridNo - 1; i <= iXGridNo + 1; i++)
         {
            for(j = stHitenFieldGrid.m_iYGridNo - 1; j <= stHitenFieldGrid.m_iYGridNo + 1; j++)
            {
               this.DamageFieldGridDefense(stHitenFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,j));
            }
         }
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
            stFieldGrid.m_stProtector.a_3969(30);
         }
         if(null != stFieldGrid.m_stAttackFighter)
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(30);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(30);
         }
         stFieldGrid.DamageNewSlot(true,0,false,30,1);
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(30);
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(30);
         }
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return true;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption(false,false);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         this.CheckDead();
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         super.a_4209(iRduceLifeValue);
         this.CheckDead();
         return true;
      }
      
      private function CheckDead() : void
      {
         if(iLifeValue <= 0)
         {
            this.m_bUseBoomState = 1;
            this._grid = m_stCurrentFieldGrid;
         }
      }
      
      private function ToDead() : void
      {
         this.a_3969(iLifeValue);
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
      
      override public function a_4213() : Boolean
      {
         this.a_3969(900);
         if(a_1339 <= 0)
         {
            a_4212();
         }
         return true;
      }
      
      private function a_4197() : void
      {
         if(this._grid == null)
         {
            return;
         }
         this.a_1450 = WBPopcornLittleMouseMoveIntruder.a_3926() as WBPopcornLittleMouseMoveIntruder;
         WBPopcornLittleMouseMoveIntruder.MAX_LIFE = this.m_iRealMaxHp * 0.1;
         this.a_1450.a_1797((globalMoveFighterID << 16) + this._grid.m_iYGridNo,-1);
         this.a_1450.m_stMoveIntruderTypeID = 134234305;
         this._grid.m_stCurrentBattbleFieldView.a_3459(this.a_1450,this._grid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
         this.a_1450.x = x - 50;
         this.a_1450.y = y - 50;
      }
   }
}

