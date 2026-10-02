package com.aurora.ui.maogoutd.resource.shot
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class MouseTankBossBoomShot extends a_4348
   {
      
      public var a_1598:a_3491;
      
      public var m_iShotSequence:int;
      
      public function MouseTankBossBoomShot()
      {
         super();
         a_1279 = -width * 0.2;
         a_1573 = 1;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 2;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(MouseTankBossBoomShot) as MouseTankBossBoomShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return MouseTankBossBoomShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numXSpeed *= -1;
         a_1275 = 0;
         a_1587 = 2;
         gotoAndStop(1);
         this.m_iShotSequence = 0;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited)
         {
            if(a_1273 == a_1274)
            {
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
         if(iCurrentTime - a_1447 < 80)
         {
            if(y > -40)
            {
               y -= 15;
            }
            else if(visible)
            {
               visible = false;
               x = this.a_1598.m_iXGridNo * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - width);
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         else
         {
            visible = true;
            if(y < BattleFieldView.a_1014)
            {
               y += 15;
               this.a_4373();
            }
            else
            {
               a_3940();
            }
         }
      }
      
      private function a_4373() : void
      {
         var stFieldGrid:a_3491 = null;
         var stBaseDefense:a_3962 = null;
         if(x < 0 || x >= BattleFieldView.a_1013 || y > a_3491.a_1081 * (this.a_1598.m_iYGridNo + 1))
         {
            trace("x < 0 || x >= BattleFieldView.ms_iBattleFieldWidth, HitTest failed. x:" + x + ", BattleFieldView.ms_iBattleFieldWidth:" + BattleFieldView.a_1013);
            a_3940();
            return;
         }
         stFieldGrid = this.a_1598;
         if(y > stFieldGrid.m_iYGridNo * a_3491.a_1081)
         {
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
                  this.a_4374(stBaseDefense);
               }
            }
            m_isHited = true;
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
            y = stFieldGrid.m_iYGridNo * a_3491.a_1081 + 20;
            return;
         }
      }
      
      private function a_4374(stBaseDefense:a_3962) : Boolean
      {
         var iHurtPower:int = 0;
         stBaseDefense.m_iDieType = 1;
         if(stBaseDefense is a_3924)
         {
            iHurtPower = stBaseDefense.iLifeValue - 10 > a_1579 ? a_1579 : int(stBaseDefense.iLifeValue - 10);
            stBaseDefense.a_3969(iHurtPower);
         }
         else
         {
            stBaseDefense.a_3969(a_1579);
         }
         stBaseDefense.m_iDieType = 0;
         if(Boolean(a_1583) && a_1583.isOwnBattleField)
         {
            BattleFieldView.a_1015.play();
         }
         return true;
      }
   }
}

