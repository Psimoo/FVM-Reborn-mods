package com.aurora.ui.maogoutd.resource.gamemap.newMap.TigerYear
{
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.BaseGameMoveMap;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockData;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockFieldGrid;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockMap;
   
   public class GardeniaSixGameMap extends BaseGameMoveMap
   {
      
      private static const DEEP_INDEX:int = 1;
      
      private var a_1445:a_4187 = new a_4187();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      public function GardeniaSixGameMap()
      {
         super();
         this.a_1445.m_iBattleFieldStageType = 1;
         this.a_1445.m_iBattleModType = 0;
         this.a_1445.m_iWeatherType = 0;
      }
      
      override protected function InitGameMoveMapData() : void
      {
         var item:Object = null;
         var stMoveBlockMap:MoveBlockMap = null;
         var stMoveBlockData:MoveBlockData = null;
         var tempArr:Array = new Array();
         item = new Object();
         item.m_iDefultXGridNo = 1;
         item.m_iDefultYGridNo = 0;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_DOWN;
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 6;
         item.m_iDefultYGridNo = 0;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 6;
         item.m_iDefultYGridNo = 5;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_UP;
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 1;
         item.m_iDefultYGridNo = 5;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
         tempArr.push(item);
         for(var i:int = 0; i < tempArr.length; i++)
         {
            stMoveBlockMap = new MoveBlockMap(-4,4);
            stMoveBlockData = new MoveBlockData();
            stMoveBlockData.m_iID = i % 2 == 1 ? 1 : 0;
            stMoveBlockData.m_iDefultXGridNo = tempArr[i].m_iDefultXGridNo;
            stMoveBlockData.m_iDefultYGridNo = tempArr[i].m_iDefultYGridNo;
            stMoveBlockData.m_iHeight = 2;
            stMoveBlockData.m_iWidth = 2;
            stMoveBlockData.m_iStartXGridNo = 1;
            stMoveBlockData.m_iStartYGridNo = 0;
            stMoveBlockData.m_iEndXGridNo = 6;
            stMoveBlockData.m_iEndYGridNo = 5;
            stMoveBlockData.m_iSpeed = a_3491.a_1081 / (3 * 20);
            stMoveBlockData.m_iStartResidenceTime = 9 * 20;
            stMoveBlockData.m_iEndResideceTime = 9 * 20;
            stMoveBlockData.m_iDefultDirection = tempArr[i].m_iDefultDirection;
            stMoveBlockData.m_iDirectionType = 1;
            stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
            m_vMoveBlockMap.push(stMoveBlockMap);
         }
      }
      
      override public function a_4176() : a_4187
      {
         return this.a_1445;
      }
      
      override public function a_4177() : void
      {
         ReleaseMoveMap();
         super.a_4177();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         super.OnTimeInterval(iTimeNum);
         this.m_iCurrentTimeIntval = iTimeNum;
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         return true;
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var iYIndex:int = 0;
         var iXIndex:int = 0;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
            {
               for(iXIndex = 1; iXIndex < BattleFieldView.a_1011 - 1; iXIndex++)
               {
                  if(!(iYIndex == 0 && iXIndex == 1 || iYIndex == 0 && iXIndex == 2 || iYIndex == 1 && iXIndex == 1 || iYIndex == 1 && iXIndex == 2 || iYIndex == 5 && iXIndex == 6 || iYIndex == 5 && iXIndex == 7 || iYIndex == 6 && iXIndex == 6 || iYIndex == 6 && iXIndex == 7))
                  {
                     stCurrentBattleFieldView.stFieldGridsVector[iYIndex][iXIndex].m_iFieldGridType = 3;
                  }
               }
            }
            stCurrentBattleFieldView.stFieldGridsVector[2][3].m_iFieldGridType = 0;
            stCurrentBattleFieldView.stFieldGridsVector[2][4].m_iFieldGridType = 0;
            stCurrentBattleFieldView.stFieldGridsVector[2][5].m_iFieldGridType = 0;
            stCurrentBattleFieldView.stFieldGridsVector[3][3].m_iFieldGridType = 0;
            stCurrentBattleFieldView.stFieldGridsVector[3][4].m_iFieldGridType = 0;
            stCurrentBattleFieldView.stFieldGridsVector[3][5].m_iFieldGridType = 0;
            stCurrentBattleFieldView.stFieldGridsVector[4][3].m_iFieldGridType = 0;
            stCurrentBattleFieldView.stFieldGridsVector[4][4].m_iFieldGridType = 0;
            stCurrentBattleFieldView.stFieldGridsVector[4][5].m_iFieldGridType = 0;
            stCurrentBattleFieldView.stFieldGridsVector[0][6].m_iFieldGridType = 4;
            stCurrentBattleFieldView.stFieldGridsVector[0][7].m_iFieldGridType = 4;
            stCurrentBattleFieldView.stFieldGridsVector[1][6].m_iFieldGridType = 4;
            stCurrentBattleFieldView.stFieldGridsVector[1][7].m_iFieldGridType = 4;
            stCurrentBattleFieldView.stFieldGridsVector[5][1].m_iFieldGridType = 4;
            stCurrentBattleFieldView.stFieldGridsVector[5][2].m_iFieldGridType = 4;
            stCurrentBattleFieldView.stFieldGridsVector[6][1].m_iFieldGridType = 4;
            stCurrentBattleFieldView.stFieldGridsVector[6][2].m_iFieldGridType = 4;
         }
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
   }
}

