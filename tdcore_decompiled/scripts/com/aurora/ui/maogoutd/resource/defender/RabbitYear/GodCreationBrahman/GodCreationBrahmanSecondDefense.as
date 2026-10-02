package com.aurora.ui.maogoutd.resource.defender.RabbitYear.GodCreationBrahman
{
   import a_4728.a_1778;
   import a_4752.GlobalVariables;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class GodCreationBrahmanSecondDefense extends a_3976
   {
      
      private var m_stTiemr:Timer;
      
      public function GodCreationBrahmanSecondDefense()
      {
         super();
         a_1095 = GodCreationBrahmanDefine.DEFENSE_PRICE;
         a_1279 = -5;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : GodCreationBrahmanSecondDefense
      {
         return PoolManager.getInstance().CheckOutOne(GodCreationBrahmanSecondDefense) as GodCreationBrahmanSecondDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return GodCreationBrahmanSecondDefenseMovie;
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
         return GodCreationBrahmanDefine.a_3964(a_1094);
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
         if(a_1273 == 21)
         {
            if(Boolean(a_1334.m_stCurrentBattbleFieldView.isOwnBattleField) && Boolean(root) && !m_iBeOtherPlaced)
            {
               stAurDataEvent = new a_1778("GameCloseCopyCardProcess");
               stAurDataEvent.dataObject = [a_1098,a_1334.m_iInitialXGridNo + "_" + a_1334.m_iInitialYGridNo + "_" + m_iPlaceTimeIntervals];
               root.dispatchEvent(stAurDataEvent);
            }
            this.skillAddCard(3);
            this.boomDie();
         }
         else if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
      
      private function skillAddCard(skillTimes:int) : void
      {
         if(a_1334 == null)
         {
            return;
         }
         var copyByWhoID:String = a_1334.m_iInitialXGridNo + "_" + a_1334.m_iInitialYGridNo + "_" + m_iPlaceTimeIntervals;
         var cardID:int = int(GlobalVariables.getInstance().m_prevPlacedCardDic[copyByWhoID]);
         if(cardID == -1 || m_iBeOtherPlaced)
         {
            return;
         }
         GodCreationBrahmanPlaceSkill.CopyCardSkill(cardID,skillTimes,a_1334);
      }
      
      private function boomDie() : void
      {
         var xIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         BattleFieldView.a_1048.play();
         a_1334.m_stCurrentBattbleFieldView.a_3466();
         var yStart:int = a_1334.m_iYGridNo - 2 < 0 ? 0 : int(a_1334.m_iYGridNo - 2);
         var xStart:int = a_1334.m_iXGridNo - 2 < 0 ? 0 : int(a_1334.m_iXGridNo - 2);
         var yEnd:int = a_1334.m_iYGridNo + 2 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(a_1334.m_iYGridNo + 2);
         var xEnd:int = a_1334.m_iXGridNo + 2 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(a_1334.m_iXGridNo + 2);
         var xEffectStart:int = Math.max(a_1334.m_iXGridNo - 1,0);
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
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
      }
      
      override protected function a_3965() : int
      {
         return GodCreationBrahmanDefine.a_3965(a_1094);
      }
   }
}

