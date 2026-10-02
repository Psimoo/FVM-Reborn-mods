package com.aurora.ui.maogoutd.resource.avatar.effects
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.avatar.BaseAvatarEffect;
   import flash.display.BlendMode;
   
   public class GodsShieldBottomIntermediateEffect extends BaseAvatarEffect
   {
      
      public function GodsShieldBottomIntermediateEffect()
      {
         this.blendMode = BlendMode.ADD;
         super();
      }
      
      public static function a_3926() : GodsShieldBottomIntermediateEffect
      {
         return PoolManager.getInstance().CheckOutOne(GodsShieldBottomIntermediateEffect) as GodsShieldBottomIntermediateEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return GodsShieldBottomIntermediateEffectMovie;
      }
   }
}

