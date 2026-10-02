package com.aurora.ui.maogoutd.resource.shot
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class a_4353 extends a_4348
   {
      
      public function a_4353()
      {
         super();
         a_1304 = b_183.b_190;
         a_1279 = 0;
         a_1573 = 1;
         a_1576 = false;
         a_1577 = false;
         a_1575 = true;
         a_1588 = false;
         a_1275 = 0;
         a_1587 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(a_4353) as a_4353;
      }
      
      override protected function getBindMovie() : Class
      {
         return CoffeeBottlePaoPaoShotMovie;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         nextFrame();
         if(a_1273 == 5 && !m_isHited)
         {
            this.a_4351();
         }
         if(a_1273 == a_1274)
         {
            a_3940();
            return;
         }
      }
      
      override protected function a_4351() : void
      {
         var i:int = 0;
         var j:int = 0;
         var stFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var iArrMoveIntruderLength:int = 0;
         var stMoveIntruder:a_4206 = null;
         var addCenter:Number = NaN;
         for(i = 0; i <= 4; i++)
         {
            if(!a_1283)
            {
               stFieldGrid = a_1583.a_3438(a_1584.m_iXGridNo + i,a_1584.m_iYGridNo);
            }
            else
            {
               stFieldGrid = a_1583.a_3438(a_1584.m_iXGridNo - i,a_1584.m_iYGridNo);
            }
            iArrMoveIntruderLength = 0;
            if(null != stFieldGrid && stFieldGrid.m_isOccupy)
            {
               addCenter = stFieldGrid.getStraightShotMultiplier();
               a_1325 = addCenter;
               arrMoveIntruder = stFieldGrid.a_1511.slice();
               iArrMoveIntruderLength = int(arrMoveIntruder.length);
               for(j = 0; j < iArrMoveIntruderLength; j++)
               {
                  stMoveIntruder = arrMoveIntruder[j];
                  if(0 == stMoveIntruder.iSpaceState)
                  {
                     a_4352(stMoveIntruder);
                     m_isHited = true;
                  }
               }
            }
         }
      }
   }
}

