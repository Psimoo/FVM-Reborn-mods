package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldMouse
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.tools.a_4425;
   import flash.display.BitmapData;
   import flash.display.FrameLabel;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class WBFallenAngelMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 6400;
      
      private static const MAX_INJURED_LIFE:int = 3200;
      
      private static const ONE_GRID_SPEED:int = 4;
      
      private var bornState:int = 0;
      
      private var isInvincible:Boolean = false;
      
      private var isInvincible2:Boolean = false;
      
      private var bForceDamage:Boolean = false;
      
      private var reachGrid:Array = new Array();
      
      private var waitTick:int = -1;
      
      private var battleView:BattleFieldView;
      
      private var biubiuIndex:int = -1;
      
      private var hasBiuBiuIndex:Array = new Array();
      
      private var a_843:int = -1;
      
      private var m_iDieTargetX:int;
      
      private var m_iDieTargetY:int;
      
      public function WBFallenAngelMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBFallenAngelMouseMoveIntruder) as WBFallenAngelMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBFallenAngelMouseMoveIntruderMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         if(this.a_843 != -1)
         {
            clearTimeout(this.a_843);
            this.a_843 = -1;
         }
         super.a_3940();
         return true;
      }
      
      public function InDamage() : Boolean
      {
         return a_1339 > 0 && a_1339 < MAX_INJURED_LIFE;
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
      
      public function SetAnimation(animIdx:int, addIdx:int = 0) : void
      {
         if(this.InDamage())
         {
            animIdx += addIdx;
         }
         a_1275 = animIdx;
         gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
         a_3419();
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
         m_iYDisplayCenterPos = -20;
         a_1272 = 0;
         this.bornState = BattleFieldView.m_stRandomSeed.nextInt(2);
         a_1481 = false;
         a_1464 = true;
         BoomIsReduceLife = true;
         a_1465 = 3;
         this.bForceDamage = false;
         this.reachGrid.length = 0;
         this.waitTick = -1;
         this.isInvincible2 = false;
         this.isInvincible = false;
         this.biubiuIndex = -1;
         this.hasBiuBiuIndex.length = 0;
         this.battleView = null;
         if(this.bornState == 0)
         {
            this.isInvincible = false;
            this.SetAnimation2(1);
            this.SetSpeed(4);
         }
         else
         {
            this.isInvincible = true;
            this.SetAnimationOnce2Loop2(0,1);
            this.SetSpeed(0);
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(this.isInvincible2 || this.isInvincible)
         {
            if(b_182.a_432 == iEffectType)
            {
               super.a_4208(iEffectType,iEffectTime,stBaseEffect);
            }
         }
         else
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         var bChange:Boolean = false;
         if(this.battleView == null)
         {
            return false;
         }
         if(this.bForceDamage)
         {
            super.a_3969(iRduceLifeValue);
         }
         else
         {
            if(this.isInvincible)
            {
               return true;
            }
            bChange = false;
            if(iRduceLifeValue > iLifeValue)
            {
               iRduceLifeValue = iLifeValue - 1;
               bChange = true;
            }
            super.a_3969(iRduceLifeValue);
            if(bChange)
            {
               this.dieBiuBiu();
            }
         }
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(this.battleView == null)
         {
            return false;
         }
         if(this.isInvincible)
         {
            return true;
         }
         var bChange:Boolean = false;
         if(iRduceLifeValue > iLifeValue)
         {
            iRduceLifeValue = iLifeValue - 1;
            bChange = true;
         }
         super.a_4209(iRduceLifeValue);
         if(bChange)
         {
            this.dieBiuBiu();
         }
         return true;
      }
      
      override public function a_4214() : Boolean
      {
         var stBackBd:BitmapData = null;
         var stIntruderRemoteThrowEffect:a_4425 = null;
         if(this.isInvincible2 == true)
         {
            a_1339 = 0;
            stBackBd = this.stDisplayBitmap.bitmapData.clone();
            if(stBackBd != null)
            {
               stIntruderRemoteThrowEffect = a_4425.a_3926();
               stIntruderRemoteThrowEffect.a_1797(stBackBd,a_1283);
               stIntruderRemoteThrowEffect.x = x;
               stIntruderRemoteThrowEffect.y = y;
               parent.addChild(stIntruderRemoteThrowEffect);
            }
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.a_3940();
         }
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            this.SetAnimation(7);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         if(this.isInvincible)
         {
            return true;
         }
         super.a_4212();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(this.isInvincible)
         {
            return true;
         }
         if(this.isInvincible2 == true)
         {
            this.bForceDamage = true;
         }
         if(BoomIsReduceLife)
         {
            this.a_3969(BOOM_INJURE_LIFE);
         }
         else
         {
            a_1339 = 0;
         }
         this.bForceDamage = false;
         ShowBoomDieEffect();
         if(a_1339 <= 0)
         {
            this.a_3940();
         }
         return true;
      }
      
      public function normalBiuBiu() : void
      {
         if(this.isInvincible2)
         {
            return;
         }
         this.SetAnimationOnce2Loop(2,1,3);
         this.SetSpeed(0);
      }
      
      public function dieBiuBiu() : void
      {
         var targetGrid:a_3491 = null;
         if(this.isInvincible2)
         {
            return;
         }
         if(m_stCurrentFieldGrid == null)
         {
            return;
         }
         this.isInvincible2 = true;
         this.SetSpeed(0);
         this.biubiuIndex = 10;
         this.SetAnimation(3,3);
         var index1:int = 0;
         var i:int = 0;
         for(i = 0; i < BattleFieldView.a_1011; i++)
         {
            targetGrid = this.battleView.a_3438(i,m_stCurrentFieldGrid.m_iYGridNo);
            if(this.a_3492(targetGrid))
            {
               index1 = i;
               break;
            }
         }
         this.m_iDieTargetX = index1;
         this.m_iDieTargetY = m_stCurrentFieldGrid.m_iYGridNo;
      }
      
      public function CreateBarrier1(iNoX:int, iNoY:int) : void
      {
         var grid:a_3491 = null;
         var plunger:WBPlunger1MousleHole = null;
         grid = this.battleView.a_3438(iNoX,iNoY);
         if(grid == null)
         {
            return;
         }
         this.a_3502(grid);
         plunger = WBPlunger1MousleHole.a_3926();
         if(plunger)
         {
            plunger.a_1797((globalMoveFighterID << 16) + grid.m_iYGridNo,-1);
            plunger.m_stMoveIntruderTypeID = 134234353;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(plunger,grid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
            plunger.x = grid.m_iXGridNo * a_3491.a_1080;
            plunger.y = grid.m_iYGridNo * a_3491.a_1081;
         }
      }
      
      public function CreateBarrier2() : void
      {
         var grid:a_3491 = null;
         var plunger:WBPlunger2MousleHole = null;
         this.a_843 = -1;
         grid = this.battleView.a_3438(this.m_iDieTargetX,this.m_iDieTargetY);
         if(grid == null)
         {
            return;
         }
         this.a_3502(grid);
         plunger = WBPlunger2MousleHole.a_3926();
         if(plunger)
         {
            plunger.a_1797((globalMoveFighterID << 16) + grid.m_iYGridNo,-1);
            plunger.m_stMoveIntruderTypeID = 134234354;
            this.battleView.a_3459(plunger,grid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
            plunger.x = grid.m_iXGridNo * a_3491.a_1080;
            plunger.y = grid.m_iYGridNo * a_3491.a_1081;
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
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
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
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
      
      public function a_3492(grid:a_3491) : Boolean
      {
         if(grid == null)
         {
            return false;
         }
         return !(null == grid.m_stProtector && null == grid.m_stAttackFighter && null == grid.m_stTrayDefense && null == grid.m_stBoomDefense && null == grid.m_stFlowerDefense && null == grid.m_stHoneyTrapBaseDefense && null == grid.m_stOceanGoddessToolDefense && null == grid.m_stBaseAuxiliaryFighter);
      }
      
      public function IsCanPlace(grid:a_3491) : Boolean
      {
         if(grid == null)
         {
            return false;
         }
         return grid.m_iFieldGridType == 0;
      }
      
      public function SetSpeed(oneGridSpped:Number) : void
      {
         a_1350 = a_3491.a_1080 / (20 * oneGridSpped);
         if(!a_1283)
         {
            a_1350 *= -1;
         }
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var grid:a_3491 = null;
         var targetNoY:int = 0;
         var arrBaseMoveIntruderVector:Array = null;
         var iNewXGridNo:int = 0;
         var numOrigXPos:Number = x;
         if(!a_1460)
         {
            a_1460 = true;
            if(this.bornState == 1)
            {
               this.reachGrid.push(6);
               targetNoY = BattleFieldView.m_stRandomSeed.nextInt(5) + 2;
               if(m_stCurrentFieldGrid != null)
               {
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
                  arrBaseMoveIntruderVector = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
                  if(-1 != arrBaseMoveIntruderVector.indexOf(this))
                  {
                     arrBaseMoveIntruderVector.splice(arrBaseMoveIntruderVector.indexOf(this),1);
                  }
                  grid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(6,targetNoY);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this,grid,false,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE);
               }
               this.x = a_3491.a_1080 * 6;
            }
            else
            {
               grid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(8,6);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,grid);
            }
            this.battleView = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView;
         }
         if(this.waitTick > 0)
         {
            --this.waitTick;
            if(this.waitTick == 0)
            {
               this.SetSpeed(4);
            }
         }
         if(a_1273 == 15)
         {
            this.isInvincible = false;
            this.waitTick = 20;
         }
         else if(a_1273 == 67 || a_1273 == 118)
         {
            this.isInvincible2 = false;
            this.isInvincible = false;
            this.bForceDamage = true;
            this.a_3969(9999);
         }
         else if(a_1273 == 35 || a_1273 == 87)
         {
            this.SetSpeed(4);
         }
         else if(a_1273 == 63 || a_1273 == 114 || a_1273 == 84 || a_1273 == 32)
         {
            if(this.hasBiuBiuIndex.indexOf(this.biubiuIndex) == -1)
            {
               this.hasBiuBiuIndex.push(this.biubiuIndex);
               if(this.biubiuIndex == 3 || this.biubiuIndex == 5 || this.biubiuIndex == 7)
               {
                  setTimeout(this.CreateBarrier1,300,this.biubiuIndex - 3,m_stCurrentFieldGrid.m_iYGridNo);
               }
               else
               {
                  this.a_843 = setTimeout(this.CreateBarrier2,300);
               }
            }
         }
         super.a_4216(iCurrentTime);
         SetGameMapModePicnicPosition(numOrigXPos);
         if(m_stCurrentFieldGrid != null && this.isInvincible2 == false)
         {
            iNewXGridNo = m_stCurrentFieldGrid.m_iXGridNo;
            if((iNewXGridNo == 2 || iNewXGridNo == 4 || iNewXGridNo == 6) && this.reachGrid.indexOf(iNewXGridNo) == -1)
            {
               this.biubiuIndex = iNewXGridNo + 1;
               this.reachGrid.push(iNewXGridNo);
               this.normalBiuBiu();
            }
         }
         if(this.isInvincible2 == true)
         {
            this.SetSpeed(0);
         }
         return true;
      }
   }
}

