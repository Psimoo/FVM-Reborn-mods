package com.aurora.ui.maogoutd.resource.shot
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class a_4394 extends a_4348
   {
      
      private var a_1607:a_4206;
      
      public function a_4394()
      {
         super();
         a_1279 = -width * 0.5;
         a_1304 = b_183.b_196;
         a_1573 = 1;
         a_1578 = true;
         a_1588 = true;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(a_4394) as a_4394;
      }
      
      override protected function getBindMovie() : Class
      {
         return TakoyakiFollowShotMovie;
      }
      
      override protected function a_4351() : void
      {
         if(x <= 0 || x >= BattleFieldView.a_1013)
         {
            this.a_3940();
            return;
         }
         var stMoveIntruder:a_4206 = a_1583.a_3431();
         if(Boolean(stMoveIntruder) && hitTestObject(stMoveIntruder))
         {
            a_4352(stMoveIntruder);
            m_isHited = true;
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
         }
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.a_1607 = null;
         return true;
      }
   }
}

