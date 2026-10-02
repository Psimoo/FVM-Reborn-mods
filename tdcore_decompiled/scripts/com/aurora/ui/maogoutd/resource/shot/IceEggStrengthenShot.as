package com.aurora.ui.maogoutd.resource.shot
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class IceEggStrengthenShot extends a_4348
   {
      
      private static var a_1591:Array = new Array();
      
      public function IceEggStrengthenShot()
      {
         super();
         a_1279 = -60;
         a_1573 = 2;
         a_1574 = 100;
         a_1576 = true;
         a_1588 = true;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         var stIceEggStrengthenShot:IceEggStrengthenShot = a_1591.pop();
         if(null == stIceEggStrengthenShot)
         {
            stIceEggStrengthenShot = new IceEggStrengthenShot();
         }
         BattleFieldView.a_1018.play();
         return stIceEggStrengthenShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return IceEggStrengthenShotMovie;
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
         if(x < 0 || x >= BattleFieldView.a_1013 || y > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            trace("x < 0 || x >= BattleFieldView.ms_iBattleFieldWidth, HitTest failed. x:" + x + ", BattleFieldView.ms_iBattleFieldWidth:" + BattleFieldView.a_1013);
            this.a_3940();
            return;
         }
         stFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
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
               if((0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState) && !stMoveIntruder.isCannotSeeByFighter && hitTestObject(stMoveIntruder))
               {
                  if(Boolean(a_1583) && a_1583.isOwnBattleField)
                  {
                     BattleFieldView.a_1051.play();
                  }
                  a_4352(stMoveIntruder);
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
                  a_4352(stMoveIntruder);
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
         for(var i:int = stHitenFieldGrid.m_iXGridNo - 2; i <= stHitenFieldGrid.m_iXGridNo + 2; i++)
         {
            for(j = stHitenFieldGrid.m_iYGridNo - 2; j <= stHitenFieldGrid.m_iYGridNo + 2; j++)
            {
               stFieldGrid = a_1583.a_3438(i,j);
               if(null != stFieldGrid)
               {
                  arrMouveIntruder = stFieldGrid.a_1511.slice();
                  for each(stMouseIntruder in arrMouveIntruder)
                  {
                     if(stMouseIntruder != stHitenMouseIntruder && !stMouseIntruder.isCannotSeeByFighter && (0 == stMouseIntruder.iSpaceState || 2 == stMouseIntruder.iSpaceState))
                     {
                        stMouseIntruder.a_4209(int(a_1579 * 0.25));
                        if(a_1573 > 0)
                        {
                           stMouseIntruder.a_4208(b_182.a_432,a_1573);
                        }
                        if(a_1574 > 0)
                        {
                           if(stMouseIntruder.iArmorLifeValue <= 0 || a_1576)
                           {
                              stMouseIntruder.a_4208(b_182.a_433,a_1574 * a_1326);
                           }
                        }
                     }
                  }
               }
            }
         }
      }
   }
}

