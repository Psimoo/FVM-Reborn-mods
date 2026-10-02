package com.aurora.ui.maogoutd.resource.defender.DragonYear.LingyuMocha
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class LingyuMochaThirdDefense extends a_3976
   {
      
      private var m_stTiemr:Timer;
      
      public function LingyuMochaThirdDefense()
      {
         a_1271 = true;
         super();
         a_1338 = -30;
         a_1095 = LingyuMochaDefine.DEFENSE_PRICE;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : LingyuMochaThirdDefense
      {
         return PoolManager.getInstance().CheckOutOne(LingyuMochaThirdDefense) as LingyuMochaThirdDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return LingyuMochaThirdDefenseMovie;
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
            for(offsetY = -3; offsetY <= 3; offsetY++)
            {
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo + offsetY);
               this.addShot(stStartField);
            }
            stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(BattleFieldView.a_1011 - 1,0);
            this.addShot(stStartField,true);
         }
         if(a_1273 == a_1274)
         {
            super.a_3969(a_1339);
         }
      }
      
      private function addShot(stStartField:a_3491, isVert:Boolean = false) : Boolean
      {
         var stLastWaitShot:* = undefined;
         if(!stStartField)
         {
            return false;
         }
         if(isVert)
         {
            stLastWaitShot = LingyuMochaBaseVertShot.a_4344() as LingyuMochaBaseVertShot;
         }
         else
         {
            stLastWaitShot = LingyuMochaBaseHorzShot.GetFreeShot3() as LingyuMochaBaseHorzShot;
         }
         if(null == stLastWaitShot)
         {
            return false;
         }
         var tempX2:int = stStartField.m_iXGridNo * a_3491.a_1080 + (isVert ? 30 : 0);
         var tempY2:int = stStartField.m_iYGridNo * a_3491.a_1081 + (isVert ? 0 : 30);
         stLastWaitShot.m_isSpecial = 3;
         stLastWaitShot.a_1797(0,15,10,tempX2,tempY2,a_1334.m_stCurrentBattbleFieldView,stStartField);
         parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
         return true;
      }
   }
}

