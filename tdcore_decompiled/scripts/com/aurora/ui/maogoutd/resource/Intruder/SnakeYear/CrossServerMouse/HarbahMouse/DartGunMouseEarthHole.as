package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.CrossServerMouse.HarbahMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4135;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.utils.setTimeout;
   
   public class DartGunMouseEarthHole extends a_4135
   {
      
      public function DartGunMouseEarthHole()
      {
         super();
      }
      
      public static function a_3926() : DartGunMouseEarthHole
      {
         return PoolManager.getInstance().CheckOutOne(DartGunMouseEarthHole) as DartGunMouseEarthHole;
      }
      
      override protected function getBindMovie() : Class
      {
         return DartGunMouseEarthHoleMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         if(m_stCurrentFieldGrid != null)
         {
            timerout = setTimeout(ClearPigBarrierField,8 * 1000,m_stCurrentFieldGrid);
            a_3502(m_stCurrentFieldGrid);
         }
         return true;
      }
      
      protected function ClearZombieBarrierField(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(stFieldGrid.m_stMouseEarthHole)
         {
            stFieldGrid.m_stMouseEarthHole.a_3940();
            stFieldGrid.m_stMouseEarthHole = null;
         }
         if(stFieldGrid.m_stBaseLander != null)
         {
            stFieldGrid.m_stBaseLander.a_3940();
            stFieldGrid.m_stBaseLander = null;
         }
         if(stFieldGrid.m_iFieldGridType == 1)
         {
            stFieldGrid.m_iFieldGridType = 0;
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == (a_1276[0] as FrameLabel).frame)
         {
            a_1275 = 1;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(a_1273 == a_1274)
         {
            a_1275 = 1;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
      }
   }
}

