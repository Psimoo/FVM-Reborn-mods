package com.aurora.ui.maogoutd.resource.defender.DragonYear.FlyingDragon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class FlyingDragonBaseShot extends a_4348
   {
      
      private var moveSpeed:int;
      
      private var iFirstTick:Number = 0;
      
      private var iOldX:Number;
      
      private var iOldY:Number;
      
      private var angles:Array = [230,290,350,50,110,170];
      
      public function FlyingDragonBaseShot()
      {
         super();
         a_1279 = 0;
         m_iYDisplayCenterPos = 0;
         a_1573 = 1;
         a_1588 = true;
         a_1587 = 1;
         scaleX = scaleY = 1;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(FlyingDragonBaseShot) as FlyingDragonBaseShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return FlyingDragonBaseShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         this.iFirstTick = 0;
         this.moveSpeed = Math.abs(numSpeed);
         rotationY = 0;
         a_1577 = true;
         m_isCanCrossFireAuxiliary = false;
         m_isCanBounceByAuxiliary = true;
         m_isChangeYGridNo = true;
         m_isPenetrate = false;
         this.iOldX = x;
         this.iOldY = y;
         return true;
      }
      
      private function SetRealSpeed() : void
      {
         var dt:Number = NaN;
         var a:Number = NaN;
         var b:Number = NaN;
         var angleRad:Number = NaN;
         dt = 0.6;
         a = 22;
         b = -0.12;
         angleRad = this.angles[5 - (m_isSpecial - 1)] * Math.PI / 180;
         x = this.iOldX + a * this.iFirstTick * Math.cos(b * this.iFirstTick + angleRad);
         y = this.iOldY + a * this.iFirstTick * Math.sin(b * this.iFirstTick + angleRad);
         this.iFirstTick += dt;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
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
         a_4351();
         this.SetRealSpeed();
      }
      
      override protected function CalculationBoundary() : Boolean
      {
         if(x < 0 || x >= BattleFieldView.a_1013 + 20 || y < -20 || y > BattleFieldView.a_1014)
         {
            m_bActive.Value = false;
            a_3940();
            return true;
         }
         return false;
      }
      
      override protected function CaclueHitMouse(stFieldGrid:a_3491, stMoveIntruder:a_4206) : Boolean
      {
         if(!stMoveIntruder.isCannotSeeByFighter && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState) && hitTestObject(stMoveIntruder))
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
               m_isHited = true;
               if(a_1276.length > 0)
               {
                  gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
               }
               return true;
            }
            if(!m_isPenetrate)
            {
               if(Boolean(a_1583) && a_1583.isOwnBattleField)
               {
                  BattleFieldView.a_1045.play();
               }
               a_4352(stMoveIntruder);
               this.SputterHurt(stFieldGrid,stMoveIntruder);
               m_isHited = true;
               if(a_1276.length > 0)
               {
                  gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
               }
               return true;
            }
         }
         return false;
      }
      
      override protected function SputterHurt(stHitenFieldGrid:a_3491, stHitenMouseIntruder:a_4206) : void
      {
      }
   }
}

