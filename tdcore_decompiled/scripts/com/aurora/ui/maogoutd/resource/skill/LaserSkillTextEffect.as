package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class LaserSkillTextEffect extends BaseSkillEffect
   {
      
      public function LaserSkillTextEffect()
      {
         a_1271 = true;
         super();
      }
      
      public static function a_3926() : LaserSkillTextEffect
      {
         return PoolManager.getInstance().CheckOutOne(LaserSkillTextEffect) as LaserSkillTextEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return LaserSkillTextEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean = false) : Boolean
      {
         a_1283 = isReseaved;
         this.visible = true;
         gotoAndStop(1);
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
         }
      }
   }
}

