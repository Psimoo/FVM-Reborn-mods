package com.aurora.ui.maogoutd.resource.Intruder.newMouse
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class ConchMouseBubbleShot extends a_4348
   {
      
      private static var ms_stConchMouseBubbleShotVector:Array = new Array();
      
      private var a_1598:a_3491;
      
      public function ConchMouseBubbleShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1576 = true;
      }
      
      public static function a_4344() : a_4348
      {
         var stConchMouseBubbleShot:ConchMouseBubbleShot = ms_stConchMouseBubbleShotVector.pop();
         if(null == stConchMouseBubbleShot)
         {
            stConchMouseBubbleShot = new ConchMouseBubbleShot();
         }
         BattleFieldView.a_1017.play();
         return stConchMouseBubbleShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return ConchMouseBubbleShotMovie;
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
            if(Boolean(stFieldGrid) && (Boolean(stFieldGrid.a_3493(288817204)) || Boolean(stFieldGrid.a_3493(288817214))))
            {
               isExistDefenseAhead = true;
               this.a_1598 = stFieldGrid;
               break;
            }
         }
         if(!isExistDefenseAhead)
         {
            stFieldGrid = a_1583.a_3438(iXGridNo - 3,m_iYGridNo);
            isExistDefenseAhead = true;
            this.a_1598 = stFieldGrid;
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
               m_numYSpeed = 0;
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
         if(-1 == ms_stConchMouseBubbleShotVector.indexOf(this))
         {
            ms_stConchMouseBubbleShotVector.push(this);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var stFieldGridVector:Array = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var indexY:int = 0;
         var indexX:int = 0;
         var numYMove:Number = NaN;
         if(m_isHited)
         {
            if(a_1273 == a_1274 - 5)
            {
               this.a_1598.m_stCurrentBattbleFieldView.a_3466();
               stFieldGridVector = this.a_1598.m_stCurrentBattbleFieldView.stFieldGridsVector;
               yStart = this.a_1598.m_iYGridNo - 1 < 0 ? 0 : int(this.a_1598.m_iYGridNo - 1);
               xStart = this.a_1598.m_iXGridNo - 1 < 0 ? 0 : int(this.a_1598.m_iXGridNo - 1);
               yEnd = this.a_1598.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(this.a_1598.m_iYGridNo + 1);
               xEnd = this.a_1598.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(this.a_1598.m_iXGridNo + 1);
               for(indexY = yStart; indexY <= yEnd; indexY++)
               {
                  for(indexX = xStart; indexX <= xEnd; indexX++)
                  {
                     if(stFieldGridVector[indexY][indexX].m_stProtector)
                     {
                        stFieldGridVector[indexY][indexX].m_stProtector.m_iDieType = 1;
                        stFieldGridVector[indexY][indexX].m_stProtector.a_3969(stFieldGridVector[indexY][indexX].m_stProtector.iLifeValue);
                     }
                     if(Boolean(stFieldGridVector[indexY][indexX].m_stAttackFighter) && !(stFieldGridVector[indexY][indexX].m_stAttackFighter is a_3924))
                     {
                        stFieldGridVector[indexY][indexX].m_stAttackFighter.m_iDieType = 1;
                        stFieldGridVector[indexY][indexX].m_stAttackFighter.a_3969(stFieldGridVector[indexY][indexX].m_stAttackFighter.iLifeValue);
                     }
                     if(stFieldGridVector[indexY][indexX].m_stFlowerDefense)
                     {
                        stFieldGridVector[indexY][indexX].m_stFlowerDefense.m_iDieType = 1;
                        stFieldGridVector[indexY][indexX].m_stFlowerDefense.a_3969(stFieldGridVector[indexY][indexX].m_stFlowerDefense.iLifeValue);
                     }
                     if(stFieldGridVector[indexY][indexX].m_stBaseAuxiliaryFighter)
                     {
                        stFieldGridVector[indexY][indexX].m_stBaseAuxiliaryFighter.m_iDieType = 1;
                        stFieldGridVector[indexY][indexX].m_stBaseAuxiliaryFighter.a_3969(stFieldGridVector[indexY][indexX].m_stBaseAuxiliaryFighter.iLifeValue);
                     }
                     if(stFieldGridVector[indexY][indexX].m_stHoneyTrapBaseDefense)
                     {
                        stFieldGridVector[indexY][indexX].m_stHoneyTrapBaseDefense.m_iDieType = 1;
                        stFieldGridVector[indexY][indexX].m_stHoneyTrapBaseDefense.a_3969(stFieldGridVector[indexY][indexX].m_stHoneyTrapBaseDefense.iLifeValue);
                     }
                     if(stFieldGridVector[indexY][indexX].m_stOceanGoddessToolDefense)
                     {
                        stFieldGridVector[indexY][indexX].m_stOceanGoddessToolDefense.m_iDieType = 1;
                        stFieldGridVector[indexY][indexX].m_stOceanGoddessToolDefense.a_3969(stFieldGridVector[indexY][indexX].m_stOceanGoddessToolDefense.iLifeValue);
                     }
                     if(stFieldGridVector[indexY][indexX].m_stBoomDefense)
                     {
                        stFieldGridVector[indexY][indexX].m_stBoomDefense.m_iDieType = 1;
                        stFieldGridVector[indexY][indexX].m_stBoomDefense.a_3969(stFieldGridVector[indexY][indexX].m_stBoomDefense.iLifeValue);
                     }
                  }
               }
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
         this.a_4373();
         x += m_numXSpeed;
         if(a_1576)
         {
            numYMove = 2 * m_numYSpeed * (iCurrentTime - a_1447) / a_1581 + 1 - m_numYSpeed;
            y += 0;
         }
      }
      
      private function a_4373() : void
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
         var iYGridNo:int = m_iYGridNo;
         if(x < 0 || x >= BattleFieldView.a_1013 || y > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            trace("x < 0 || x >= BattleFieldView.ms_iBattleFieldWidth, HitTest failed. x:" + x + ", BattleFieldView.ms_iBattleFieldWidth:" + BattleFieldView.a_1013);
            this.a_3940();
            return;
         }
         var stFieldGrid:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == this.a_1598)
         {
            this.a_1598.m_stCurrentBattbleFieldView.a_3466();
            m_isHited = true;
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
            return;
         }
      }
      
      private function a_4374(stBaseDefense:a_3962) : Boolean
      {
         stBaseDefense.m_iDieType = 1;
         stBaseDefense.a_3969(stBaseDefense.iLifeValue);
         stBaseDefense.m_iDieType = 0;
         return true;
      }
   }
}

