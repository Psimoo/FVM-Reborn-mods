package com.aurora.ui.maogoutd.resource.shot.StarStaff
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkillEffect;
   
   public class StarRadianceBianShengEffect extends BaseSkillEffect
   {
      
      public function StarRadianceBianShengEffect()
      {
         super();
      }
      
      public static function a_3926() : StarRadianceBianShengEffect
      {
         return PoolManager.getInstance().CheckOutOne(StarRadianceBianShengEffect) as StarRadianceBianShengEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return StarRadianceBianShengEffectMovie;
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

