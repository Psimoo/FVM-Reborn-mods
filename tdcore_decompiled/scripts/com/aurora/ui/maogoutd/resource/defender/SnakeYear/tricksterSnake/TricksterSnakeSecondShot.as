package com.aurora.ui.maogoutd.resource.defender.SnakeYear.tricksterSnake
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class TricksterSnakeSecondShot extends a_4348
   {
      
      private var m_iLastPosY:int = -1;
      
      private var m_iStep:int = 0;
      
      private var m_iRemainTick:int = 0;
      
      private var m_iSpeed:Number = 15;
      
      public function TricksterSnakeSecondShot()
      {
         super();
         a_1573 = 1;
         scaleX = scaleY = 1;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(TricksterSnakeSecondShot) as TricksterSnakeSecondShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return TricksterSnakeSecondShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         rotationY = numSpeed < 0 ? -180 : 0;
         a_1587 = 0;
         a_1275 = 0;
         m_isPenetrate = true;
         a_1588 = true;
         a_1279 = 0;
         m_iYDisplayCenterPos = 0;
         this.m_iLastPosY = m_iYGridNo;
         this.SetMoveByStep(0);
         m_isCanBounceByAuxiliary = false;
         return true;
      }
      
      private function SetMoveByStep(iStep:int) : void
      {
         var offsetY:Number = NaN;
         var m_iRate:Number = NaN;
         this.m_iStep = iStep;
         var offsetX:Number = 0;
         offsetY = 0;
         if(iStep == 0)
         {
            if(a_1283)
            {
               offsetX = a_3491.a_1080 * 0.3 - this.x;
            }
            else
            {
               offsetX = a_3491.a_1080 * (BattleFieldView.a_1011 - 1 + 0.3) - this.x;
            }
            offsetY = a_3491.a_1081 * (BattleFieldView.a_1012 - 1 + 0.5) - this.y;
         }
         else if(iStep == 1)
         {
            if(a_1283)
            {
               offsetX = a_3491.a_1080 * 0.3 - this.x;
            }
            else
            {
               offsetX = a_3491.a_1080 * (BattleFieldView.a_1011 - 1 + 0.3) - this.x;
            }
            offsetY = a_3491.a_1081 * 0.5 - this.y;
         }
         else
         {
            offsetX = a_1585 - this.x;
            offsetY = a_1586 - this.y;
         }
         m_iRate = Math.sqrt(offsetX * offsetX + offsetY * offsetY) / this.m_iSpeed;
         m_numXSpeed = offsetX / m_iRate;
         m_numYSpeed = offsetY / m_iRate;
         this.m_iRemainTick = Math.ceil(m_iRate);
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         --this.m_iRemainTick;
         if(this.m_iRemainTick == 0)
         {
            if(this.m_iStep == 2)
            {
               a_3940();
               return;
            }
            ++this.m_iStep;
            this.SetMoveByStep(this.m_iStep);
         }
         if(m_isHited && !m_isPenetrate)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               m_bActive.Value = false;
               a_3940();
            }
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         this.a_4351();
         x += m_numXSpeed;
         y += m_numYSpeed;
      }
      
      override protected function a_4351() : void
      {
         var arrMoveIntruder:Array = null;
         var iArrMoveIntruderLength:int = 0;
         var stMoveIntruder:a_4206 = null;
         var iLast:int = 0;
         var i:int = 0;
         var iXGridNo:int = Math.max(Math.floor(x / a_3491.a_1080),0);
         var iYGridNo:int = Math.max(Math.floor(y / a_3491.a_1081),0);
         if(iYGridNo != m_iYGridNo)
         {
            iLast = int(a_1583.m_stBaseShotVector[m_iYGridNo].indexOf(this));
            if(iLast != -1)
            {
               a_1583.m_stBaseShotVector[m_iYGridNo].splice(iLast,1);
            }
            a_1583.m_stBaseShotVector[iYGridNo].push(this);
            m_iYGridNo = iYGridNo;
         }
         var stFieldGrid:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(Boolean(stFieldGrid) && stFieldGrid.m_isOccupy)
         {
            arrMoveIntruder = stFieldGrid.a_1511.slice();
            if(stFieldGrid.m_stCurrentBattbleFieldView.iIntruderMoveDirection > 0)
            {
               arrMoveIntruder.sortOn("x",Array.DESCENDING | Array.NUMERIC);
            }
            else
            {
               arrMoveIntruder.sortOn("x",Array.NUMERIC);
            }
            iArrMoveIntruderLength = int(arrMoveIntruder.length);
            for(i = 0; i < iArrMoveIntruderLength; i++)
            {
               stMoveIntruder = arrMoveIntruder[i];
               if(!stMoveIntruder.isCannotSeeByFighter && hitTestObject(stMoveIntruder))
               {
                  if(Boolean(a_1583) && a_1583.isOwnBattleField)
                  {
                     BattleFieldView.a_1045.play();
                  }
                  this.CaclueHitMouse(stFieldGrid,stMoveIntruder);
                  m_isHited = true;
                  if(a_1276.length > 0)
                  {
                     gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
                  }
                  return;
               }
            }
         }
      }
      
      override protected function CaclueHitMouse(stFieldGrid:a_3491, stMoveIntruder:a_4206) : Boolean
      {
         if(stMoveIntruder != null && stMoveIntruder.iLifeValue > 0 && hitTestObject(stMoveIntruder))
         {
            if(m_isPenetrate && m_HitMouseArray.indexOf(stMoveIntruder) == -1)
            {
               if(Boolean(a_1583) && a_1583.isOwnBattleField)
               {
                  BattleFieldView.a_1045.play();
               }
               m_HitMouseArray.push(stMoveIntruder);
               a_4352(stMoveIntruder);
               this.SputterHurt(stFieldGrid,stMoveIntruder);
               return true;
            }
         }
         return false;
      }
      
      override protected function SputterHurt(stHitenFieldGrid:a_3491, stHitenMouseIntruder:a_4206) : void
      {
         var effect:TricksterSnakeDeadEffect = null;
         if(stHitenMouseIntruder.iLifeValue <= 0 && !stHitenMouseIntruder.IsBossIntruder && !stHitenMouseIntruder.HasTag(5) && !stHitenMouseIntruder.HasTag(40012))
         {
            stHitenMouseIntruder.a_3432();
            effect = TricksterSnakeDeadEffect.a_3926();
            effect.a_1797(false);
            stHitenFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_TOP_TYPE,stHitenFieldGrid);
            effect.x = stHitenMouseIntruder.x;
            effect.y = stHitenMouseIntruder.y;
         }
      }
      
      override protected function CalculationBoundary() : Boolean
      {
         if(x < 0 || x >= BattleFieldView.a_1013 || a_1576 && y > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            m_bActive.Value = false;
            a_3940();
            return true;
         }
         return false;
      }
      
      override protected function ReboundHandler() : void
      {
         rotationY = rotationY == -180 ? 0 : -180;
      }
   }
}

