package com.aurora.ui.maogoutd.resource.Intruder.newMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4135;
   import flash.events.Event;
   import flash.utils.setTimeout;
   
   public class WindmillFishMouseRoadBlock extends a_4135
   {
      
      public function WindmillFishMouseRoadBlock()
      {
         super();
      }
      
      public static function a_3926() : WindmillFishMouseRoadBlock
      {
         return PoolManager.getInstance().CheckOutOne(WindmillFishMouseRoadBlock) as WindmillFishMouseRoadBlock;
      }
      
      override protected function getBindMovie() : Class
      {
         return WindmillFishMouseRoadBlockMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         if(m_stCurrentFieldGrid != null)
         {
            timerout = setTimeout(ClearPigBarrierField,60 * 1000,m_stCurrentFieldGrid);
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
         if(a_1273 == a_1274)
         {
            stop();
         }
      }
   }
}

