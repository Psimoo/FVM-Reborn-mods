package com.aurora.ui.maogoutd.resource.defender.SnakeYear.rainbowSnake
{
   import a_4718.b_182;
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class RainbowSnakeSecondShot extends a_4348
   {
      
      private static var ms_stRainbowSnakeSecondShotVector:Array = new Array();
      
      private var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      public function RainbowSnakeSecondShot()
      {
         super();
         a_1279 = -10;
         m_iYDisplayCenterPos = -1;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         var stRainbowSnakeSecondShot:RainbowSnakeSecondShot = ms_stRainbowSnakeSecondShotVector.pop();
         if(null == stRainbowSnakeSecondShot)
         {
            stRainbowSnakeSecondShot = new RainbowSnakeSecondShot();
         }
         return stRainbowSnakeSecondShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return RainbowSnakeSecondShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         a_1577 = false;
         var enterRoom:Object = a_2161.e.getEnterRoom();
         this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited && !m_isPenetrate)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               m_bActive.Value = false;
               this.a_3940();
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
         if(a_1578)
         {
            if(!FollowingShotHandle())
            {
               return;
            }
         }
         x += m_numXSpeed;
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
         var random:int = 0;
         if(stMoveIntruder != null && !stMoveIntruder.isCannotSeeByFighter && 0 == stMoveIntruder.iSpaceState && hitTestObject(stMoveIntruder))
         {
            if(Boolean(a_1583) && a_1583.isOwnBattleField)
            {
               BattleFieldView.a_1045.play();
            }
            m_isHited = true;
            this.x += 25;
            this.a_4352(stMoveIntruder);
            SputterHurt(stFieldGrid,stMoveIntruder);
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
            random = BattleFieldView.m_stRandomSeed.nextInt(100) + 1;
            if(stMoveIntruder.iLifeValue > 0 && random <= 10)
            {
               stMoveIntruder.a_4208(b_182.a_435,20);
            }
            return true;
         }
         return false;
      }
      
      override public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         if(a_1576 || a_1575)
         {
            baseMoveIntruder.a_4209(GetFinalDamage());
         }
         else
         {
            baseMoveIntruder.a_3969(GetFinalDamage());
         }
         if(baseMoveIntruder.m_stCurrentFieldGrid == null || baseMoveIntruder.iLifeValue <= 0 || baseMoveIntruder.parent == null)
         {
            return false;
         }
         if(a_1573 > 0)
         {
            baseMoveIntruder.a_4208(b_182.a_432,a_1573);
         }
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stRainbowSnakeSecondShotVector.indexOf(this))
         {
            ms_stRainbowSnakeSecondShotVector.push(this);
         }
         return true;
      }
   }
}

