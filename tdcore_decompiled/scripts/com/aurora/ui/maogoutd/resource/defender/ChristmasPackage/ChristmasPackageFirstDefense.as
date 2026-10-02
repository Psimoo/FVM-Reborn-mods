package com.aurora.ui.maogoutd.resource.defender.ChristmasPackage
{
   import a_4728.a_1778;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class ChristmasPackageFirstDefense extends a_3976
   {
      
      private var m_stTiemr:Timer;
      
      private var m_arrPos:Array = [[-1,0],[1,0],[0,0],[0,-1],[0,1]];
      
      public function ChristmasPackageFirstDefense()
      {
         a_1271 = true;
         super();
         a_1095 = ChristmasPackageDefine.DEFENSE_PRICE - ChristmasPackageDefine.REDUCE_PRICE;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : ChristmasPackageFirstDefense
      {
         return PoolManager.getInstance().CheckOutOne(ChristmasPackageFirstDefense) as ChristmasPackageFirstDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return ChristmasPackageFirstDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.play();
         a_1095 = ChristmasPackageDefine.DEFENSE_PRICE - ChristmasPackageDefine.REDUCE_PRICE;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return ChristmasPackageDefine.a_3964(a_1094);
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
         var stAurDataEvent:a_1778 = null;
         nextFrame();
         if(a_1273 == a_1274)
         {
            if(Boolean(a_1334.m_stCurrentBattbleFieldView.isOwnBattleField) && Boolean(root) && !m_iBeOtherPlaced)
            {
               stAurDataEvent = new a_1778("GameCardRandomCopy");
               stAurDataEvent.dataObject = a_1334.m_iInitialXGridNo + "_" + a_1334.m_iInitialYGridNo + "_" + m_iPlaceTimeIntervals;
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
      
      private function a_4360(stFieldGrid:a_3491) : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stCurFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var iReduceLife:int = 0;
         var iLen:int = int(this.m_arrPos.length);
         for(var i:int = 0; i < iLen; i++)
         {
            iXGridNo = stFieldGrid.m_iXGridNo + this.m_arrPos[i][0];
            iYGridNo = stFieldGrid.m_iYGridNo + this.m_arrPos[i][1];
            stCurFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            if(null != stCurFieldGrid)
            {
               arrMoveIntruder = stCurFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(stMoveIntruder.iLifeValue > 0)
                  {
                     iReduceLife = 100;
                     stMoveIntruder.a_4209(iReduceLife);
                  }
               }
            }
         }
      }
   }
}

