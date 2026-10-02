package com.aurora.ui.maogoutd.resource.tools
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   
   public class a_4448 extends a_3909
   {
      
      public function a_4448()
      {
         super();
      }
      
      public static function a_3926() : a_4448
      {
         return PoolManager.getInstance().CheckOutOne(a_4448,WaterWaveMovie) as a_4448;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         if(BattleFieldView.lastMouseMoveIntruder != null)
         {
            BattleFieldView.lastMouseMoveIntruder.m_stWaterEffect = this;
         }
         a_1275 = 1;
         gotoAndStop(1);
         this.visible = true;
         return true;
      }
      
      override public function nextFrame() : void
      {
         super.nextFrame();
         if(a_1278 != null || a_1273 == a_1274)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
      
      public function a_3940() : Boolean
      {
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
   }
}

