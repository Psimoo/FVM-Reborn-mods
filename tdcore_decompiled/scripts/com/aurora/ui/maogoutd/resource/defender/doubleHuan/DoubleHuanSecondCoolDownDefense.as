package com.aurora.ui.maogoutd.resource.defender.doubleHuan
{
   import a_4728.a_1778;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class DoubleHuanSecondCoolDownDefense extends a_3976
   {
      
      private var m_stTiemr:Timer;
      
      public function DoubleHuanSecondCoolDownDefense()
      {
         a_1271 = true;
         super();
         a_1095 = DoubleHuanDefine.DEFENSE_PRICE - DoubleHuanDefine.REDUCE_PRICE;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : DoubleHuanSecondCoolDownDefense
      {
         return PoolManager.getInstance().CheckOutOne(DoubleHuanSecondCoolDownDefense) as DoubleHuanSecondCoolDownDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return DoubleHuanSecondCoolDownDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.play();
         a_1095 = DoubleHuanDefine.DEFENSE_PRICE - DoubleHuanDefine.REDUCE_PRICE;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return DoubleHuanDefine.a_3964(a_1094);
      }
      
      override public function a_3940() : Boolean
      {
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         m_iBeOtherPlaced = false;
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
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var xEffectStart:int = 0;
         var stFieldGridVector:Array = null;
         var yIndex:int = 0;
         var stAurDataEvent:a_1778 = null;
         var xIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         nextFrame();
         if(a_1273 == a_1274)
         {
            if(Boolean(a_1334.m_stCurrentBattbleFieldView.isOwnBattleField) && Boolean(root) && !m_iBeOtherPlaced)
            {
               stAurDataEvent = new a_1778("GameCardCopy");
               stAurDataEvent.dataObject = a_1334.m_iInitialXGridNo + "_" + a_1334.m_iInitialYGridNo + "_" + m_iPlaceTimeIntervals;
               root.dispatchEvent(stAurDataEvent);
            }
            BattleFieldView.a_1048.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            yStart = a_1334.m_iYGridNo - 2 < 0 ? 0 : int(a_1334.m_iYGridNo - 2);
            xStart = a_1334.m_iXGridNo - 2 < 0 ? 0 : int(a_1334.m_iXGridNo - 2);
            yEnd = a_1334.m_iYGridNo + 2 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(a_1334.m_iYGridNo + 2);
            xEnd = a_1334.m_iXGridNo + 2 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(a_1334.m_iXGridNo + 2);
            xEffectStart = Math.max(a_1334.m_iXGridNo - 1,0);
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
                  arrMoveIntruder = stFieldGrid.a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     stMoveIntruder.a_4210();
                  }
               }
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

