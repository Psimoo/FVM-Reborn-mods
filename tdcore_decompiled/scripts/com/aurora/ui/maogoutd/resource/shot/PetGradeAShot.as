package com.aurora.ui.maogoutd.resource.shot
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class PetGradeAShot extends a_4348
   {
      
      public function PetGradeAShot()
      {
         super();
         a_1279 = -60;
         a_1573 = 2;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         var _loc_1:* = PoolManager.getInstance().CheckOutOne(PetGradeAShot) as PetGradeAShot;
         BattleFieldView.a_1018.play();
         return _loc_1;
      }
      
      override protected function getBindMovie() : Class
      {
         return PetGradeAShotMovie;
      }
      
      override protected function a_4351() : void
      {
         var _loc_6:a_4206 = null;
         var _loc_3:* = undefined;
         var _loc_1:int = 0;
         var _loc_4:Array = null;
         var _loc_5:int = 0;
         _loc_6 = null;
         var _loc_7:int = 0;
         if(a_1283)
         {
            _loc_1 = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            _loc_1 = int(x / a_3491.a_1080);
         }
         var _loc_2:* = m_iYGridNo;
         if(x < 0 || x >= BattleFieldView.a_1013 || y > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            trace("x < 0 || x >= BattleFieldView.ms_iBattleFieldWidth, HitTest failed. x:" + x + ", BattleFieldView.ms_iBattleFieldWidth:" + BattleFieldView.a_1013);
            this.a_3940();
            return;
         }
         _loc_3 = a_1583.a_3438(_loc_1,_loc_2);
         if(_loc_3.m_isOccupy)
         {
            _loc_4 = _loc_3.a_1511.slice();
            if(_loc_3.m_stCurrentBattbleFieldView.iIntruderMoveDirection > 0)
            {
               _loc_4.sortOn("x",Array.DESCENDING | Array.NUMERIC);
            }
            else
            {
               _loc_4.sortOn("x",Array.NUMERIC);
            }
            _loc_5 = int(_loc_4.length);
            _loc_7 = 0;
            while(_loc_7 < _loc_5)
            {
               _loc_6 = _loc_4[_loc_7];
               if((_loc_6.iSpaceState == 0 || _loc_6.iSpaceState == 2) && !_loc_6.isCannotSeeByFighter && hitTestObject(_loc_6))
               {
                  if(Boolean(a_1583) && a_1583.isOwnBattleField)
                  {
                     BattleFieldView.a_1051.play();
                  }
                  a_4352(_loc_6);
                  m_isHited = true;
                  if(a_1276.length > 0)
                  {
                     gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
                  }
                  this.a_4360(_loc_3,_loc_6);
                  return;
               }
               _loc_7++;
            }
         }
         if(a_1283)
         {
            _loc_3 = a_1583.a_3438(_loc_1 + 1,_loc_2);
         }
         else
         {
            _loc_3 = a_1583.a_3438(_loc_1 - 1,_loc_2);
         }
         if(_loc_3 != null && Boolean(_loc_3.m_isOccupy))
         {
            _loc_4 = _loc_3.a_1511.slice();
            if(_loc_3.m_stCurrentBattbleFieldView.iIntruderMoveDirection > 0)
            {
               _loc_4.sortOn("x",Array.DESCENDING | Array.NUMERIC);
            }
            else
            {
               _loc_4.sortOn("x",Array.NUMERIC);
            }
            _loc_5 = int(_loc_4.length);
            _loc_7 = 0;
            while(_loc_7 < _loc_5)
            {
               _loc_6 = _loc_4[_loc_7];
               if((_loc_6.iSpaceState == 0 || _loc_6.iSpaceState == 2) && !_loc_6.isCannotSeeByFighter && hitTestObject(_loc_6))
               {
                  if(Boolean(a_1583) && a_1583.isOwnBattleField)
                  {
                     BattleFieldView.a_1051.play();
                  }
                  a_4352(_loc_6);
                  m_isHited = true;
                  if(a_1276.length > 0)
                  {
                     gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
                  }
                  this.a_4360(_loc_3,_loc_6);
                  return;
               }
               _loc_7++;
            }
         }
      }
      
      private function a_4360(stFieldGrid:a_3491, stBaseMoveIntruder:a_4206) : void
      {
         var _loc_3:a_3491 = null;
         var _loc_5:int = 0;
         var _loc_6:Array = null;
         var _loc_7:a_4206 = null;
         var _loc_4:* = stFieldGrid.m_iXGridNo - 1;
         while(_loc_4 <= stFieldGrid.m_iXGridNo + 1)
         {
            _loc_5 = stFieldGrid.m_iYGridNo - 1;
            while(_loc_5 <= stFieldGrid.m_iYGridNo + 1)
            {
               _loc_3 = a_1583.a_3438(_loc_4,_loc_5);
               if(_loc_3 != null)
               {
                  _loc_6 = _loc_3.a_1511.slice();
                  for each(_loc_7 in _loc_6)
                  {
                     if(_loc_7 != stBaseMoveIntruder && !_loc_7.isCannotSeeByFighter && (_loc_7.iSpaceState == 0 || _loc_7.iSpaceState == 2))
                     {
                        _loc_7.a_4209(int(a_1579 * 0.25));
                     }
                  }
               }
               _loc_5++;
            }
            _loc_4++;
         }
      }
   }
}

