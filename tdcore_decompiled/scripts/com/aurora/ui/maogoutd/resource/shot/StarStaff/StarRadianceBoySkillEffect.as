package com.aurora.ui.maogoutd.resource.shot.StarStaff
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkillEffect;
   
   public class StarRadianceBoySkillEffect extends BaseSkillEffect
   {
      
      public function StarRadianceBoySkillEffect()
      {
         super();
      }
      
      public static function a_3926() : StarRadianceBoySkillEffect
      {
         return PoolManager.getInstance().CheckOutOne(StarRadianceBoySkillEffect) as StarRadianceBoySkillEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return StarRadianceBoySkillEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean = false) : Boolean
      {
         a_1283 = isReseaved;
         this.visible = true;
         gotoAndStop(1);
         if(parent)
         {
            parent.removeChild(this);
         }
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

