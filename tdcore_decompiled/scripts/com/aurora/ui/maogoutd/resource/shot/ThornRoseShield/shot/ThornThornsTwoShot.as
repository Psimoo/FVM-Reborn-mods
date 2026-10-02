package com.aurora.ui.maogoutd.resource.shot.ThornRoseShield.shot
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class ThornThornsTwoShot extends a_4348
   {
      
      private static var ms_stThornThornsTwoShotVector:Array = new Array();
      
      public function ThornThornsTwoShot()
      {
         super();
         a_1279 = -13.5;
         m_iYDisplayCenterPos = -20;
         a_1573 = 1;
         a_1588 = true;
         m_isShotHighSkySpace = true;
         scaleX = scaleY = 0.8;
      }
      
      public static function a_4344() : a_4348
      {
         var stThornThornsTwoShot:ThornThornsTwoShot = ms_stThornThornsTwoShotVector.pop();
         if(null == stThornThornsTwoShot)
         {
            stThornThornsTwoShot = new ThornThornsTwoShot();
         }
         return stThornThornsTwoShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return ThornThornsTwoShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         var angleRadians:Number = NaN;
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         a_1577 = false;
         m_isPenetrate = true;
         m_isChangeYGridNo = true;
         var anim:int = m_iSuperShotType + 2;
         if(anim > 5)
         {
            anim = 5;
         }
         gotoAndStop(anim);
         switch(m_iSuperShotType)
         {
            case 0:
               angleRadians = -48.5 * (Math.PI / 180);
               m_numYSpeed = m_numXSpeed * Math.sin(angleRadians);
               m_numXSpeed *= Math.cos(angleRadians);
               break;
            case 1:
               angleRadians = -7 * (Math.PI / 180);
               m_numYSpeed = m_numXSpeed * Math.sin(angleRadians);
               m_numXSpeed *= Math.cos(angleRadians);
               break;
            case 2:
               angleRadians = 38 * (Math.PI / 180);
               m_numYSpeed = m_numXSpeed * Math.sin(angleRadians);
               m_numXSpeed *= Math.cos(angleRadians);
               break;
            case 3:
               angleRadians = 157.8 * (Math.PI / 180);
               m_numYSpeed = m_numXSpeed * Math.sin(angleRadians);
               m_numXSpeed *= Math.cos(angleRadians);
               break;
            case 4:
               angleRadians = -151.1 * (Math.PI / 180);
               m_numYSpeed = m_numXSpeed * Math.sin(angleRadians);
               m_numXSpeed *= Math.cos(angleRadians);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited)
         {
            if(a_1273 == a_1274)
            {
               this.a_3940();
            }
            nextFrame();
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
         var iXGridNo:int = 0;
         var arrMoveIntruder:Array = null;
         var iArrMoveIntruderLength:int = 0;
         var stMoveIntruder:a_4206 = null;
         var i:int = 0;
         if(!m_bActive.Value)
         {
            this.a_3940();
            return;
         }
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var iYGridNo:int = m_isChangeYGridNo ? int(y / a_3491.a_1081) : m_iYGridNo;
         if(this.CalculationBoundary())
         {
            return;
         }
         var stFieldGrid:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == null)
         {
            m_bActive.Value = false;
            this.a_3940();
            return;
         }
         if(stFieldGrid.m_isOccupy)
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
               if(this.CaclueHitMouse(stFieldGrid,stMoveIntruder))
               {
                  return;
               }
            }
         }
         if(a_1283)
         {
            stFieldGrid = a_1583.a_3438(iXGridNo + 1,iYGridNo);
         }
         else
         {
            stFieldGrid = a_1583.a_3438(iXGridNo - 1,iYGridNo);
         }
         if(null != stFieldGrid && stFieldGrid.m_isOccupy)
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
               if(this.CaclueHitMouse(stFieldGrid,stMoveIntruder))
               {
                  return;
               }
            }
         }
      }
      
      override protected function CalculationBoundary() : Boolean
      {
         if(y <= 0 || y >= BattleFieldView.a_1014)
         {
            m_bActive.Value = false;
            this.a_3940();
            return true;
         }
         if(x < 0 || x >= BattleFieldView.a_1013 || a_1576 && y > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            m_bActive.Value = false;
            this.a_3940();
            return true;
         }
         return false;
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
               if(!stMoveIntruder.IsElite)
               {
                  stMoveIntruder.a_4210();
               }
               else
               {
                  a_4352(stMoveIntruder);
               }
               SputterHurt(stFieldGrid,stMoveIntruder);
               return true;
            }
            if(!m_isPenetrate)
            {
               if(Boolean(a_1583) && a_1583.isOwnBattleField)
               {
                  BattleFieldView.a_1045.play();
               }
               a_4352(stMoveIntruder);
               SputterHurt(stFieldGrid,stMoveIntruder);
               return true;
            }
         }
         return false;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stThornThornsTwoShotVector.indexOf(this))
         {
            ms_stThornThornsTwoShotVector.push(this);
         }
         return true;
      }
   }
}

