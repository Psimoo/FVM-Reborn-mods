package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.GreedyDemon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.greensock.TweenMax;
   
   public class SweetTrapChangeStepEffect extends a_3909
   {
      
      public function SweetTrapChangeStepEffect()
      {
         super();
         a_1279 = 0;
         m_iYDisplayCenterPos = 0;
      }
      
      public static function a_3926() : SweetTrapChangeStepEffect
      {
         return PoolManager.getInstance().CheckOutOne(SweetTrapChangeStepEffect) as SweetTrapChangeStepEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return SweetTrapChangeStepEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         a_1275 = 0;
         this.visible = true;
         this.gotoAndStop(1);
         return true;
      }
      
      public function Change2One() : void
      {
         this.gotoAndStop(1);
         a_3419();
         alpha = 1;
         TweenMax.to(this,3,{
            "alpha":0,
            "onComplete":this.OnTweenEnd
         });
      }
      
      public function Change2Two() : void
      {
         this.gotoAndStop(2);
         a_3419();
         alpha = 1;
         TweenMax.to(this,3,{
            "alpha":0,
            "onComplete":this.OnTweenEnd
         });
      }
      
      override public function gotoAndStop(frame:Object, scene:String = null) : void
      {
         trace(">>>" + frame);
         super.gotoAndStop(frame,scene);
      }
      
      private function OnTweenEnd() : void
      {
      }
      
      public function a_3940() : Boolean
      {
         this.gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
   }
}

