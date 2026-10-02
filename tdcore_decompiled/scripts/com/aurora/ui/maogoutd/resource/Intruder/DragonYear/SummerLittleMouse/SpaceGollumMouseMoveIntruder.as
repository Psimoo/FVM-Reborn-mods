package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.SummerLittleMouse
{
   import a_4718.b_181;
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class SpaceGollumMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 1800;
      
      private static const MAX_INJURED_LIFE:int = MAX_LIFE * 0.3;
      
      private static const ONE_GRID_SPEED:int = 6;
      
      private var m_iState:int = 0;
      
      private var m_CardIDArr:Array = new Array(286851424,286851408);
      
      private var m_iStartTime:int = 0;
      
      private var m_iCurrentTime:int = 0;
      
      public function SpaceGollumMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(SpaceGollumMouseMoveIntruder) as SpaceGollumMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return SpaceGollumMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         CanCharm = false;
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         this.m_iState = 0;
         this.SwitchState(1);
         a_1789.getInstance().addEventListener("DefenseCardCountChange",this.a_3483);
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         a_1789.getInstance().removeEventListener("DefenseCardCountChange",this.a_3483);
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
      
      public function SetAnimationOnce2Loop2(onceAnimIdx:int, loopAnimIdx:int, onceAddIdx:int, loopAddIdx:int) : void
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
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            this.SetAnimation(20);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         else if(this.m_iState == 2)
         {
            this.SetAnimation(3,5);
         }
         else if(this.m_iState == 3)
         {
            this.SetAnimation(5,5);
         }
         else if(this.m_iState == 4)
         {
            this.SetAnimation(13,3);
         }
         else if(a_1475)
         {
            this.SetAnimation(18,1);
         }
         else if(this.m_iState == 0 || this.m_iState == 1)
         {
            this.SetAnimation(0,1);
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(!this.IsInvicible())
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_4212() : Boolean
      {
         if(!this.IsInvicible())
         {
            super.a_4212();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(!this.IsInvicible() || iRduceLifeValue < 0)
         {
            super.a_3969(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iHurtRate <= 0)
         {
            return true;
         }
         if(this.m_iState == 4)
         {
            super.a_4210();
         }
         else
         {
            if(this.IsInvicible())
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
               this.a_3940();
            }
         }
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      public function IsInvicible() : Boolean
      {
         return this.m_iState == 2;
      }
      
      public function SwitchState(iState:int) : Boolean
      {
         if(this.m_iState != iState)
         {
            switch(iState)
            {
               case 0:
                  break;
               case 1:
                  a_1481 = true;
                  if(this.m_iState == 4)
                  {
                     this.SetAnimationOnce2Loop2(14,0,3,1);
                  }
                  else if(this.m_iState == 3)
                  {
                     this.SetAnimationOnce2Loop2(6,0,5,1);
                  }
                  else
                  {
                     this.SetAnimation(0,1);
                  }
                  SetCannotSeeByFighter(false);
                  a_1464 = false;
                  break;
               case 2:
                  a_1481 = false;
                  a_1464 = true;
                  this.SetAnimationOnce2Loop(2,3,5);
                  SetCannotSeeByFighter(true);
                  break;
               case 3:
                  a_1481 = true;
                  this.SetAnimationOnce2Loop(4,5,5);
                  SetCannotSeeByFighter(false);
                  a_1464 = true;
                  break;
               case 4:
                  a_1481 = true;
                  a_1475 = false;
                  SetCannotSeeByFighter(false);
                  this.SetAnimationOnce2Loop(12,13,3);
                  a_1464 = true;
            }
            this.m_iState = iState;
            return true;
         }
         return false;
      }
      
      private function a_3483(stDataEvent:a_1778) : void
      {
         var iDefenseTypeID:int = int(stDataEvent.dataObject[0]);
         if(this.m_iState == 1 && this.m_CardIDArr.indexOf(iDefenseTypeID) != -1)
         {
            this.SwitchState(4);
            this.m_iStartTime = this.m_iCurrentTime;
         }
      }
      
      public function IsCanLanuch(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return null != stFieldGrid.m_stProtector || null != stFieldGrid.m_stTrayDefense || null != stFieldGrid.m_stBoomDefense || null != stFieldGrid.m_stFlowerDefense || null != stFieldGrid.m_stBaseAuxiliaryFighter || null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var bFind:Boolean = false;
         var stFieldGrid:a_3491 = null;
         var stMoveIntruder:a_4206 = null;
         var stFieldGridVector:Array = null;
         var xEnd:int = 0;
         var xStart:int = 0;
         var indexX:* = 0;
         this.m_iCurrentTime = iCurrentTime;
         if(!a_1460)
         {
            a_1460 = true;
            this.m_iStartTime = iCurrentTime;
         }
         if(a_1273 <= 16)
         {
            a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
            if(a_1283 == false)
            {
               a_1350 *= -1;
            }
         }
         else if(a_1273 >= 23 && a_1273 <= 26 || a_1273 >= 56 && a_1273 <= 59)
         {
            a_1350 = a_3491.a_1080 / (20 * 1);
            if(a_1283 == false)
            {
               a_1350 *= -1;
            }
         }
         else
         {
            a_1350 = 0;
         }
         if(m_stCurrentFieldGrid.m_iXGridNo <= 1 && this.m_iState != 4)
         {
            this.SwitchState(1);
         }
         else if(this.m_iState == 1)
         {
            if(!isEatingDefense)
            {
               stFieldGridVector = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
               xEnd = m_stCurrentFieldGrid.m_iXGridNo - 2 < 0 ? 0 : int(m_stCurrentFieldGrid.m_iXGridNo - 2);
               xStart = m_stCurrentFieldGrid.m_iXGridNo;
               bFind = false;
               for(indexX = int(xStart - 1); indexX >= xEnd; indexX--)
               {
                  stFieldGrid = stFieldGridVector[m_stCurrentFieldGrid.m_iYGridNo][indexX];
                  if(this.IsCanLanuch(stFieldGrid))
                  {
                     bFind = true;
                  }
                  for each(stMoveIntruder in stFieldGrid.a_1511.slice())
                  {
                     if(stMoveIntruder.m_stMoveIntruderTypeID == 8389017)
                     {
                        bFind = true;
                        break;
                     }
                  }
                  if(bFind)
                  {
                     break;
                  }
               }
               if(bFind == true)
               {
                  this.SwitchState(2);
               }
            }
         }
         else if(this.m_iState == 2)
         {
            bFind = false;
            for each(stMoveIntruder in m_stCurrentFieldGrid.a_1511.slice())
            {
               if(stMoveIntruder.m_stMoveIntruderTypeID == 8389017)
               {
                  this.m_iStartTime = iCurrentTime;
                  this.SwitchState(3);
                  bFind = true;
                  stMoveIntruder.SpecialSkillCallBack(true);
                  break;
               }
            }
            if(bFind == false && this.IsCanLanuch(m_stCurrentFieldGrid))
            {
               this.m_iStartTime = iCurrentTime;
               this.a_3502(m_stCurrentFieldGrid);
               this.SwitchState(3);
            }
         }
         else if(this.m_iState == 3)
         {
            if(iCurrentTime - this.m_iStartTime > 6 * 20)
            {
               this.SwitchState(1);
            }
         }
         else if(this.m_iState == 4)
         {
            if(iCurrentTime - this.m_iStartTime > 10 * 20)
            {
               this.SwitchState(1);
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
      
      override public function play() : void
      {
         super.play();
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(100);
            return true;
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(100);
            return true;
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(100);
            return true;
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(100);
            return true;
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(100);
            return true;
         }
         stFieldGrid.DamageNewSlot(true,0,false,100,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(100);
            return true;
         }
         return true;
      }
   }
}

