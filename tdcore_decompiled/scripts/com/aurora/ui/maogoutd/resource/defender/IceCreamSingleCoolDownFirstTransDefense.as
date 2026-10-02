package com.aurora.ui.maogoutd.resource.defender
{
   import a_4728.a_1778;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class IceCreamSingleCoolDownFirstTransDefense extends a_3976
   {
      
      private var m_stTiemr:Timer;
      
      public function IceCreamSingleCoolDownFirstTransDefense()
      {
         a_1271 = true;
         super();
         a_1338 = -30;
         a_1095 = 75;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : IceCreamSingleCoolDownFirstTransDefense
      {
         return PoolManager.getInstance().CheckOutOne(IceCreamSingleCoolDownFirstTransDefense) as IceCreamSingleCoolDownFirstTransDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return IceCreamSingleCoolDownFirstTransDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.play();
         return super.a_1797(stFieldGrid);
      }
      
      override protected function a_3964() : int
      {
         return 600 - this.a_3965();
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
         var stBaseDefense:a_3962 = null;
         var stAurDataEvent:a_1778 = null;
         nextFrame();
         if(a_1273 == a_1274)
         {
            if(a_1334.m_stAttackFighter)
            {
               stBaseDefense = a_1334.m_stAttackFighter;
            }
            else if(a_1334.m_stBaseAuxiliaryFighter)
            {
               stBaseDefense = a_1334.m_stBaseAuxiliaryFighter;
            }
            else if(a_1334.m_stFlowerDefense)
            {
               stBaseDefense = a_1334.m_stFlowerDefense;
            }
            else if(a_1334.m_stBoomDefense)
            {
               stBaseDefense = a_1334.m_stBoomDefense;
            }
            else if(a_1334.m_stProtector)
            {
               stBaseDefense = a_1334.m_stProtector;
            }
            else if(a_1334.m_stBaseToolDefense)
            {
               stBaseDefense = a_1334.m_stBaseToolDefense;
            }
            if(Boolean(a_1334.m_stCurrentBattbleFieldView.isOwnBattleField) && Boolean(root) && Boolean(stBaseDefense))
            {
               stAurDataEvent = new a_1778("GameCardCoolDown");
               stAurDataEvent.dataObject = [stBaseDefense.a_3512(),[1]];
               root.dispatchEvent(stAurDataEvent);
            }
            if(this.parent)
            {
               this.parent.removeChild(this);
            }
            this.a_3940();
            return;
         }
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 0;
         if(a_1094 <= 3)
         {
            iStarDegreeEffect = 1 * a_1094;
         }
         else if(a_1094 > 3 && a_1094 <= 6)
         {
            iStarDegreeEffect = 1 * 3 + 2 * (a_1094 - 3);
         }
         else if(a_1094 > 6 && a_1094 <= 9)
         {
            iStarDegreeEffect = 1 * 3 + 2 * 3 + 3 * (a_1094 - 6);
         }
         else if(a_1094 > 9)
         {
            iStarDegreeEffect = 1 * 3 + 2 * 3 + 3 * 3 + 3 * (a_1094 - 9);
         }
         return 10 * iStarDegreeEffect;
      }
   }
}

