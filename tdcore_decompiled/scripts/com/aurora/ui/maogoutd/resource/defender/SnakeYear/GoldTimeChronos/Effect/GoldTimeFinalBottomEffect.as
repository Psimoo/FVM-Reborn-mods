package com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldTimeChronos.Effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldTimeChronos.GoldTimeFinalEffectManager;
   import flash.display.FrameLabel;
   
   public class GoldTimeFinalBottomEffect extends a_3909
   {
      
      public function GoldTimeFinalBottomEffect()
      {
         super();
         a_1279 = -108;
         m_iYDisplayCenterPos = -108;
      }
      
      public static function a_3926() : GoldTimeFinalBottomEffect
      {
         return PoolManager.getInstance().CheckOutOne(GoldTimeFinalBottomEffect) as GoldTimeFinalBottomEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldTimeFinalBottomEffectMovie;
      }
      
      public function a_1797(isReserved:Boolean) : Boolean
      {
         this.visible = true;
         scaleX = scaleY = 1;
         a_1283 = isReserved;
         a_1275 = 1;
         gotoAndStop(1);
         return true;
      }
      
      public function a_4140(iTimeInterval:int) : void
      {
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
      
      public function ShowPlayAnimation(startIndex:int, loopIndex:int) : void
      {
         if(a_1275 != loopIndex && startIndex != a_1273)
         {
            a_1275 = loopIndex;
            gotoAndStop((a_1276[startIndex] as FrameLabel).frame);
         }
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         GoldTimeFinalEffectManager.instance.removeEffect(this);
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
   }
}

