package com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldZBSHeir.IntruderBuff
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   import flash.utils.Timer;
   
   public class GoldZBSHeirIntruderSecondEffect extends a_4108
   {
      
      public var stTargetMouveIntruder:a_4206;
      
      private var m_stTiemr:Timer;
      
      public function GoldZBSHeirIntruderSecondEffect()
      {
         a_1271 = true;
         super();
         this.m_stTiemr = new Timer(100);
         a_1279 = -22;
         m_iYDisplayCenterPos = -40;
      }
      
      public static function a_3926() : GoldZBSHeirIntruderSecondEffect
      {
         return PoolManager.getInstance().CheckOutOne(GoldZBSHeirIntruderSecondEffect) as GoldZBSHeirIntruderSecondEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldZBSHeirIntruderSecondEffectMovie;
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
         if(this.stTargetMouveIntruder != null && Boolean(this.stTargetMouveIntruder.m_stGoldZBSSecondBurnEffect))
         {
            this.stTargetMouveIntruder.m_stGoldZBSSecondBurnEffect = null;
            this.stTargetMouveIntruder = null;
         }
         return true;
      }
   }
}

