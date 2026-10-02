package com.aurora.ui.maogoutd.resource.avatar.effects
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.avatar.BaseAvatarEffect;
   import flash.display.BlendMode;
   
   public class GodsShieldBottomAdvancedEffect extends BaseAvatarEffect
   {
      
      public function GodsShieldBottomAdvancedEffect()
      {
         this.blendMode = BlendMode.ADD;
         super();
      }
      
      public static function a_3926() : GodsShieldBottomAdvancedEffect
      {
         return PoolManager.getInstance().CheckOutOne(GodsShieldBottomAdvancedEffect) as GodsShieldBottomAdvancedEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return GodsShieldBottomAdvancedEffectMovie;
      }
   }
}

