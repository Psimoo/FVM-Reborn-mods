package com.aurora.ui.maogoutd.resource.avatar.effects
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.avatar.BaseAvatarEffect;
   import flash.display.BlendMode;
   
   public class GodsShieldTopIntermediateEffect extends BaseAvatarEffect
   {
      
      public function GodsShieldTopIntermediateEffect()
      {
         this.blendMode = BlendMode.ADD;
         super();
      }
      
      public static function a_3926() : GodsShieldTopIntermediateEffect
      {
         return PoolManager.getInstance().CheckOutOne(GodsShieldTopIntermediateEffect) as GodsShieldTopIntermediateEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return GodsShieldTopIntermediateEffectMovie;
      }
   }
}

