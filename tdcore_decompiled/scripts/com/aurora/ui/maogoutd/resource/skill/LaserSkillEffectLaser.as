package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import flash.display.FrameLabel;
   
   public class LaserSkillEffectLaser extends BaseSkillEffect
   {
      
      public function LaserSkillEffectLaser()
      {
         a_1271 = true;
         super();
      }
      
      public static function a_3926() : LaserSkillEffectLaser
      {
         return PoolManager.getInstance().CheckOutOne(LaserSkillEffectLaser) as LaserSkillEffectLaser;
      }
      
      override protected function getBindMovie() : Class
      {
         return LaserSkillEffectLaserMovie;
      }
      
      public function a_1797(isReseaved:Boolean = false) : Boolean
      {
         a_1283 = isReseaved;
         this.visible = true;
         gotoAndStop(1);
         a_1275 = 1;
         return true;
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      public function OnTimeInterval(iTimeNum:uint) : void
      {
         if(iTimeNum % 2 == 0)
         {
            nextFrame();
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1273 == a_1274)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         x += 28;
      }
   }
}

