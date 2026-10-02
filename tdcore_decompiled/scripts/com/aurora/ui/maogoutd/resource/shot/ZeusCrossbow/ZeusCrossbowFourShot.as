package com.aurora.ui.maogoutd.resource.shot.ZeusCrossbow
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class ZeusCrossbowFourShot extends a_4348
   {
      
      private static var ms_stZeusCrossbowFourShotVector:Array = new Array();
      
      private var a_1607:a_4206;
      
      public var m_numSputteringRate:Number = 0;
      
      public var m_iShotBoundStopTime:int = 0;
      
      public function ZeusCrossbowFourShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1578 = true;
         a_1588 = true;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         var stZeusCrossbowFourShot:ZeusCrossbowFourShot = ms_stZeusCrossbowFourShotVector.pop();
         if(null == stZeusCrossbowFourShot)
         {
            stZeusCrossbowFourShot = new ZeusCrossbowFourShot();
         }
         BattleFieldView.a_1017.play();
         return stZeusCrossbowFourShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return ZeusCrossbowFourShotMovie;
      }
      
      override protected function a_4351() : void
      {
         var stMoveIntruder:a_4206 = null;
         var stFieldGrid:a_3491 = null;
         if(x <= 0 || x >= BattleFieldView.a_1013)
         {
            this.a_3940();
            return;
         }
         stMoveIntruder = a_1583.a_3431();
         if(Boolean(stMoveIntruder) && hitTestObject(stMoveIntruder))
         {
            stFieldGrid = stMoveIntruder.m_stCurrentFieldGrid;
            this.a_4352(stMoveIntruder);
            m_isHited = true;
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
            if(stFieldGrid)
            {
               this.a_4360(stFieldGrid,stMoveIntruder);
            }
         }
      }
      
      override public function a_4352(stBaseMoveIntruder:a_4206) : Boolean
      {
         super.a_4352(stBaseMoveIntruder);
         if(Boolean(this.m_iShotBoundStopTime > 0) && Boolean(stBaseMoveIntruder) && stBaseMoveIntruder.iLifeValue > 0)
         {
            if(Math.random() * 10 <= 3)
            {
               stBaseMoveIntruder.a_4208(b_182.a_435,this.m_iShotBoundStopTime);
            }
         }
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.a_1607 = null;
         if(-1 == ms_stZeusCrossbowFourShotVector.indexOf(this))
         {
            ms_stZeusCrossbowFourShotVector.push(this);
         }
         this.m_iShotBoundStopTime = 0;
         return true;
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
                     if(stMouseIntruder != stHitenMouseIntruder && !stMouseIntruder.isCannotSeeByFighter && (0 == stMouseIntruder.iSpaceState || 2 == stMouseIntruder.iSpaceState))
                     {
                        stMouseIntruder.a_4209(int(a_1579 * this.m_numSputteringRate));
                     }
                  }
               }
            }
         }
      }
   }
}

