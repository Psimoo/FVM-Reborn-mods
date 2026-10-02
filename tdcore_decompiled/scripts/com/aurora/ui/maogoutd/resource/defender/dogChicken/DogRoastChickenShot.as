package com.aurora.ui.maogoutd.resource.defender.dogChicken
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class DogRoastChickenShot extends a_4348
   {
      
      private var a_1590:Number;
      
      private var a_1602:Boolean = false;
      
      public function DogRoastChickenShot()
      {
         super();
         a_1279 = 0;
         a_1573 = 1;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(DogRoastChickenShot) as DogRoastChickenShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return DogRoastChickenShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         this.a_1602 = false;
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         a_1447 = 0;
         this.a_1590 = x;
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         var iXGridNo:int = 0;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var numDistance:Number = 400 - Math.abs(x % a_3491.a_1080 - a_3491.a_1080 * 0.5);
         var iLargeProtectorXGridNo:int = BattleFieldView.a_1011 - a_1584.m_iXGridNo;
         var stFieldGrid:a_3491 = a_1583.m_stOpponentBattleFieldInstance.a_3438(iLargeProtectorXGridNo,m_iYGridNo);
         var stCenterFieldGrid:a_3491 = a_1583.m_stOpponentBattleFieldInstance.a_3438(iLargeProtectorXGridNo - 1,m_iYGridNo);
         var stSecondFieldGrid:a_3491 = a_1583.m_stOpponentBattleFieldInstance.a_3438(iLargeProtectorXGridNo - 2,m_iYGridNo);
         trace("m_iShotSequenceNum:" + a_1580);
         if(1 == a_1580)
         {
            if(!stSecondFieldGrid)
            {
               a_3940();
               return false;
            }
            numDistance += a_3491.a_1080;
            if(Boolean(null != stCenterFieldGrid) && Boolean(stCenterFieldGrid.m_stAttackFighter) && stCenterFieldGrid.m_stAttackFighter.iBreadFighterType > 1)
            {
               a_1581 = Math.abs(int((numDistance - a_3491.a_1080) / m_numXSpeed));
               this.a_1602 = true;
            }
            else
            {
               a_1581 = Math.abs(int(numDistance / m_numXSpeed));
            }
         }
         else if(Boolean(null != stFieldGrid) && Boolean(stFieldGrid.m_stAttackFighter) && stFieldGrid.m_stAttackFighter.iBreadFighterType > 1)
         {
            a_1581 = Math.abs(int((numDistance - a_3491.a_1080) / m_numXSpeed));
            this.a_1602 = true;
         }
         else
         {
            a_1581 = Math.abs(int(numDistance / m_numXSpeed));
         }
         m_numYSpeed = 6 * a_3491.a_1081 / a_1581;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var stGlobalPoint:Point = null;
         var stBattleForFourPoint:Point = null;
         var numYMove:Number = NaN;
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
            stGlobalPoint = parent.localToGlobal(new Point(x,y));
            stBattleForFourPoint = parent.parent.globalToLocal(stGlobalPoint);
            x = stBattleForFourPoint.x;
            y = stBattleForFourPoint.y;
            parent.parent.addChild(this);
            this.a_1590 = x;
         }
         this.a_4373();
         x += m_numXSpeed;
         if(a_1576)
         {
            numYMove = 2 * m_numYSpeed * (iCurrentTime - a_1447) / a_1581 - m_numYSpeed;
            y += numYMove;
         }
      }
      
      private function a_4373() : void
      {
         var stBaseDefense:a_3962 = null;
         var iTargetXGridNo:int = BattleFieldView.a_1011 - a_1584.m_iXGridNo - 1;
         var iYGridNo:int = m_iYGridNo;
         var instanse:int = a_1580 == 1 ? 470 : 420;
         if(Math.abs(x - this.a_1590) > instanse + a_3491.a_1080 * 0.1)
         {
            trace("Release DogRoastChickenShot");
            a_3940();
            return;
         }
         var iLargeProtectorXGridNo:int = BattleFieldView.a_1011 - a_1584.m_iXGridNo;
         var stLargeProtectorFieldGrid:a_3491 = a_1583.m_stOpponentBattleFieldInstance.a_3438(iLargeProtectorXGridNo,m_iYGridNo);
         var stCenterFieldGrid:a_3491 = a_1583.m_stOpponentBattleFieldInstance.a_3438(iLargeProtectorXGridNo - 1,m_iYGridNo);
         var stFieldGrid:a_3491 = a_1583.m_stOpponentBattleFieldInstance.a_3438(iTargetXGridNo,iYGridNo);
         var stSecondFieldGrid:a_3491 = a_1583.m_stOpponentBattleFieldInstance.a_3438(iTargetXGridNo - 1,iYGridNo);
         if(Math.abs(x - this.a_1590) >= instanse - a_3491.a_1080 * 3)
         {
            if(Boolean(0 == a_1580 && this.a_1602) && Boolean(stLargeProtectorFieldGrid.m_stAttackFighter) && stLargeProtectorFieldGrid.m_stAttackFighter.iBreadFighterType > 1)
            {
               stBaseDefense = stLargeProtectorFieldGrid.m_stAttackFighter;
            }
            else if(Boolean(1 == a_1580 && this.a_1602) && Boolean(stCenterFieldGrid.m_stAttackFighter) && stCenterFieldGrid.m_stAttackFighter.iBreadFighterType > 1)
            {
               stBaseDefense = stCenterFieldGrid.m_stAttackFighter;
            }
            else if(0 == a_1580 && stFieldGrid.a_3492() || Boolean(1 == a_1580 && stSecondFieldGrid) && Boolean(stSecondFieldGrid.a_3492()))
            {
               if(1 == a_1580)
               {
                  stFieldGrid = stSecondFieldGrid;
               }
               if(null != stFieldGrid.m_stAttackFighter)
               {
                  stBaseDefense = stFieldGrid.m_stAttackFighter;
                  if(0 == stFieldGrid.m_stAttackFighter.iBattleFighterType && stFieldGrid.m_stAttackFighter.iLifeValue <= 10)
                  {
                     stBaseDefense = null;
                  }
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
            }
            if(Boolean(stBaseDefense) && hitTestObject(stBaseDefense))
            {
               this.a_4374(stBaseDefense);
               m_isHited = true;
               if(a_1276.length > 0)
               {
                  gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
               }
               return;
            }
         }
      }
      
      private function a_4374(stBaseDefense:a_3962) : Boolean
      {
         if(stBaseDefense is a_3924 && stBaseDefense.iLifeValue <= a_1579)
         {
            stBaseDefense.m_isHurtByOpponent = true;
            stBaseDefense.m_iDieType = 3;
            stBaseDefense.a_3969(stBaseDefense.iLifeValue - 10);
            stBaseDefense.m_iDieType = 0;
         }
         else
         {
            stBaseDefense.m_isHurtByOpponent = true;
            stBaseDefense.m_iDieType = 3;
            stBaseDefense.a_3969(a_1579);
            stBaseDefense.m_iDieType = 0;
         }
         if(Boolean(a_1583) && a_1583.isOwnBattleField)
         {
            BattleFieldView.a_1015.play();
         }
         return true;
      }
   }
}

