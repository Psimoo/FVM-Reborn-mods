package com.aurora.ui.maogoutd.resource.shot
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class a_4377 extends a_4348
   {
      
      private var a_1598:a_3491;
      
      private var m_iTargetX:Number;
      
      private var m_iTargetY:Number;
      
      public function a_4377()
      {
         super();
         a_1279 = -width * 0.3;
         a_1573 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(a_4377) as a_4377;
      }
      
      override protected function getBindMovie() : Class
      {
         return MouseLandSubmarineShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         a_1576 = false;
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1576 = true;
         a_1447 = 0;
         m_numXSpeed *= -1;
         a_1587 = 1;
         a_1581 = 0;
         this.m_iTargetX = 0;
         this.m_iTargetY = 0;
         this.a_1598 = null;
         return true;
      }
      
      public function setTargetFieldGrid(grid:a_3491) : void
      {
         this.a_1598 = grid;
         this.a_4349();
      }
      
      override protected function a_4349() : Boolean
      {
         if(null != this.a_1598)
         {
            this.m_iTargetX = this.a_1598.m_iXGridNo * a_3491.a_1080 + a_3491.a_1080 * 0.5;
            this.m_iTargetY = this.a_1598.m_iYGridNo * a_3491.a_1081 + a_3491.a_1081 * 0.4;
            a_1581 = Math.ceil((this.m_iTargetX - x) / m_numXSpeed);
            m_numYSpeed = (this.m_iTargetY - y) / a_1581;
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var iMinNum:Number = NaN;
         if(null != this.a_1598)
         {
            iMinNum = 1;
            if(x != this.m_iTargetX)
            {
               if(iMinNum < Math.abs(m_numXSpeed))
               {
                  iMinNum = Math.abs(m_numXSpeed);
               }
               if(Math.abs(this.m_iTargetX - x) <= iMinNum)
               {
                  x = this.m_iTargetX;
               }
               else
               {
                  x += m_numXSpeed;
               }
            }
            if(y != this.m_iTargetY)
            {
               if(iMinNum < Math.abs(m_numYSpeed))
               {
                  iMinNum = Math.abs(m_numYSpeed);
               }
               if(Math.abs(this.m_iTargetY - y) <= iMinNum)
               {
                  y = this.m_iTargetY;
               }
               else
               {
                  y += m_numYSpeed;
               }
            }
         }
         else
         {
            x += m_numXSpeed;
            y += m_numYSpeed;
         }
         if(m_isHited)
         {
            if(a_1273 == a_1274)
            {
               a_3940();
            }
            if(0 == iCurrentTime % 2)
            {
               nextFrame();
            }
            return;
         }
         if(a_1273 == (a_1276[a_1275] as FrameLabel).frame - 1)
         {
            a_1273 = 1;
         }
         if(0 == iCurrentTime % 2)
         {
            nextFrame();
         }
         this.a_4373();
      }
      
      private function a_4373() : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stBaseDefense:a_3962 = null;
         if(x < 0 || x >= BattleFieldView.a_1013 || y > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            trace("x < 0 || x >= BattleFieldView.ms_iBattleFieldWidth, HitTest failed. x:" + x + ", BattleFieldView.ms_iBattleFieldWidth:" + BattleFieldView.a_1013);
            a_3940();
            return;
         }
         var stFieldGrid:a_3491 = this.a_1598;
         if(null == stFieldGrid)
         {
            iXGridNo = int(x / a_3491.a_1080);
            iYGridNo = int(y / a_3491.a_1081);
            stFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
         }
         if(null == stFieldGrid)
         {
            return;
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
            if(stBaseDefense)
            {
               if(hitTestObject(stBaseDefense) || x < a_3491.a_1080 * (stFieldGrid.m_iXGridNo + 0.4))
               {
                  this.a_4374(stBaseDefense);
                  m_isHited = true;
                  if(a_1276.length > 0)
                  {
                     gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
                  }
               }
            }
         }
      }
      
      private function a_4374(stBaseDefense:a_3962) : Boolean
      {
         var iHurtPower:int = 0;
         stBaseDefense.m_iDieType = 1;
         if(stBaseDefense is a_3924)
         {
            iHurtPower = a_1579;
            if(stBaseDefense.iLifeValue - iHurtPower < 1)
            {
               iHurtPower = stBaseDefense.iLifeValue - 1;
            }
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

