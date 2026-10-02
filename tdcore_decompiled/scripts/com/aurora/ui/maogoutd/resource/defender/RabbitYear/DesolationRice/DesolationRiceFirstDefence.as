package com.aurora.ui.maogoutd.resource.defender.RabbitYear.DesolationRice
{
   import a_4728.a_1778;
   import a_4752.GlobalVariables;
   import com.aurora.protocol.game.maogoutd.CardDieVO;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class DesolationRiceFirstDefence extends a_3976
   {
      
      private var m_stTiemr:Timer;
      
      private var m_arrPos:Array = [[-1,0],[1,0],[0,0],[0,-1],[0,1]];
      
      public function DesolationRiceFirstDefence()
      {
         a_1271 = true;
         super();
         a_1095 = DesolationRiceDefence.DEFENSE_PRICE - DesolationRiceDefence.REDUCE_PRICE;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : DesolationRiceFirstDefence
      {
         return PoolManager.getInstance().CheckOutOne(DesolationRiceFirstDefence) as DesolationRiceFirstDefence;
      }
      
      override protected function getBindMovie() : Class
      {
         return DesolationRiceFirstDefenceMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.play();
         return true;
      }
      
      override protected function a_3964() : int
      {
         return DesolationRiceDefence.a_3964(a_1094);
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
         nextFrame();
         if(a_1273 == a_1274 - 7)
         {
            this.a_4360();
         }
         else if(a_1273 == a_1274)
         {
            if(Boolean(a_1334.m_stCurrentBattbleFieldView.isOwnBattleField) && Boolean(root) && !m_iBeOtherPlaced)
            {
               this.AddDieDefense(stFieldGrid);
            }
            if(this.parent)
            {
               this.parent.removeChild(this);
            }
            this.a_3940();
            return;
         }
      }
      
      private function AddDieDefense(stFieldGrid:a_3491) : void
      {
         var vo:CardDieVO = null;
         var i:int = 0;
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stAurDataEvent:a_1778 = null;
         var iLen:int = int(this.m_arrPos.length);
         var tempArr:Array = new Array();
         for(var j:int = 0; j < GlobalVariables.getInstance().m_iEatDieArr.length; j++)
         {
            vo = GlobalVariables.getInstance().m_iEatDieArr[j];
            for(i = 0; i < iLen; i++)
            {
               iXGridNo = stFieldGrid.m_iXGridNo + this.m_arrPos[i][0];
               iYGridNo = stFieldGrid.m_iYGridNo + this.m_arrPos[i][1];
               if(vo.m_byXGridNo == iXGridNo && vo.m_byYGridNo == iYGridNo)
               {
                  tempArr.push(vo);
               }
            }
         }
         tempArr.sort(this.OnSortToken);
         if(tempArr.length > 0)
         {
            stAurDataEvent = new a_1778("GameRangeDeathCardCopy");
            stAurDataEvent.dataObject = [tempArr[tempArr.length - 1].m_iDefenderTypeID,a_1334.m_iInitialXGridNo + "_" + a_1334.m_iInitialYGridNo + "_" + m_iPlaceTimeIntervals];
            root.dispatchEvent(stAurDataEvent);
         }
      }
      
      private function a_4360() : void
      {
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var xStart:int = Math.max(a_1334.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  stMoveIntruder.a_4210();
               }
            }
         }
      }
      
      private function OnSortToken(a:CardDieVO, b:CardDieVO) : int
      {
         if(a.m_DieTime > b.m_DieTime)
         {
            return 1;
         }
         if(a.m_DieTime < b.m_DieTime)
         {
            return -1;
         }
         return 0;
      }
   }
}

