package com.aurora.ui.maogoutd.resource.avatar.effects
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.avatar.BaseAvatarEffect;
   import flash.display.BlendMode;
   
   public class GodsShieldBottomNoneEffect extends BaseAvatarEffect
   {
      
      public function GodsShieldBottomNoneEffect()
      {
         this.blendMode = BlendMode.ADD;
         super();
      }
      
      public static function a_3926() : GodsShieldBottomNoneEffect
      {
         return PoolManager.getInstance().CheckOutOne(GodsShieldBottomNoneEffect) as GodsShieldBottomNoneEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return GodsShieldBottomNoneEffectMovie;
      }
   }
}

