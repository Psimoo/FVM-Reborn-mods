package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   
   public class TroubleCleanUpArrowEffect extends a_3909
   {
      
      public function TroubleCleanUpArrowEffect()
      {
         super();
      }
      
      public static function a_3926() : TroubleCleanUpArrowEffect
      {
         return PoolManager.getInstance().CheckOutOne(TroubleCleanUpArrowEffect) as TroubleCleanUpArrowEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return TroubleCleanUpArrowEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         a_1279 = 13;
         m_iYDisplayCenterPos = 32;
         this.visible = true;
         gotoAndStop(1);
         return true;
      }
      
      public function GoUp() : void
      {
         gotoAndStop(3);
      }
      
      public function GoDown() : void
      {
         gotoAndStop(1);
      }
      
      public function GoLeft() : void
      {
         gotoAndStop(4);
      }
      
      public function GoRight() : void
      {
         gotoAndStop(2);
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
   }
}

