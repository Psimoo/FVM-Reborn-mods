package com.aurora.ui.maogoutd.resource.shot.scorpio
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class ScorpioShot extends a_4348
   {
      
      private static var ms_arrScorpioShot:Array = new Array();
      
      public function ScorpioShot()
      {
         super();
         a_1304 = 65564;
         a_1279 = 0;
         a_1573 = 1;
         a_1587 = 1;
         a_1576 = false;
         a_1577 = false;
         a_1575 = true;
         a_1588 = false;
         a_1275 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var stScorpioShot:ScorpioShot = ms_arrScorpioShot.pop();
         if(null == stScorpioShot)
         {
            stScorpioShot = new ScorpioShot();
         }
         return stScorpioShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return ScorpioShotMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_arrScorpioShot.indexOf(this))
         {
            ms_arrScorpioShot.push(this);
         }
         return true;
      }
      
      override public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         var stFieldGrid:a_3491 = baseMoveIntruder.m_stCurrentFieldGrid;
         super.a_4352(baseMoveIntruder);
         if(stFieldGrid)
         {
            this.a_4360(stFieldGrid,baseMoveIntruder);
         }
         return true;
      }
      
      private function a_4360(stHitenFieldGrid:a_3491, stHitenMouseIntruder:a_4206) : void
      {
         var stFieldGrid:a_3491 = null;
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         var j:int = stHitenFieldGrid.m_iYGridNo;
         for(var i:int = stHitenFieldGrid.m_iXGridNo; i <= stHitenFieldGrid.m_iXGridNo + 3; i++)
         {
            stFieldGrid = a_1583.a_3438(i,j);
            if(null != stFieldGrid)
            {
               arrMouveIntruder = stFieldGrid.a_1511.slice();
               for each(stMouseIntruder in arrMouveIntruder)
               {
                  if(stMouseIntruder != stHitenMouseIntruder && !stMouseIntruder.isCannotSeeByFighter && (0 == stMouseIntruder.iSpaceState || 2 == stMouseIntruder.iSpaceState))
                  {
                     stMouseIntruder.a_4209(a_1579);
                  }
               }
            }
         }
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         var arrMoveIntruder:Array = null;
         var iArrMoveIntruderLength:int = 0;
         var stMoveIntruder:a_4206 = null;
         var i:int = 0;
         iXGridNo = Math.ceil(x / a_3491.a_1080);
         var iYGridNo:int = m_iYGridNo;
         var stFieldGrid:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(Boolean(stFieldGrid) && stFieldGrid.m_isOccupy)
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
                  if(Boolean(a_1583) && a_1583.isOwnBattleField)
                  {
                     BattleFieldView.a_1045.play();
                  }
                  this.a_4352(stMoveIntruder);
                  m_isHited = true;
                  if(a_1276.length > 0)
                  {
                     gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
                  }
                  return;
               }
            }
         }
      }
   }
}

