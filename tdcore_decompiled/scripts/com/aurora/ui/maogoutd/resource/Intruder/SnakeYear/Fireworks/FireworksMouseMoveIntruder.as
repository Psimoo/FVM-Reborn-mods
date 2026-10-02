package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Fireworks
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   import flash.utils.setTimeout;
   
   public class FireworksMouseMoveIntruder extends a_4206
   {
      
      private static const FLY_LIFE:int = 24000;
      
      private static const HURT_HP:int = 6000;
      
      private static const GLIDING_TICK:int = 40 * 2 - 4;
      
      private static const GLIDING_GRID:int = 3;
      
      private var m_iFireworksTime:int;
      
      private var m_SkillState:int;
      
      public function FireworksMouseMoveIntruder()
      {
         super();
         a_1272 = 0;
         a_1279 = -55;
         a_1467 = -24;
         m_IsAirElite = false;
         a_1476 = 10;
      }
      
      public static function a_3926() : FireworksMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(FireworksMouseMoveIntruder) as FireworksMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return FireworksMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1339 = FLY_LIFE;
         a_1465 = 3;
         this.m_SkillState = 1;
         this.setSpeed();
         a_1463 = false;
         return true;
      }
      
      private function setSpeed() : void
      {
         var iXGridNo:int = 0;
         var fFireworksDistance:Number = NaN;
         if(this.m_SkillState == 1)
         {
            a_1350 = a_3491.a_1080 / (4 * 20);
         }
         else if(this.m_SkillState == 2)
         {
            iXGridNo = this.getXGridNo(x);
            iXGridNo += a_1283 ? GLIDING_GRID : -GLIDING_GRID;
            fFireworksDistance = Math.abs(x - (0.5 + iXGridNo) * a_3491.a_1080 + 10);
            a_1350 = fFireworksDistance / GLIDING_TICK;
         }
         else if(this.m_SkillState == 3 || this.m_SkillState == 4)
         {
            a_1350 = 0;
         }
         else
         {
            a_1350 = a_3491.a_1080 / (6 * 20);
         }
         if(!a_1283)
         {
            a_1350 *= -1;
         }
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(this.m_SkillState < 5 && a_1339 > 0)
         {
            return false;
         }
         if(a_1339 > HURT_HP)
         {
            if(a_1475)
            {
               if(a_1275 != 6)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[6] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 5)
            {
               a_1275 = 5;
               gotoAndStop((a_1276[5] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(a_1275 != 8)
               {
                  a_1275 = 8;
                  gotoAndStop((a_1276[8] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 7)
            {
               a_1275 = 7;
               gotoAndStop((a_1276[7] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= 0)
         {
            if(a_1275 != 9)
            {
               a_1275 = 9;
               gotoAndStop((a_1276[9] as FrameLabel).frame);
            }
            a_3419();
            if(null != m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      private function IsIngore(iRduceLifeValue:int) : Boolean
      {
         if(this.m_SkillState == 1 && iRduceLifeValue > 0)
         {
            this.StartFireworks();
            return true;
         }
         return false;
      }
      
      override public function a_4210() : Boolean
      {
         if(this.IsIngore(900))
         {
            return true;
         }
         return super.a_4210();
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(this.IsIngore(iRduceLifeValue))
         {
            return true;
         }
         return super.a_4209(iRduceLifeValue);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(this.IsIngore(iRduceLifeValue))
         {
            return true;
         }
         return super.a_3969(iRduceLifeValue);
      }
      
      override public function ReduceAllLife(iRduceLifeValue:int, bIsIgnoreArmor:Boolean = false, ishowHuijing:Boolean = false) : Boolean
      {
         if(this.IsIngore(iRduceLifeValue))
         {
            return true;
         }
         return super.ReduceAllLife(iRduceLifeValue,bIsIgnoreArmor,ishowHuijing);
      }
      
      private function getXGridNo(fXPos:Number) : int
      {
         var iXGridNo:int = int(fXPos / a_3491.a_1080);
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
         }
         return iXGridNo;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var fNumOrigXPos:Number = NaN;
         var fMoveDistance:Number = NaN;
         var stNextFielGrid:a_3491 = null;
         fNumOrigXPos = x;
         if(this.m_SkillState == 5)
         {
            super.a_4216(iCurrentTime);
            return false;
         }
         if(!a_1460)
         {
            a_1460 = true;
         }
         if(this.m_SkillState == 1 && (a_1468 > 0 || a_1469 > 0))
         {
            return true;
         }
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         play();
         if(this.m_SkillState == 1)
         {
            fMoveDistance = a_1350 * a_1470;
         }
         else
         {
            fMoveDistance = a_1350;
         }
         x += fMoveDistance;
         var iXGridNo:int = this.getXGridNo(x);
         if(iXGridNo >= 0 && iXGridNo < BattleFieldView.a_1011 && m_stCurrentFieldGrid.m_iXGridNo != iXGridNo)
         {
            stNextFielGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
            ChangeFieldGrid(stNextFielGrid);
         }
         if(this.m_SkillState == 1 && iXGridNo <= GLIDING_GRID + 1)
         {
            if(a_1283)
            {
               if(x >= (GLIDING_GRID + 1.5) * a_3491.a_1080)
               {
                  this.StartFireworks();
               }
            }
            else if(x <= (GLIDING_GRID + 1.5) * a_3491.a_1080)
            {
               this.StartFireworks();
            }
         }
         else if(this.m_SkillState == 2 && this.m_iFireworksTime > 0)
         {
            --this.m_iFireworksTime;
            if(0 == this.m_iFireworksTime)
            {
               if(m_stCurrentFieldGrid.m_hasFireEffect)
               {
                  this.m_SkillState = 3;
                  this.StartBoom();
               }
               else if(a_1275 != 4)
               {
                  this.m_SkillState = 4;
                  this.setSpeed();
                  a_1275 = 4;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
               this.a_3502(m_stCurrentFieldGrid);
               a_1465 = 0;
            }
         }
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == 57)
            {
               this.BoomSkill(m_stCurrentFieldGrid);
            }
            else if(a_1273 == 63)
            {
               a_3940();
            }
            else if(a_1273 == 80)
            {
               this.AddSmallFireEffect(m_stCurrentFieldGrid,1);
            }
            else if(a_1273 == 81)
            {
               this.AddSmallFireEffect(m_stCurrentFieldGrid,2);
            }
            else if(a_1273 == 83 && this.m_SkillState != 5)
            {
               this.addSpeed();
               this.m_SkillState = 5;
               a_1463 = false;
               this.setSpeed();
               this.ResetMovieStatus();
            }
         }
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(fNumOrigXPos - x);
         }
         return true;
      }
      
      private function StartFireworks() : void
      {
         this.m_SkillState = 2;
         this.m_iFireworksTime = GLIDING_TICK;
         this.setSpeed();
         if(a_1275 != 2)
         {
            a_1275 = 2;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
         }
      }
      
      private function StartBoom() : void
      {
         this.setSpeed();
         SetCannotSeeByFighter(true);
         if(a_1275 != 3)
         {
            a_1275 = 3;
            gotoAndStop((a_1276[3] as FrameLabel).frame);
         }
      }
      
      private function addSpeed() : void
      {
         var yIndex:int;
         var xIndex:int = 0;
         var grid:a_3491 = null;
         var xStart:int = 0;
         var xEnd:int = BattleFieldView.a_1011 - 1;
         var yStart:int = 0;
         var yEnd:int = BattleFieldView.a_1012 - 1;
         for(yIndex = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               grid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(grid)
               {
                  grid.m_SpeedBool = true;
                  setTimeout(function(targetGrid:a_3491):void
                  {
                     if(targetGrid)
                     {
                        targetGrid.m_SpeedBool = false;
                     }
                  },5000,grid);
               }
            }
         }
      }
      
      private function AddSmallFireEffect(stCenterGrid:a_3491, index:int) : void
      {
         var battleFieldView:BattleFieldView = null;
         var SmallFireEffect:FireworksEffect = null;
         var numShotYpos:Number = NaN;
         if(stCenterGrid == null)
         {
            return;
         }
         battleFieldView = stCenterGrid.m_stCurrentBattbleFieldView;
         SmallFireEffect = FireworksEffect.a_3926() as FireworksEffect;
         if(SmallFireEffect == null)
         {
            return;
         }
         SmallFireEffect.a_1797(index == 1 ? a_1283 : !a_1283);
         var numShotXpos:Number = index == 1 ? -15 : 62;
         numShotYpos = index == 1 ? 65 : 19;
         if(a_1283)
         {
            numShotXpos = -numShotXpos;
         }
         SmallFireEffect.x = x + numShotXpos;
         SmallFireEffect.y = y + numShotYpos;
         battleFieldView.AddToBattleView(SmallFireEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,stCenterGrid);
         SmallFireEffect.play();
      }
      
      override protected function get AccelerationEffectValue() : Number
      {
         return 1;
      }
      
      private function BoomSkill(stCenterGrid:a_3491) : void
      {
         var x:int = 0;
         var stTargetGrid:a_3491 = null;
         if(stCenterGrid == null)
         {
            return;
         }
         var xStart:int = Math.max(stCenterGrid.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(stCenterGrid.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(stCenterGrid.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(stCenterGrid.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         var battleFieldView:BattleFieldView = stCenterGrid.m_stCurrentBattbleFieldView;
         for(var y:int = yStart; y <= yEnd; y++)
         {
            for(x = xStart; x <= xEnd; x++)
            {
               stTargetGrid = battleFieldView.a_3438(x,y);
               if(stTargetGrid != null)
               {
                  this.a_3502(stTargetGrid);
               }
            }
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491, isCleanTray:Boolean = true) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption(true);
      }
   }
}

