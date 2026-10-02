package com.aurora.ui.maogoutd.resource.Intruder.SnowMountain.IceThrowerMouse
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class PigIceThrowerShot extends a_4348
   {
      
      private static var ms_stPigIceThrowerShotVector:Array = new Array();
      
      private var a_1598:a_3491;
      
      public function PigIceThrowerShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1576 = true;
      }
      
      public static function a_4344() : a_4348
      {
         var stPigIceThrowerShot:PigIceThrowerShot = ms_stPigIceThrowerShotVector.pop();
         if(null == stPigIceThrowerShot)
         {
            stPigIceThrowerShot = new PigIceThrowerShot();
         }
         BattleFieldView.a_1017.play();
         return stPigIceThrowerShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return PigIceThrowerShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numXSpeed *= -1;
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
         var isExistDefenseAhead:Boolean = false;
         for(var i:int = 0; i <= iXGridNo; i++)
         {
            stFieldGrid = a_1583.a_3438(i,m_iYGridNo);
            if(Boolean(stFieldGrid) && stFieldGrid.a_3492())
            {
               isExistDefenseAhead = true;
               this.a_1598 = stFieldGrid;
               break;
            }
         }
         if(isExistDefenseAhead)
         {
            iTargetPos = a_1283 ? int(BattleFieldView.a_1013 - a_3491.a_1080 * (stFieldGrid.m_iXGridNo + 0.5)) : int(a_3491.a_1080 * (stFieldGrid.m_iXGridNo + 0.5));
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
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stPigIceThrowerShotVector.indexOf(this))
         {
            ms_stPigIceThrowerShotVector.push(this);
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
         if(a_1576)
         {
            numYMove = 2 * m_numYSpeed * (iCurrentTime - a_1447) / a_1581 + 1 - m_numYSpeed;
            y += numYMove > 30 ? 30 : numYMove;
         }
      }
      
      private function a_4373() : void
      {
         var stBaseDefense:a_3962 = null;
         if(x < 0 || x >= BattleFieldView.a_1013 || y > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            trace("x < 0 || x >= BattleFieldView.ms_iBattleFieldWidth, HitTest failed. x:" + x + ", BattleFieldView.ms_iBattleFieldWidth:" + BattleFieldView.a_1013);
            this.a_3940();
            return;
         }
         var stFieldGrid:a_3491 = this.a_1598;
         if(stFieldGrid.a_3492() || a_1579 > 0)
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
            else if(stFieldGrid.HasNewSlot())
            {
               stBaseDefense = stFieldGrid.GetNewSlotDefense();
            }
            else if(null != stFieldGrid.m_stTrayDefense)
            {
               stBaseDefense = stFieldGrid.m_stTrayDefense;
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

