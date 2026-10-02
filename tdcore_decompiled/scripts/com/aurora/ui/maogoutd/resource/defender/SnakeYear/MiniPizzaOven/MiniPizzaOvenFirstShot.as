package com.aurora.ui.maogoutd.resource.defender.SnakeYear.MiniPizzaOven
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class MiniPizzaOvenFirstShot extends a_4348
   {
      
      private var m_iStep:int = 0;
      
      private var m_iRemainTick:int = 0;
      
      private var m_iSpeed:Number = 15;
      
      private var m_targetX:Number = 0;
      
      private var m_targetY:Number = 0;
      
      public function MiniPizzaOvenFirstShot()
      {
         super();
         a_1573 = 1;
         a_1279 = -23;
         m_iYDisplayCenterPos = -5;
         scaleX = scaleY = 0.8;
         a_1588 = true;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(MiniPizzaOvenFirstShot) as MiniPizzaOvenFirstShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return MiniPizzaOvenFirstShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         rotationY = numSpeed < 0 ? -180 : 0;
         a_1587 = 0;
         a_1275 = 0;
         m_isPenetrate = true;
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
               this.m_targetX = a_3491.a_1080 * 0.5;
            }
            else
            {
               this.m_targetX = a_3491.a_1080 * (BattleFieldView.a_1011 - 1 + 0.5);
            }
            this.m_targetY = a_3491.a_1081 * 0.5;
         }
         else if(iStep == 1)
         {
            if(a_1283)
            {
               this.m_targetX = a_3491.a_1080 * 0.5;
            }
            else
            {
               this.m_targetX = a_3491.a_1080 * (BattleFieldView.a_1011 - 1 + 0.5);
            }
            this.m_targetY = a_3491.a_1081 * (BattleFieldView.a_1012 - 1 + 0.5) + 4;
         }
         else
         {
            this.m_targetX = a_1585;
            this.m_targetY = a_1586;
         }
         offsetX = this.m_targetX - this.x;
         offsetY = this.m_targetY - this.y;
         m_iRate = Math.sqrt(offsetX * offsetX + offsetY * offsetY) / this.m_iSpeed;
         m_numXSpeed = offsetX / m_iRate;
         m_numYSpeed = offsetY / m_iRate;
         this.m_iRemainTick = Math.ceil(m_iRate);
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         --this.m_iRemainTick;
         if(this.m_iRemainTick <= 0)
         {
            this.x = this.m_targetX;
            this.y = this.m_targetY;
            if(this.m_iStep == 2)
            {
               a_3940();
               return;
            }
            ++this.m_iStep;
            this.SetMoveByStep(this.m_iStep);
            return;
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
         if(a_1447 == 0)
         {
            a_1447 = iCurrentTime;
         }
         this.a_4351();
         this.x += m_numXSpeed;
         this.y += m_numYSpeed;
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
               SputterHurt(stFieldGrid,stMoveIntruder);
               return true;
            }
         }
         return false;
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

