package com.aurora.ui.maogoutd.resource.defender.SnakeYear.shapeShiftingSnake
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import a_4752.GlobalVariables;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import com.aurora.ui.maogoutd.resource.defender.a_4012;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class ShapeShiftingSnakeCopyDefense extends a_3976
   {
      
      private var m_stTiemr:Timer;
      
      private var m_SnakeReplaceEffect:ShapeShiftingSnakeBaseReplaceEffect;
      
      private var m_PlaceDefenseTypeID:uint;
      
      private var ChangeInToOrder:Array = [];
      
      public function ShapeShiftingSnakeCopyDefense()
      {
         super();
         a_1095 = ShapeShiftingSnakeDefine.DEFENSE_PRICE;
         this.m_stTiemr = new Timer(50);
         m_iToolType = 4;
         m_iMoveByMap = true;
      }
      
      public static function a_3926() : ShapeShiftingSnakeCopyDefense
      {
         return PoolManager.getInstance().CheckOutOne(ShapeShiftingSnakeCopyDefense) as ShapeShiftingSnakeCopyDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return ShapeShiftingSnakeCopyDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = 300;
         this.visible = true;
         gotoAndStop(1);
         if(m_bServerIssued)
         {
            this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
            this.play();
            if(a_1789.getInstance().hasEventListener("DefenseCardCountChange"))
            {
               a_1789.getInstance().removeEventListener("DefenseCardCountChange",this.a_3483);
            }
            a_1789.getInstance().addEventListener("DefenseCardCountChange",this.a_3483);
            this.m_PlaceDefenseTypeID = 0;
            this.GenerateMultiCircleCoordinates(8);
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return ShapeShiftingSnakeDefine.a_3964(a_1094);
      }
      
      override public function a_3940() : Boolean
      {
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         m_iBeOtherPlaced = false;
         a_1789.getInstance().removeEventListener("DefenseCardCountChange",this.a_3483);
         this.m_PlaceDefenseTypeID = 0;
         this.m_SnakeReplaceEffect = null;
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
         if(a_1273 == 22)
         {
            this.AddSnakeReplaceEffect();
         }
         else if(a_1273 == 26 && !m_iBeOtherPlaced)
         {
            this.PalceVersatileDefense(stFieldGrid,this.m_PlaceDefenseTypeID);
         }
         else if(a_1273 == a_1274)
         {
            a_3969(a_1339);
         }
         else if(a_1278 != null)
         {
            gotoAndStop(1);
         }
      }
      
      private function AddSnakeReplaceEffect() : void
      {
         if(Boolean(a_1334) && this.m_SnakeReplaceEffect == null)
         {
            this.m_SnakeReplaceEffect = ShapeShiftingSnakeBaseReplaceEffect.a_3926();
            this.m_SnakeReplaceEffect.stOriginalFieldGrid = a_1334;
            this.m_SnakeReplaceEffect.a_1797(false);
            this.m_SnakeReplaceEffect.x = (a_1334.m_iXGridNo + 0.5) * a_3491.a_1080;
            this.m_SnakeReplaceEffect.y = (a_1334.m_iYGridNo + 0.5) * a_3491.a_1081;
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this.m_SnakeReplaceEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,a_1334);
            if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_SnakeReplaceEffect,a_1334.m_iXGridNo,a_1334.m_iYGridNo);
            }
            this.m_SnakeReplaceEffect.play();
         }
      }
      
      private function a_3483(stDataEvent:a_1778) : void
      {
         var stStartField:a_3491 = null;
         if(stFieldGrid == null || a_1275 == 1 || stDataEvent.dataObject.length < 4 || stDataEvent.dataObject[0] < 10)
         {
            return;
         }
         if(stDataEvent.dataObject[3].m_iBeOtherPlaced != m_iBeOtherPlaced)
         {
            return;
         }
         if(BattleFieldView.JudgeIsCopyCard(stDataEvent.dataObject[0]) || BattleFieldView.JudgeIsCooldownCard(stDataEvent.dataObject[0]))
         {
            return;
         }
         if(stDataEvent.dataObject[3].m_bPlaceByUpGradeCard)
         {
            return;
         }
         var tempFieldGrid:Object = stDataEvent.dataObject[2];
         var iDefenseCount:int = 0;
         if(tempFieldGrid != null)
         {
            stStartField = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(tempFieldGrid.m_iXGridNo,tempFieldGrid.m_iYGridNo);
            if(this.ChekCanSkill(stFieldGrid,stDataEvent.dataObject[0]) && this.CheckIsInRange(stFieldGrid,stStartField,2))
            {
               this.m_PlaceDefenseTypeID = stDataEvent.dataObject[0];
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
               if(a_1336)
               {
                  a_1336.visible = false;
               }
            }
         }
      }
      
      private function PalceVersatileDefense(stFieldGrid:a_3491, iDefenseTypeID:int) : void
      {
         var stInitialFieldGrid:a_3491 = null;
         var iLoopCnt:int = 0;
         var iCnt:int = 0;
         var stStartField:a_3491 = null;
         if(stFieldGrid == null)
         {
            return;
         }
         var stMyBattleFieldView:BattleFieldView = stFieldGrid.m_stCurrentBattbleFieldView;
         var a_1105:a_3962 = a_4012.getInstance().a_4013(iDefenseTypeID) as a_3962;
         if(a_1105 != null)
         {
            a_1105.iDefenseTypeID = iDefenseTypeID;
            a_1105.m_iPlaceTimeIntervals = stFieldGrid.m_stCurrentBattbleFieldView.iTimeIntervalNum;
            a_1105.m_iDefenseGlobalID = stFieldGrid.m_stCurrentBattbleFieldView.a_2180();
            if(stFieldGrid.CheckAddDefense(a_1105,false))
            {
               stInitialFieldGrid = stMyBattleFieldView.a_3438(stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
               a_1088.a_2059(stMyBattleFieldView.a_2180(),iDefenseTypeID,stInitialFieldGrid.m_iInitialXGridNo,stInitialFieldGrid.m_iInitialYGridNo,1,2);
               if(iDefenseTypeID == 287572013 || iDefenseTypeID == 292552863 || iDefenseTypeID == 292552975)
               {
                  iLoopCnt = 0;
                  iCnt = 0;
                  while(iLoopCnt < this.ChangeInToOrder.length && iCnt < 2)
                  {
                     stStartField = stMyBattleFieldView.a_3438(stFieldGrid.m_iXGridNo + this.ChangeInToOrder[iLoopCnt][0],stFieldGrid.m_iYGridNo + this.ChangeInToOrder[iLoopCnt][1]);
                     if(stStartField != null && stStartField != stFieldGrid && !stStartField.m_isLockVersatileDefense && stStartField.CheckAddDefense(a_1105))
                     {
                        stInitialFieldGrid = stMyBattleFieldView.a_3438(stStartField.m_iXGridNo,stStartField.m_iYGridNo);
                        stStartField.m_isLockVersatileDefense = true;
                        a_1088.a_2059(stMyBattleFieldView.a_2180(),iDefenseTypeID,stInitialFieldGrid.m_iInitialXGridNo,stInitialFieldGrid.m_iInitialYGridNo,0,2);
                        iCnt++;
                     }
                     iLoopCnt++;
                  }
               }
               a_1105.a_3940();
            }
            else
            {
               a_1105.a_3940();
            }
         }
      }
      
      private function ChekCanSkill(checkFieldGrid:a_3491, iDefenseTypeID:uint) : Boolean
      {
         var stBaseDefense:a_3962 = null;
         var addResult:Boolean = false;
         if(checkFieldGrid != null)
         {
            stBaseDefense = a_4012.getInstance().a_4013(iDefenseTypeID) as a_3962;
            if(stBaseDefense != null)
            {
               stBaseDefense.iDefenseTypeID = iDefenseTypeID;
               addResult = a_1334.m_stCurrentBattbleFieldView.a_3441(stBaseDefense,checkFieldGrid.m_iXGridNo,checkFieldGrid.m_iYGridNo);
               stBaseDefense.a_3940();
               return addResult;
            }
         }
         return false;
      }
      
      private function CheckIsInRange(checkFieldGrid:a_3491, targetFieldGrid:a_3491, range:int) : Boolean
      {
         if(checkFieldGrid != null && targetFieldGrid != null)
         {
            if(checkFieldGrid.m_iXGridNo > targetFieldGrid.m_iXGridNo + range || checkFieldGrid.m_iXGridNo < targetFieldGrid.m_iXGridNo - range || checkFieldGrid.m_iYGridNo > targetFieldGrid.m_iYGridNo + range || checkFieldGrid.m_iYGridNo < targetFieldGrid.m_iYGridNo - range)
            {
               return false;
            }
         }
         return true;
      }
      
      private function CheckNeedRecByPlace(a_4730:Event) : void
      {
         if(a_4730 != null && !BattleFieldView.JudgeIsCopyCard(a_1098) && !BattleFieldView.JudgeIsCooldownCard(a_1098))
         {
            GlobalVariables.getInstance().m_iLastDefender = a_1098;
         }
      }
      
      override protected function a_3965() : int
      {
         return ShapeShiftingSnakeDefine.a_3965(a_1094);
      }
      
      private function GenerateMultiCircleCoordinates(maxCircle:int) : void
      {
         this.ChangeInToOrder = [[0,0],[0,-1],[0,1],[1,0],[-1,0],[-1,-1],[-1,1],[1,-1],[1,1],[-2,0],[2,0],[0,-2],[0,2],[-2,-1],[-2,1],[2,-1],[2,1],[-1,-2],[-1,2],[1,-2],[1,2],[-2,-2],[-2,2],[2,-2],[2,2]];
         for(var i:int = 3; i <= maxCircle; i++)
         {
            this.ChangeInToOrder = this.ChangeInToOrder.concat(this.GenerateCircleCoordinates(i));
         }
      }
      
      private function GenerateCircleCoordinates(n:int) : Array
      {
         var result:Array = [];
         for(var i:int = -n; i <= n; i++)
         {
            result.push([i,-n]);
            result.push([i,n]);
            if(i != -n && i != n)
            {
               result.push([-n,i]);
               result.push([n,i]);
            }
         }
         return result;
      }
   }
}

