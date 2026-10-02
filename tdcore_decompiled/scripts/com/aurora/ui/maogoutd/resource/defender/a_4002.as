package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class a_4002 extends a_3976
   {
      
      private var m_stTiemr:Timer;
      
      public function a_4002()
      {
         a_1271 = true;
         super();
         a_1338 = -30;
         a_1095 = 75;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : a_4002
      {
         return PoolManager.getInstance().CheckOutOne(a_4002) as a_4002;
      }
      
      override protected function getBindMovie() : Class
      {
         return CoffeeWakeUpBeanDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.play();
         return super.a_1797(stFieldGrid);
      }
      
      override public function a_3940() : Boolean
      {
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         return super.a_3940();
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
         nextFrame();
         if(a_1273 == a_1274)
         {
            if(a_1334.m_stAttackFighter)
            {
               a_1334.m_stAttackFighter.a_3970();
            }
            else if(a_1334.m_stBaseAuxiliaryFighter)
            {
               a_1334.m_stBaseAuxiliaryFighter.a_3970();
            }
            else if(a_1334.m_stFlowerDefense)
            {
               a_1334.m_stFlowerDefense.a_3970();
            }
            else if(a_1334.m_stBoomDefense)
            {
               a_1334.m_stBoomDefense.a_3970();
            }
            else if(a_1334.m_stProtector)
            {
               a_1334.m_stProtector.a_3970();
            }
            if(this.parent)
            {
               this.parent.removeChild(this);
            }
            this.a_3940();
            return;
         }
      }
   }
}

