package com.aurora.ui.maogoutd.resource.defender.TigerYear.BasketTiger
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class BasketTigerSecondBoomShot extends a_4348
   {
      
      private static var a_1591:Array = new Array();
      
      public function BasketTigerSecondBoomShot()
      {
         super();
         a_1279 = 0;
         a_1573 = 2;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         var stBasketTigerSecondBoomShot:BasketTigerSecondBoomShot = a_1591.pop();
         if(null == stBasketTigerSecondBoomShot)
         {
            stBasketTigerSecondBoomShot = new BasketTigerSecondBoomShot();
         }
         BattleFieldView.a_1018.play();
         return stBasketTigerSecondBoomShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return BasketTigerSecondBoomShotMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == a_1591.indexOf(this))
         {
            a_1591.push(this);
         }
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var stMoveIntrude:a_4206 = null;
         var arrMoveIntruder:Array = null;
         var iIntruderIndex:int = 0;
         var numDistance:Number = NaN;
         a_1588 = true;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         for(var i:int = iXGridNo; i < BattleFieldView.a_1011; i++)
         {
            stFieldGrid = a_1583.a_3438(i,m_iYGridNo);
            if(Boolean(stFieldGrid) && stFieldGrid.a_1511.length > 0)
            {
               arrMoveIntruder = stFieldGrid.a_1511;
               if(stFieldGrid.m_stCurrentBattbleFieldView.iIntruderMoveDirection > 0)
               {
                  arrMoveIntruder.sortOn("x",Array.DESCENDING | Array.NUMERIC);
               }
               else
               {
                  arrMoveIntruder.sortOn("x",Array.NUMERIC);
               }
               for(iIntruderIndex = 0; iIntruderIndex < stFieldGrid.a_1511.length; iIntruderIndex++)
               {
                  if((arrMoveIntruder[iIntruderIndex] as a_4206).iSpaceState == 0)
                  {
                     stMoveIntrude = arrMoveIntruder[0];
                     break;
                  }
               }
            }
            if(stMoveIntrude)
            {
               break;
            }
         }
         if(stMoveIntrude)
         {
            numDistance = Math.abs(stMoveIntrude.x - x) - 0.2 * stMoveIntrude.width;
            a_1581 = Math.abs(int(numDistance / m_numXSpeed));
            m_numYSpeed = 3 * a_3491.a_1081 / a_1581;
            if(numDistance < 2 * a_3491.a_1080)
            {
               if(a_1581 < 4)
               {
                  a_1581 = 4;
               }
               m_numYSpeed = a_3491.a_1081 * (m_iYGridNo + 0.6) / a_1581;
            }
            else
            {
               m_numYSpeed = 3 * a_3491.a_1081 / a_1581;
            }
         }
         return true;
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var iArrMoveIntruderLength:int = 0;
         var stMoveIntruder:a_4206 = null;
         var i:int = 0;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var iYGridNo:int = m_iYGridNo;
         if(x < 0 || x >= BattleFieldView.a_1013 || y > a_3491.a_1081 * m_iYGridNo)
         {
            trace("x < 0 || x >= BattleFieldView.ms_iBattleFieldWidth, HitTest failed. x:" + x + ", BattleFieldView.ms_iBattleFieldWidth:" + BattleFieldView.a_1013);
            this.a_3940();
            return;
         }
         stFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == null)
         {
            m_bActive.Value = false;
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
               if(!stMoveIntruder.isCannotSeeByFighter && 0 == stMoveIntruder.iSpaceState && hitTestObject(stMoveIntruder))
               {
                  if(Boolean(a_1583) && a_1583.isOwnBattleField)
                  {
                     BattleFieldView.a_1051.play();
                  }
                  if(!stMoveIntruder.iBoomIsReduceLife)
                  {
                     stMoveIntruder.a_4210();
                  }
                  else if(stMoveIntruder.iLifeValue - GetFinalDamage() <= 0)
                  {
                     if(!stMoveIntruder.isCannotSeeByInsurance)
                     {
                        stMoveIntruder.iDIYLife = 0;
                        stMoveIntruder.ShowBoomDieEffect();
                        stMoveIntruder.a_3432();
                     }
                     else
                     {
                        a_4352(stMoveIntruder);
                     }
                  }
                  else
                  {
                     a_4352(stMoveIntruder);
                  }
                  m_isHited = true;
                  if(a_1276.length > 0)
                  {
                     gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
                  }
                  this.a_4360(stFieldGrid,stMoveIntruder);
                  return;
               }
            }
         }
         if(a_1283)
         {
            stFieldGrid = a_1583.a_3438(iXGridNo + 1,iYGridNo);
         }
         else
         {
            stFieldGrid = a_1583.a_3438(iXGridNo - 1,iYGridNo);
         }
         if(null != stFieldGrid && stFieldGrid.m_isOccupy)
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
               if((0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState) && !stMoveIntruder.isCannotSeeByFighter && hitTestObject(stMoveIntruder))
               {
                  if(Boolean(a_1583) && a_1583.isOwnBattleField)
                  {
                     BattleFieldView.a_1051.play();
                  }
                  if(!stMoveIntruder.iBoomIsReduceLife)
                  {
                     stMoveIntruder.a_4210();
                  }
                  else if(stMoveIntruder.iLifeValue - GetFinalDamage() <= 0)
                  {
                     if(!stMoveIntruder.isCannotSeeByInsurance)
                     {
                        stMoveIntruder.iDIYLife = 0;
                        stMoveIntruder.ShowBoomDieEffect();
                        stMoveIntruder.a_3432();
                     }
                     else
                     {
                        a_4352(stMoveIntruder);
                     }
                  }
                  else
                  {
                     a_4352(stMoveIntruder);
                  }
                  m_isHited = true;
                  if(a_1276.length > 0)
                  {
                     gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
                  }
                  this.a_4360(stFieldGrid,stMoveIntruder);
                  return;
               }
            }
         }
      }
      
      private function a_4360(stHitenFieldGrid:a_3491, stHitenMouseIntruder:a_4206) : void
      {
         var stFieldGrid:a_3491 = null;
         var j:int = 0;
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         for(var i:int = stHitenFieldGrid.m_iXGridNo - 1; i <= stHitenFieldGrid.m_iXGridNo + 1; i++)
         {
            for(j = stHitenFieldGrid.m_iYGridNo - 1; j <= stHitenFieldGrid.m_iYGridNo + 1; j++)
            {
               stFieldGrid = a_1583.a_3438(i,j);
               if(null != stFieldGrid)
               {
                  arrMouveIntruder = stFieldGrid.a_1511.slice();
                  for each(stMouseIntruder in arrMouveIntruder)
                  {
                     if(stMouseIntruder != stHitenMouseIntruder && !stMouseIntruder.isCannotSeeByFighter && (0 == stMouseIntruder.iSpaceState || 3 == stMouseIntruder.iSpaceState))
                     {
                        if(!stMouseIntruder.iBoomIsReduceLife)
                        {
                           stMouseIntruder.a_4210();
                        }
                        else if(stMouseIntruder.iLifeValue - GetFinalDamage() <= 0)
                        {
                           if(!stMouseIntruder.isCannotSeeByInsurance)
                           {
                              stMouseIntruder.iDIYLife = 0;
                              stMouseIntruder.ShowBoomDieEffect();
                              stMouseIntruder.a_3432();
                           }
                           else
                           {
                              a_4352(stMouseIntruder);
                           }
                        }
                        else
                        {
                           a_4352(stMouseIntruder);
                        }
                     }
                  }
               }
            }
         }
      }
   }
}

