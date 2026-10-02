package com.aurora.ui.maogoutd.resource.shot.DoublePai
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class DoublePaiShot extends a_4348
   {
      
      private var m_vLastMoveIntruder:Vector.<a_4206>;
      
      public function DoublePaiShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1588 = true;
         this.m_vLastMoveIntruder = new Vector.<a_4206>();
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(DoublePaiShot,DoublePaiShotMovie) as a_4348;
      }
      
      public static function GetFreeShot1() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(DoublePaiShot,DoublePaiShot1Movie) as a_4348;
      }
      
      public static function GetFreeShot2() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(DoublePaiShot,DoublePaiShot2Movie) as a_4348;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         m_isPenetrate = true;
         return true;
      }
      
      override protected function addFireShot(stLastWaitShot:a_4348, stFieldGrid:a_3491) : Boolean
      {
         var isBothWayShot:Boolean = false;
         if(null != stLastWaitShot)
         {
            isBothWayShot = false;
            if(a_1283 && m_numXSpeed > 0 || !a_1283 && m_numXSpeed < 0)
            {
               isBothWayShot = true;
            }
            stLastWaitShot.a_1797(0,15,a_1579,x,y,a_1583,stFieldGrid,isBothWayShot,a_1325);
            ApplyFireShotExtraProperty(stLastWaitShot);
            parent.addChild(stLastWaitShot);
            m_bActive.Value = false;
            this.a_3940();
            if(Boolean(a_1583) && a_1583.isOwnBattleField)
            {
               BattleFieldView.a_1029.play();
            }
            return true;
         }
         return false;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         a_1275 = 0;
         while(this.m_vLastMoveIntruder.length > 0)
         {
            this.m_vLastMoveIntruder.pop();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var numYMove:Number = NaN;
         if(m_isHited)
         {
            nextFrame();
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
         this.a_4351();
         if(x < 0 || x > BattleFieldView.a_1013)
         {
            this.a_3940();
            return;
         }
         if(a_1578)
         {
            if(!FollowingShotHandle())
            {
               return;
            }
         }
         x += m_numXSpeed;
         if(2 == a_1582 && y > a_1586 - a_3491.a_1081 * 0.9)
         {
            y += m_numYSpeed;
         }
         else if(3 == a_1582 && y < a_1586 + a_3491.a_1081 * 0.9)
         {
            y += m_numYSpeed;
         }
         else if(5 == a_1582 || 6 == a_1582)
         {
            y += m_numYSpeed;
         }
         if(7 == a_1582 && y > a_1586 - a_3491.a_1081 * 1.9)
         {
            y += m_numYSpeed;
         }
         else if(8 == a_1582 && y < a_1586 + a_3491.a_1081 * 1.9)
         {
            y += m_numYSpeed;
         }
         else if(a_1582 > 1)
         {
            a_1577 = true;
         }
         if(a_1576)
         {
            numYMove = 2 * m_numYSpeed * (iCurrentTime - a_1447) / a_1581 - m_numYSpeed;
            y += numYMove > 30 ? 30 : numYMove;
         }
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var iArrMoveIntruderLength:int = 0;
         var stFieldGrid:a_3491 = null;
         var numHotMultiplier:Number = NaN;
         var stLastWaitShot:a_4348 = null;
         var i:int = 0;
         var flag:Boolean = false;
         var j:int = 0;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var iYGridNo:int = m_iYGridNo;
         stFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == null)
         {
            return;
         }
         if(!a_1576 && a_1577 && a_1571 != iXGridNo && a_1584 != stFieldGrid && null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            a_1571 = iXGridNo;
            numHotMultiplier = stFieldGrid.m_stBaseAuxiliaryFighter.numHotMultiplier;
            if(numHotMultiplier > 1)
            {
               if(numHotMultiplier > a_1325)
               {
                  stLastWaitShot = JudgePassFireTower(stFieldGrid,numHotMultiplier);
                  if(this.addFireShot(stLastWaitShot,stFieldGrid))
                  {
                     return;
                  }
               }
            }
         }
         if(!a_1576 && !m_isShotHighSkySpace && (1 == stFieldGrid.m_iFieldGridType || 4 == stFieldGrid.m_iFieldGridType) && !m_isPenetrate)
         {
            m_isHited = true;
            this.a_3940();
            return;
         }
         if(stFieldGrid.m_isOccupy)
         {
            arrMoveIntruder = stFieldGrid.a_1511.slice();
            if(stFieldGrid.m_stCurrentBattbleFieldView.iIntruderMoveDirection > 0)
            {
               arrMoveIntruder.sortOn("x",Array.DESCENDING | Array.NUMERIC);
            }
            else
            {
               arrMoveIntruder.sortOn("x",Array.NUMERIC);
            }
            iArrMoveIntruderLength = int(arrMoveIntruder.length);
            for(i = 0; i < iArrMoveIntruderLength; i++)
            {
               stMoveIntruder = arrMoveIntruder[i];
               if(!stMoveIntruder.isCannotSeeByFighter && (!m_isShotHighSkySpace && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState && a_1576) || 3 == stMoveIntruder.iSpaceState && m_isShotHighSkySpace) && hitTestObject(stMoveIntruder))
               {
                  flag = false;
                  for(j = 0; j < this.m_vLastMoveIntruder.length; j++)
                  {
                     if(stMoveIntruder == this.m_vLastMoveIntruder[j])
                     {
                        flag = true;
                        break;
                     }
                  }
                  if(!flag)
                  {
                     if(Boolean(a_1583) && a_1583.isOwnBattleField)
                     {
                        BattleFieldView.a_1045.play();
                     }
                     a_4352(stMoveIntruder);
                     this.m_vLastMoveIntruder.push(stMoveIntruder);
                  }
               }
            }
         }
      }
   }
}

