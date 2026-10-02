package com.aurora.ui.maogoutd.resource.shot
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class EggPiscesFirstTransShot extends a_4348
   {
      
      private static var a_1591:Array = new Array();
      
      public function EggPiscesFirstTransShot()
      {
         super();
         a_1304 = 65540;
         a_1573 = 2;
         a_1279 = -60;
         a_1574 = 100;
         a_1576 = true;
         a_1588 = true;
         a_1587 = 1;
         a_1275 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1018.play();
         return PoolManager.getInstance().CheckOutOne(EggPiscesFirstTransShot) as EggPiscesFirstTransShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return EggPiscesFirstTransShotMovie;
      }
      
      override protected function a_4351() : void
      {
         var stMoveIntruder:a_4206 = null;
         var stFieldGrid:a_3491 = null;
         var iMoveIntruderID:int = 0;
         var iXGridNo:int = 0;
         var iArrMoveIntruderLength:int = 0;
         stMoveIntruder = null;
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
         var arrMoveIntruder:Array = null;
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
            for(iMoveIntruderID = 0; iMoveIntruderID < iArrMoveIntruderLength; iMoveIntruderID++)
            {
               stMoveIntruder = arrMoveIntruder[iMoveIntruderID];
               if((stMoveIntruder.iSpaceState == 0 || stMoveIntruder.iSpaceState == 2) && !stMoveIntruder.isCannotSeeByFighter && hitTestObject(stMoveIntruder))
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
         if(stFieldGrid != null && stFieldGrid.m_isOccupy)
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
            for(iMoveIntruderID = 0; iMoveIntruderID < iArrMoveIntruderLength; iMoveIntruderID++)
            {
               stMoveIntruder = arrMoveIntruder[iMoveIntruderID];
               if((stMoveIntruder.iSpaceState == 0 || stMoveIntruder.iSpaceState == 2) && !stMoveIntruder.isCannotSeeByFighter && hitTestObject(stMoveIntruder))
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
         var iYGridNoID:int = 0;
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         var iXGridNoID:int = stHitenFieldGrid.m_iXGridNo - 1;
         while(iXGridNoID <= stHitenFieldGrid.m_iXGridNo + 1)
         {
            iYGridNoID = stHitenFieldGrid.m_iYGridNo - 1;
            while(iYGridNoID <= stHitenFieldGrid.m_iYGridNo + 1)
            {
               stFieldGrid = a_1583.a_3438(iXGridNoID,iYGridNoID);
               if(stFieldGrid != null)
               {
                  arrMouveIntruder = stFieldGrid.a_1511.slice();
                  for each(stMouseIntruder in arrMouveIntruder)
                  {
                     if(stMouseIntruder != stHitenMouseIntruder && !stMouseIntruder.isCannotSeeByFighter && (stMouseIntruder.iSpaceState == 0 || stMouseIntruder.iSpaceState == 2))
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
               iYGridNoID++;
            }
            iXGridNoID++;
         }
      }
   }
}

