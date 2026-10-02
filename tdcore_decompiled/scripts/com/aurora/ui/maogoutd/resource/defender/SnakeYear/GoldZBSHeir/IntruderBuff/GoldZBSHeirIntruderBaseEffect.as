package com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldZBSHeir.IntruderBuff
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   import flash.utils.Timer;
   
   public class GoldZBSHeirIntruderBaseEffect extends a_4108
   {
      
      public var stTargetMouveIntruder:a_4206;
      
      private var m_stTiemr:Timer;
      
      public function GoldZBSHeirIntruderBaseEffect()
      {
         a_1271 = true;
         super();
         this.m_stTiemr = new Timer(100);
         a_1279 = -22;
         m_iYDisplayCenterPos = -49;
      }
      
      public static function a_3926() : GoldZBSHeirIntruderBaseEffect
      {
         return PoolManager.getInstance().CheckOutOne(GoldZBSHeirIntruderBaseEffect) as GoldZBSHeirIntruderBaseEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldZBSHeirIntruderBaseEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
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
         if(this.stTargetMouveIntruder != null && Boolean(this.stTargetMouveIntruder.m_stGoldZBSBaseBurnEffect))
         {
            this.stTargetMouveIntruder.m_stGoldZBSBaseBurnEffect = null;
            this.stTargetMouveIntruder = null;
         }
         return true;
      }
   }
}

