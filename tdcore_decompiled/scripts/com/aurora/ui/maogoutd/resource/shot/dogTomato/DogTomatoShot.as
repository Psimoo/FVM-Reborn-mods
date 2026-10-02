package com.aurora.ui.maogoutd.resource.shot.dogTomato
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class DogTomatoShot extends a_4348
   {
      
      private static var a_1609:Array = new Array();
      
      public function DogTomatoShot()
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
         var stTomatoShot:DogTomatoShot = a_1609.pop();
         if(null == stTomatoShot)
         {
            stTomatoShot = new DogTomatoShot();
         }
         BattleFieldView.a_1017.play();
         return stTomatoShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return DogTomatoShotMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == a_1609.indexOf(this))
         {
            a_1609.push(this);
         }
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
         var j:int = 0;
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         for(var i:int = stHitenFieldGrid.m_iXGridNo - 1; i <= stHitenFieldGrid.m_iXGridNo + 1; i++)
         {
            for(j = stHitenFieldGrid.m_iYGridNo - 1; j <= stHitenFieldGrid.m_iYGridNo + 2; j++)
            {
               stFieldGrid = a_1583.a_3438(i,j);
               if(null != stFieldGrid)
               {
                  if(!(j == stHitenFieldGrid.m_iYGridNo + 2 && i != stHitenFieldGrid.m_iXGridNo))
                  {
                     arrMouveIntruder = stFieldGrid.a_1511.slice();
                     for each(stMouseIntruder in arrMouveIntruder)
                     {
                        if(stMouseIntruder != stHitenMouseIntruder && !stMouseIntruder.isCannotSeeByFighter && (0 == stMouseIntruder.iSpaceState || 2 == stMouseIntruder.iSpaceState))
                        {
                           stMouseIntruder.a_4209(int(a_1579 * 0.35));
                        }
                     }
                  }
               }
            }
         }
      }
   }
}

