package com.aurora.ui.maogoutd.resource.avatar.effects
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.avatar.BaseAvatarEffect;
   import flash.display.BlendMode;
   
   public class GodsShieldBottomPrimaryEffect extends BaseAvatarEffect
   {
      
      public function GodsShieldBottomPrimaryEffect()
      {
         this.blendMode = BlendMode.ADD;
         super();
      }
      
      public static function a_3926() : GodsShieldBottomPrimaryEffect
      {
         return PoolManager.getInstance().CheckOutOne(GodsShieldBottomPrimaryEffect) as GodsShieldBottomPrimaryEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return GodsShieldBottomPrimaryEffectMovie;
      }
   }
}

