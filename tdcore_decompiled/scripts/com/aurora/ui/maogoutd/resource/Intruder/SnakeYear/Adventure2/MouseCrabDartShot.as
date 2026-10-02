package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Adventure2
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.shot.MouseCrabDartShotMovie;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class MouseCrabDartShot extends a_4348
   {
      
      private static var ms_stMouseCrabDartShotVector:Array = new Array();
      
      public var a_1598:a_3491;
      
      public var m_iXMoveTime:int = 0;
      
      public var m_numYInitChangeSpeed:Number = 0;
      
      private var m_iStopTime:int = 0;
      
      public function MouseCrabDartShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var stMouseCrabDartShot:MouseCrabDartShot = ms_stMouseCrabDartShotVector.pop();
         if(null == stMouseCrabDartShot)
         {
            stMouseCrabDartShot = new MouseCrabDartShot();
         }
         BattleFieldView.a_1017.play();
         return stMouseCrabDartShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return MouseCrabDartShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         this.m_iStopTime = 0;
         this.m_iXMoveTime = 0;
         this.m_numYInitChangeSpeed = 0;
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stMouseCrabDartShotVector.indexOf(this))
         {
            ms_stMouseCrabDartShotVector.push(this);
         }
         return true;
      }
      
      public function ForceRelease() : Boolean
      {
         return this.a_3940();
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited)
         {
            if(this.m_iStopTime > 0)
            {
               --this.m_iStopTime;
               return;
            }
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
         if(0 == this.m_iXMoveTime && y > a_1586)
         {
            this.m_iXMoveTime = iCurrentTime - a_1447;
         }
         if(this.m_iXMoveTime > 0)
         {
            m_numYSpeed = 14 + this.m_numYInitChangeSpeed + 0.9 * (this.m_iXMoveTime + a_1447 - iCurrentTime);
         }
         else
         {
            m_numYSpeed = -14 - this.m_numYInitChangeSpeed - 0.9 * (a_1447 - iCurrentTime);
         }
         y += m_numYSpeed;
         if(y <= a_1586)
         {
            x -= 9;
         }
         else
         {
            x += 9;
         }
         this.a_4373();
      }
      
      private function a_4373() : void
      {
         var iXGridNo:int = int(x / a_3491.a_1080);
         var iYGridNo:int = int(y / a_3491.a_1081);
         var stFieldGrid:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid)
         {
            this.a_3502(stFieldGrid);
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
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
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
      
      private function a_4374(stBaseDefense:a_3962) : Boolean
      {
         if(!(stBaseDefense is a_3924))
         {
            stBaseDefense.m_iDieType = 1;
            stBaseDefense.a_3969(stBaseDefense.iLifeValue);
         }
         return true;
      }
   }
}

