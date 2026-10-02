package com.aurora.ui.maogoutd.resource.avatar.effects
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.avatar.BaseAvatarEffect;
   import flash.display.BlendMode;
   
   public class GodsShieldTopNoneEffect extends BaseAvatarEffect
   {
      
      public function GodsShieldTopNoneEffect()
      {
         this.blendMode = BlendMode.ADD;
         super();
      }
      
      public static function a_3926() : GodsShieldTopNoneEffect
      {
         return PoolManager.getInstance().CheckOutOne(GodsShieldTopNoneEffect) as GodsShieldTopNoneEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return GodsShieldTopNoneEffectMovie;
      }
   }
}

