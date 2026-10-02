package com.aurora.ui.maogoutd.resource.effect.baseClimb
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class SpringDestroyEffect extends BaseClimbEffect
   {
      
      public function SpringDestroyEffect()
      {
         super();
         m_fClimbHeightEx.Value = 8;
         m_iClimbTickEx.Value = 30;
         m_fClimbWidthEx.Value = 1.5;
         m_bIsNeedParabola.Value = true;
      }
      
      public static function a_3926() : BaseClimbEffect
      {
         return PoolManager.getInstance().CheckOutOne(SpringDestroyEffect) as SpringDestroyEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return SpringDestroyEffectMovie;
      }
   }
}

