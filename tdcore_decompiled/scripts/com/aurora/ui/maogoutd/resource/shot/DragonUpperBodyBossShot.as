package com.aurora.ui.maogoutd.resource.shot
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class DragonUpperBodyBossShot extends a_4348
   {
      
      public var a_1598:a_3491;
      
      public var m_iShotSequence:int;
      
      public var m_isFireEffect:Boolean;
      
      public function DragonUpperBodyBossShot()
      {
         super();
         a_1279 = -width * 0.2;
         a_1573 = 1;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(DragonUpperBodyBossShot) as DragonUpperBodyBossShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return DragonUpperBodyBossShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numXSpeed *= -1;
         a_1275 = 0;
         a_1587 = 1;
         gotoAndStop(1);
         this.m_iShotSequence = 0;
         this.m_isFireEffect = false;
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var iTargetPos:int = 0;
         var numDistance:Number = NaN;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         if(this.a_1598)
         {
            iTargetPos = a_1283 ? int(BattleFieldView.a_1013 - a_3491.a_1080 * (this.a_1598.m_iXGridNo + 0.5)) : int(a_3491.a_1080 * (this.a_1598.m_iXGridNo + 0.5));
            numDistance = Math.abs(iTargetPos - x);
            a_1581 = Math.abs(int(numDistance / m_numXSpeed));
            if(numDistance < a_3491.a_1080)
            {
               if(a_1581 < 2)
               {
                  a_1581 = 2;
               }
               m_numYSpeed = 0.5 * numDistance / a_1581;
            }
            else
            {
               m_numYSpeed = 3 * a_3491.a_1081 / a_1581;
            }
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var stDragonUpperBodyBossShot:DragonUpperBodyBossShot = null;
         var stTargetFieldGrid:a_3491 = null;
         if(this.m_isFireEffect)
         {
            if(0 == a_1447)
            {
               a_1447 = iCurrentTime;
               this.a_4373();
               gotoAndStop((a_1276[1] as FrameLabel).frame);
               a_1275 = 2;
            }
            if(iCurrentTime % 2 == 0)
            {
               nextFrame();
            }
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1273 == a_1274)
            {
               a_3940();
            }
            if(a_1447 > 0 && iCurrentTime - a_1447 > 80)
            {
               a_3940();
            }
            return;
         }
         if(m_isHited)
         {
            if(0 == a_1447)
            {
               a_1447 = iCurrentTime;
            }
            if(a_1273 == a_1274)
            {
               a_3940();
            }
            if(iCurrentTime % 2 == 0)
            {
               nextFrame();
            }
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1447 > 0 && iCurrentTime - a_1447 == 40)
            {
               stTargetFieldGrid = a_1583.a_3438(this.a_1598.m_iXGridNo - 1,this.a_1598.m_iYGridNo);
               if(stTargetFieldGrid)
               {
                  stDragonUpperBodyBossShot = DragonUpperBodyBossShot.a_4344() as DragonUpperBodyBossShot;
                  stDragonUpperBodyBossShot.a_1598 = stTargetFieldGrid;
                  stDragonUpperBodyBossShot.a_1797(0,0,a_1579,x - a_3491.a_1080,y,a_1583,stTargetFieldGrid);
                  parent.addChild(stDragonUpperBodyBossShot);
                  stDragonUpperBodyBossShot.m_isFireEffect = true;
               }
               stTargetFieldGrid = a_1583.a_3438(this.a_1598.m_iXGridNo + 1,this.a_1598.m_iYGridNo);
               if(stTargetFieldGrid)
               {
                  stDragonUpperBodyBossShot = DragonUpperBodyBossShot.a_4344() as DragonUpperBodyBossShot;
                  stDragonUpperBodyBossShot.a_1598 = stTargetFieldGrid;
                  stDragonUpperBodyBossShot.a_1797(0,0,a_1579,x + a_3491.a_1080,y,a_1583,stTargetFieldGrid);
                  parent.addChild(stDragonUpperBodyBossShot);
                  stDragonUpperBodyBossShot.m_isFireEffect = true;
               }
            }
            if(a_1447 > 0 && iCurrentTime - a_1447 == 80)
            {
               stTargetFieldGrid = a_1583.a_3438(this.a_1598.m_iXGridNo - 2,this.a_1598.m_iYGridNo);
               if(stTargetFieldGrid)
               {
                  stDragonUpperBodyBossShot = DragonUpperBodyBossShot.a_4344() as DragonUpperBodyBossShot;
                  stDragonUpperBodyBossShot.a_1598 = stTargetFieldGrid;
                  stDragonUpperBodyBossShot.a_1797(0,0,a_1579,x - a_3491.a_1080,y,a_1583,stTargetFieldGrid);
                  parent.addChild(stDragonUpperBodyBossShot);
                  stDragonUpperBodyBossShot.m_isFireEffect = true;
               }
               stTargetFieldGrid = a_1583.a_3438(this.a_1598.m_iXGridNo + 2,this.a_1598.m_iYGridNo);
               if(stTargetFieldGrid)
               {
                  stDragonUpperBodyBossShot = DragonUpperBodyBossShot.a_4344() as DragonUpperBodyBossShot;
                  stDragonUpperBodyBossShot.a_1598 = stTargetFieldGrid;
                  stDragonUpperBodyBossShot.a_1797(0,0,a_1579,x + a_3491.a_1080,y,a_1583,stTargetFieldGrid);
                  parent.addChild(stDragonUpperBodyBossShot);
                  stDragonUpperBodyBossShot.m_isFireEffect = true;
               }
            }
            if(a_1447 > 0 && iCurrentTime - a_1447 > 120)
            {
               a_3940();
            }
            return;
         }
         if(a_1588)
         {
            if(iCurrentTime % 2 == 0)
            {
               nextFrame();
            }
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
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
               a_1275 = 2;
            }
            if(!a_1283)
            {
               x = stFieldGrid.m_iXGridNo * a_3491.a_1080 + 15;
            }
            else
            {
               x = BattleFieldView.a_1013 - (stFieldGrid.m_iXGridNo * a_3491.a_1080 + (a_3491.a_1080 - width) / 2);
            }
            y = stFieldGrid.m_iYGridNo * a_3491.a_1081 + 5;
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

