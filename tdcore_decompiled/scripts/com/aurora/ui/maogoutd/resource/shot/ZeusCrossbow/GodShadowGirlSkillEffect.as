package com.aurora.ui.maogoutd.resource.shot.ZeusCrossbow
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkillEffect;
   
   public class GodShadowGirlSkillEffect extends BaseSkillEffect
   {
      
      public function GodShadowGirlSkillEffect()
      {
         super();
      }
      
      public static function a_3926() : GodShadowGirlSkillEffect
      {
         return PoolManager.getInstance().CheckOutOne(GodShadowGirlSkillEffect) as GodShadowGirlSkillEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return GodShadowGirlSkillEffectMovie;
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

