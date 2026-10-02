package com.aurora.ui.maogoutd.resource.Intruder.ThunderCity.boss.RoboCop
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class RoboCopBossShot extends a_4348
   {
      
      private static var ms_stRoboCopBossShotVector:Array = new Array();
      
      private var stTargetFieldGrid:a_3491;
      
      public function RoboCopBossShot()
      {
         super();
         m_iYDisplayCenterPos = -44;
         a_1279 = -40;
         a_1573 = 1;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var stRoboCopBossShot:RoboCopBossShot = ms_stRoboCopBossShotVector.pop();
         if(null == stRoboCopBossShot)
         {
            stRoboCopBossShot = new RoboCopBossShot();
         }
         BattleFieldView.a_1017.play();
         return stRoboCopBossShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return RoboCopBossShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var i:int = 0;
         var j:* = 0;
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
         var isExistDefenseAhead:Boolean = false;
         if(m_isSpecial == 1)
         {
            for(i = 0; i <= 5; i++)
            {
               stFieldGrid = a_1583.a_3438(i,m_iYGridNo);
               if(Boolean(stFieldGrid) && stFieldGrid.a_3492())
               {
                  isExistDefenseAhead = true;
                  this.stTargetFieldGrid = stFieldGrid;
                  break;
               }
            }
            if(!isExistDefenseAhead)
            {
               stFieldGrid = a_1583.a_3438(0,m_iYGridNo);
               this.stTargetFieldGrid = stFieldGrid;
            }
         }
         else if(m_isSpecial == 2)
         {
            for(j = 5; j >= 0; j--)
            {
               stFieldGrid = a_1583.a_3438(j,m_iYGridNo);
               if(Boolean(stFieldGrid) && stFieldGrid.a_3492())
               {
                  isExistDefenseAhead = true;
                  this.stTargetFieldGrid = stFieldGrid;
                  break;
               }
            }
            if(!isExistDefenseAhead)
            {
               stFieldGrid = a_1583.a_3438(4,m_iYGridNo);
               this.stTargetFieldGrid = stFieldGrid;
            }
         }
         if(this.stTargetFieldGrid)
         {
            iTargetPos = a_1283 ? int(BattleFieldView.a_1013 - a_3491.a_1080 * (this.stTargetFieldGrid.m_iXGridNo + 0.5)) : int(a_3491.a_1080 * (this.stTargetFieldGrid.m_iXGridNo + 0.5));
            numDistance = Math.abs(iTargetPos - x) - 17;
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
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stRoboCopBossShotVector.indexOf(this))
         {
            ms_stRoboCopBossShotVector.push(this);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var numYMove:Number = NaN;
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
         this.a_4373();
         x += m_numXSpeed;
         if(iCurrentTime - a_1447 == a_1581)
         {
         }
         if(a_1576)
         {
            numYMove = 2 * m_numYSpeed * (iCurrentTime - a_1447) / a_1581 + 2 - m_numYSpeed;
            y += numYMove > 30 ? 30 : numYMove;
         }
      }
      
      private function a_4373() : void
      {
         var stFieldGrid:a_3491 = null;
         var stBaseDefense:a_3962 = null;
         if(y > a_3491.a_1081 * m_iYGridNo + 20)
         {
            stFieldGrid = this.stTargetFieldGrid;
            stBaseDefense = null;
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
            }
            if(stBaseDefense)
            {
               this.a_4374(stBaseDefense);
            }
            this.a_3940();
         }
         if(x < 0 || x >= BattleFieldView.a_1013)
         {
            trace("x < 0 || x >= BattleFieldView.ms_iBattleFieldWidth, HitTest failed. x:" + x + ", BattleFieldView.ms_iBattleFieldWidth:" + BattleFieldView.a_1013);
            this.a_3940();
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

