package com.aurora.ui.maogoutd.resource.shot
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   import flash.utils.setTimeout;
   
   public class SmellyBeanCurdShot extends a_4348
   {
      
      private var a_1595:a_4206;
      
      private var a_1596:int = -1;
      
      public function SmellyBeanCurdShot()
      {
         super();
         a_1279 = -width * 0.8;
         a_1304 = b_183.enm_SmellyBeanCurdShot;
         a_1573 = 1;
         a_1576 = true;
         a_1588 = true;
      }
      
      public static function a_4344() : a_4348
      {
         var stSmellyBeanCurdShot:SmellyBeanCurdShot = PoolManager.getInstance().CheckOutOne(SmellyBeanCurdShot) as SmellyBeanCurdShot;
         BattleFieldView.a_1017.play();
         return stSmellyBeanCurdShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return SmellyBeanCurdShotMovie;
      }
      
      override protected function a_4349() : Boolean
      {
         super.a_4349();
         if(m_isSpecial > 0)
         {
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         a_1279 = -width * 0.8;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stCurrentFieldGrid:a_3491 = null;
         var stFieldGrid:a_3491 = null;
         var i:int = 0;
         var j:int = 0;
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         if(m_isHited && m_isSpecial > 0)
         {
            if(a_1283)
            {
               iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
            }
            else
            {
               iXGridNo = int(x / a_3491.a_1080);
            }
            iYGridNo = m_iYGridNo;
            if(this.a_1596 <= 0)
            {
               a_1275 = 2;
               gotoAndStop(3);
               this.a_1596 = setTimeout(this.a_3940,3000);
               x = a_3491.a_1080 * (iXGridNo + 0.5);
               if(a_1283)
               {
                  x = BattleFieldView.a_1013 - x;
               }
               y = a_3491.a_1081 * (iYGridNo + 0.5);
            }
            if(iCurrentTime % 2 == 0)
            {
               nextFrame();
            }
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            stCurrentFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
            if(Boolean(stCurrentFieldGrid) && iCurrentTime % 20 == 0)
            {
               for(i = stCurrentFieldGrid.m_iXGridNo - 1; i <= stCurrentFieldGrid.m_iXGridNo + 1; i++)
               {
                  for(j = stCurrentFieldGrid.m_iYGridNo - 1; j <= stCurrentFieldGrid.m_iYGridNo + 1; j++)
                  {
                     stFieldGrid = a_1583.a_3438(i,j);
                     if(null != stFieldGrid)
                     {
                        arrMouveIntruder = stFieldGrid.a_1511.slice();
                        for each(stMouseIntruder in arrMouveIntruder)
                        {
                           if(!stMouseIntruder.isCannotSeeByFighter && (0 == stMouseIntruder.iSpaceState || 2 == stMouseIntruder.iSpaceState))
                           {
                              stMouseIntruder.a_4209(m_isSpecial);
                           }
                        }
                     }
                  }
               }
            }
            return;
         }
         if(m_isSpecial > 0)
         {
            a_1275 = 1;
            a_1587 = 1;
         }
         else
         {
            a_1275 = 0;
            a_1587 = 0;
         }
         super.a_4216(iCurrentTime);
      }
      
      override public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         super.a_4352(baseMoveIntruder);
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.a_1595 = null;
         this.a_1596 = -1;
         return true;
      }
   }
}

