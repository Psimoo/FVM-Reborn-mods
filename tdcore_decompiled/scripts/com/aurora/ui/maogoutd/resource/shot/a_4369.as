package com.aurora.ui.maogoutd.resource.shot
{
   import a_4718.b_182;
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class a_4369 extends a_4348
   {
      
      private var a_1595:a_4206;
      
      private var a_1596:int;
      
      public function a_4369()
      {
         super();
         a_1279 = -width * 0.8;
         a_1304 = b_183.b_192;
         a_1573 = 1;
         a_1576 = true;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(a_4369) as a_4369;
      }
      
      override protected function getBindMovie() : Class
      {
         return MealieShotMovie;
      }
      
      override protected function a_4349() : Boolean
      {
         super.a_4349();
         if(1 == m_isSpecial || 3 == m_isSpecial)
         {
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         a_1279 = -width * 0.8;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited && (1 == m_isSpecial || 3 == m_isSpecial))
         {
            if(a_1273 != 3)
            {
               gotoAndStop(3);
               this.a_1596 = setTimeout(this.a_3940,4000 + (m_isSpecial == 3 ? 3000 : 0));
            }
            if(Boolean(this.a_1595) && !this.a_1595.visible)
            {
               if(this.a_1596 > 0)
               {
                  clearTimeout(this.a_1596);
               }
               this.a_3940();
            }
            return;
         }
         super.a_4216(iCurrentTime);
      }
      
      override public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         super.a_4352(baseMoveIntruder);
         if(1 == m_isSpecial || 3 == m_isSpecial)
         {
            if(m_isSpecial == 1)
            {
               baseMoveIntruder.a_4208(b_182.a_435,40);
            }
            else
            {
               baseMoveIntruder.a_4208(b_182.a_435,70);
            }
            this.a_1595 = baseMoveIntruder;
         }
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

