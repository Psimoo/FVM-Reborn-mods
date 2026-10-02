package com.aurora.ui.maogoutd.resource.avatar.effects
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.avatar.BaseAvatarEffect;
   import flash.display.BlendMode;
   
   public class GodsShieldTopPrimaryEffect extends BaseAvatarEffect
   {
      
      public function GodsShieldTopPrimaryEffect()
      {
         this.blendMode = BlendMode.ADD;
         super();
      }
      
      public static function a_3926() : GodsShieldTopPrimaryEffect
      {
         return PoolManager.getInstance().CheckOutOne(GodsShieldTopPrimaryEffect) as GodsShieldTopPrimaryEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return GodsShieldTopPrimaryEffectMovie;
      }
   }
}

