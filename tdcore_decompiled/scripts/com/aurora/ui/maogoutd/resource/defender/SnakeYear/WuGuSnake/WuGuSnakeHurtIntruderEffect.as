package com.aurora.ui.maogoutd.resource.defender.SnakeYear.WuGuSnake
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class WuGuSnakeHurtIntruderEffect extends a_4108
   {
      
      public var stTargetMouveIntruder:a_4206;
      
      public function WuGuSnakeHurtIntruderEffect()
      {
         a_1271 = true;
         super();
         a_1279 = -41;
         m_iYDisplayCenterPos = -43;
      }
      
      public static function a_3926() : WuGuSnakeHurtIntruderEffect
      {
         return PoolManager.getInstance().CheckOutOne(WuGuSnakeHurtIntruderEffect) as WuGuSnakeHurtIntruderEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return WuGuSnakeHurtIntruderEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         if(this.stTargetMouveIntruder)
         {
            this.stTargetMouveIntruder.m_stWuGuSnakeHurtIntruderEffect = this;
         }
         play();
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         if(this.stTargetMouveIntruder != null)
         {
            this.stTargetMouveIntruder.m_stWuGuSnakeHurtIntruderEffect = null;
            this.stTargetMouveIntruder = null;
         }
         return true;
      }
   }
}

