package com.aurora.ui.maogoutd.resource.shot
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class a_4400 extends a_4348
   {
      
      public function a_4400()
      {
         super();
         a_1279 = -width * 0.5;
         a_1304 = b_183.b_186;
         a_1573 = 1;
         a_1576 = true;
         m_isSpecial = 0;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(a_4400) as a_4400;
      }
      
      override protected function getBindMovie() : Class
      {
         return TomatoShotMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         m_isSpecial = 0;
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
         for(var i:int = stHitenFieldGrid.m_iXGridNo; i <= stHitenFieldGrid.m_iXGridNo + 2; i++)
         {
            stFieldGrid = a_1583.a_3438(i,j);
            if(null != stFieldGrid)
            {
               arrMouveIntruder = stFieldGrid.a_1511.slice();
               for each(stMouseIntruder in arrMouveIntruder)
               {
                  if(stMouseIntruder != stHitenMouseIntruder && !stMouseIntruder.isCannotSeeByFighter && (0 == stMouseIntruder.iSpaceState || 2 == stMouseIntruder.iSpaceState))
                  {
                     if(m_isSpecial == 0)
                     {
                        stMouseIntruder.a_4209(int(a_1579 * 0.5));
                     }
                     else
                     {
                        stMouseIntruder.a_4209(int(a_1579 * 0.8));
                     }
                  }
               }
            }
         }
      }
   }
}

