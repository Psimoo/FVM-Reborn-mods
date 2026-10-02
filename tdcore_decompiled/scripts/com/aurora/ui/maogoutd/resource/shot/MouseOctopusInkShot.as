package com.aurora.ui.maogoutd.resource.shot
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class MouseOctopusInkShot extends a_4348
   {
      
      public var a_1598:a_3491;
      
      private var m_iStopTime:int = 0;
      
      public function MouseOctopusInkShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(MouseOctopusInkShot) as MouseOctopusInkShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return MouseOctopusInkShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         this.m_iStopTime = 0;
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         var iYDistance:int = 0;
         var numTime:Number = NaN;
         var iXDistance:int = (this.a_1598.m_iXGridNo + 0.5) * a_3491.a_1080 - a_1585;
         iYDistance = (this.a_1598.m_iYGridNo + 0.5) * a_3491.a_1081 - a_1586;
         numTime = Math.abs(iXDistance) > Math.abs(iYDistance) ? Math.abs(iXDistance) / 15 : Math.abs(iYDistance) / 15;
         m_numXSpeed = iXDistance / numTime;
         m_numYSpeed = iYDistance / numTime;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var stFieldGrid:a_3491 = null;
         var stBaseDefense:a_3962 = null;
         if(m_isHited)
         {
            if(this.m_iStopTime > 0)
            {
               --this.m_iStopTime;
               return;
            }
            if(a_1273 == a_1274)
            {
               stFieldGrid = this.a_1598;
               if(null != stFieldGrid.m_stAttackFighter)
               {
                  stBaseDefense = stFieldGrid.m_stAttackFighter;
               }
               else if(null != stFieldGrid.m_stBoomDefense)
               {
                  stBaseDefense = stFieldGrid.m_stBoomDefense;
               }
               else if(null != stFieldGrid.m_stFlowerDefense)
               {
                  stBaseDefense = stFieldGrid.m_stFlowerDefense;
               }
               else if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
               {
                  stBaseDefense = stFieldGrid.m_stBaseAuxiliaryFighter;
               }
               else if(null != stFieldGrid.m_stProtector)
               {
                  stBaseDefense = stFieldGrid.m_stProtector;
               }
               else if(null != stFieldGrid.m_stTrayDefense)
               {
                  stBaseDefense = stFieldGrid.m_stTrayDefense;
               }
               if(stBaseDefense)
               {
                  this.a_4374(stBaseDefense);
               }
               a_3940();
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
         this.a_4373();
         x += m_numXSpeed;
         y += m_numYSpeed;
      }
      
      private function a_4373() : void
      {
         var stFieldGrid:a_3491 = null;
         var stBaseDefense:a_3962 = null;
         if(x < 0 || x >= BattleFieldView.a_1013 || y > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            trace("x < 0 || x >= BattleFieldView.ms_iBattleFieldWidth, HitTest failed. x:" + x + ", BattleFieldView.ms_iBattleFieldWidth:" + BattleFieldView.a_1013);
            a_3940();
            return;
         }
         stFieldGrid = this.a_1598;
         if(x > a_3491.a_1080 * this.a_1598.m_iXGridNo && x < a_3491.a_1080 * (this.a_1598.m_iXGridNo + 1) && y > a_3491.a_1081 * this.a_1598.m_iYGridNo && y < a_3491.a_1081 * (this.a_1598.m_iYGridNo + 1))
         {
            m_isHited = true;
            this.m_iStopTime = 40;
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
            if(!a_1283)
            {
               x = stFieldGrid.m_iXGridNo * a_3491.a_1080 + 30;
            }
            else
            {
               x = BattleFieldView.a_1013 - (stFieldGrid.m_iXGridNo * a_3491.a_1080 + (a_3491.a_1080 - width) / 2);
            }
            y = stFieldGrid.m_iYGridNo * a_3491.a_1081 - 5;
            a_1583.addChildAt(this,a_1583.a_3440(this.a_1598.m_iYGridNo));
         }
         if(stFieldGrid.a_3492())
         {
            if(null != stFieldGrid.m_stAttackFighter)
            {
               stBaseDefense = stFieldGrid.m_stAttackFighter;
            }
            else if(null != stFieldGrid.m_stBoomDefense)
            {
               stBaseDefense = stFieldGrid.m_stBoomDefense;
            }
            else if(null != stFieldGrid.m_stFlowerDefense)
            {
               stBaseDefense = stFieldGrid.m_stFlowerDefense;
            }
            else if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
            {
               stBaseDefense = stFieldGrid.m_stBaseAuxiliaryFighter;
            }
            else if(null != stFieldGrid.m_stProtector)
            {
               stBaseDefense = stFieldGrid.m_stProtector;
            }
            else if(null != stFieldGrid.m_stTrayDefense)
            {
               stBaseDefense = stFieldGrid.m_stTrayDefense;
            }
            if(Boolean(stBaseDefense) && hitTestObject(stBaseDefense))
            {
               m_isHited = true;
               this.m_iStopTime = 40;
               if(a_1276.length > 0)
               {
                  gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
               }
               if(!a_1283)
               {
                  x = stFieldGrid.m_iXGridNo * a_3491.a_1080 + 30;
               }
               else
               {
                  x = BattleFieldView.a_1013 - (stFieldGrid.m_iXGridNo * a_3491.a_1080 + (a_3491.a_1080 - width) / 2);
               }
               y = stFieldGrid.m_iYGridNo * a_3491.a_1081 - 5;
               a_1583.addChildAt(this,a_1583.a_3440(this.a_1598.m_iYGridNo));
               return;
            }
         }
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

