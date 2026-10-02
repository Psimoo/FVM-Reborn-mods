package com.aurora.ui.maogoutd.resource.shot
{
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class HorizontalSprayPotLinePaoPaoShot extends a_4348
   {
      
      private static var a_1589:Array = new Array();
      
      public function HorizontalSprayPotLinePaoPaoShot()
      {
         super();
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
         var stHorizontalSprayPotLinePaoPaoShot:HorizontalSprayPotLinePaoPaoShot = a_1589.pop();
         if(null == stHorizontalSprayPotLinePaoPaoShot)
         {
            stHorizontalSprayPotLinePaoPaoShot = new HorizontalSprayPotLinePaoPaoShot();
         }
         return stHorizontalSprayPotLinePaoPaoShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return HorizontalSprayPotLinePaoPaoShotMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == a_1589.indexOf(this))
         {
            a_1589.push(this);
         }
         return true;
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
            this.a_3940();
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

