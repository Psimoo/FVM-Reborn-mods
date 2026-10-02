package com.aurora.ui.maogoutd.resource.defender.DragonYear.LingyuMocha
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class LingyuMochaFirstDefense extends a_3976
   {
      
      private var m_stTiemr:Timer;
      
      public function LingyuMochaFirstDefense()
      {
         a_1271 = true;
         super();
         a_1338 = -30;
         a_1095 = LingyuMochaDefine.DEFENSE_PRICE;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : LingyuMochaFirstDefense
      {
         return PoolManager.getInstance().CheckOutOne(LingyuMochaFirstDefense) as LingyuMochaFirstDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return LingyuMochaFirstDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         if(m_bServerIssued)
         {
            this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         }
         this.visible = true;
         gotoAndStop(1);
         this.play();
         return super.a_1797(stFieldGrid);
      }
      
      override protected function a_3964() : int
      {
         return LingyuMochaDefine.a_3964(a_1094);
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
         var offsetY:int = 0;
         var stStartField:a_3491 = null;
         nextFrame();
         if(a_1273 == a_1274 - 3)
         {
            BattleFieldView.ms_lingyu_92.play();
            for(offsetY = -2; offsetY <= 1; offsetY++)
            {
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo + offsetY);
               this.addShot(stStartField);
            }
         }
         if(a_1273 == a_1274)
         {
            super.a_3969(a_1339);
         }
      }
      
      private function addShot(stStartField:a_3491) : Boolean
      {
         var stLastWaitShot:LingyuMochaBaseHorzShot = null;
         var tempX2:int = 0;
         var tempY2:int = 0;
         if(!stStartField)
         {
            return false;
         }
         stLastWaitShot = LingyuMochaBaseHorzShot.GetFreeShot1() as LingyuMochaBaseHorzShot;
         if(null == stLastWaitShot)
         {
            return false;
         }
         tempX2 = stStartField.m_iXGridNo * a_3491.a_1080;
         tempY2 = stStartField.m_iYGridNo * a_3491.a_1081 + 30;
         stLastWaitShot.m_isSpecial = 1;
         stLastWaitShot.a_1797(0,15,10,tempX2,tempY2,a_1334.m_stCurrentBattbleFieldView,stStartField);
         parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
         return true;
      }
   }
}

