package com.aurora.ui.maogoutd.resource.avatar.effects
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.avatar.BaseAvatarEffect;
   import flash.display.BlendMode;
   
   public class GodsShieldTopAdvancedEffect extends BaseAvatarEffect
   {
      
      public function GodsShieldTopAdvancedEffect()
      {
         this.blendMode = BlendMode.ADD;
         super();
      }
      
      public static function a_3926() : GodsShieldTopAdvancedEffect
      {
         return PoolManager.getInstance().CheckOutOne(GodsShieldTopAdvancedEffect) as GodsShieldTopAdvancedEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return GodsShieldTopAdvancedEffectMovie;
      }
   }
}

