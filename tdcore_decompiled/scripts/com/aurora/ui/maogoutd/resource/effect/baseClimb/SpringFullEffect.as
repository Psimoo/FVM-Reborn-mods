package com.aurora.ui.maogoutd.resource.effect.baseClimb
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class SpringFullEffect extends BaseClimbEffect
   {
      
      public function SpringFullEffect()
      {
         super();
         m_fClimbHeightEx.Value = 8;
         m_iClimbTickEx.Value = 30;
         m_fClimbWidthEx.Value = 2;
         m_bIsNeedParabola.Value = true;
      }
      
      public static function a_3926() : BaseClimbEffect
      {
         return PoolManager.getInstance().CheckOutOne(SpringFullEffect) as SpringFullEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return SpringFullEffectMovie;
      }
   }
}

