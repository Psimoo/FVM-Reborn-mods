package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Arrogant
{
   import a_4752.TagComponent;
   import a_4752.a_2036;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class WBTimeChangeEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var _tagCom:TagComponent;
      
      public function WBTimeChangeEffect()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : WBTimeChangeEffect
      {
         return PoolManager.getInstance().CheckOutOne(WBTimeChangeEffect) as WBTimeChangeEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBTimeChangeEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.play();
         mouseEnabled = false;
         mouseChildren = false;
         this._tagCom = a_2036.getInstance().tagCom;
         return true;
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      public function play() : void
      {
         this.m_stTiemr.start();
      }
      
      public function stop() : void
      {
         this.m_stTiemr.stop();
      }
      
      private function a_4003(a_4730:Event) : void
      {
         if(!this._tagCom.HasTag(17) && !this._tagCom.HasTag(18) && !this._tagCom.HasTag(19))
         {
            this.a_3940();
            return;
         }
         if(a_1273 != a_1274)
         {
            nextFrame();
         }
      }
   }
}

