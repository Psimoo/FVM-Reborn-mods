package com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.BaseGameMoveMap;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockData;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockFieldGrid;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockMap;
   
   public class KnightOneDay4GameMap extends BaseGameMoveMap
   {
      
      public static const FIRST_CREATE_SECONDS:int = 15;
      
      public static const NEXT_CREATE_SECONDS:int = 12;
      
      private var m_OutArray:Array = [[0,4],[0,5],[0,6],[0,7],[0,8],[6,0],[6,1],[6,2],[6,3],[6,4],[2,0],[2,1],[2,2],[3,2],[4,2],[4,3],[4,4],[3,4],[2,4],[2,5],[2,6],[3,6],[4,6],[4,7],[4,8]];
      
      private var m_lMoveDir:Array = [[0,2,2,2,MoveBlockFieldGrid.MOVE_RIGHT],[2,2,2,4,MoveBlockFieldGrid.MOVE_DOWN],[2,4,4,4,MoveBlockFieldGrid.MOVE_RIGHT],[4,2,4,4,MoveBlockFieldGrid.MOVE_UP],[4,2,6,2,MoveBlockFieldGrid.MOVE_RIGHT],[6,2,6,4,MoveBlockFieldGrid.MOVE_DOWN],[6,4,8,4,MoveBlockFieldGrid.MOVE_RIGHT]];
      
      public var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var createRemain:int = 0;
      
      public function KnightOneDay4GameMap()
      {
         super();
         m_stMapInfoData.m_iBattleFieldStageType = 0;
         m_stMapInfoData.m_iBattleModType = 0;
         m_stMapInfoData.m_iWeatherType = 0;
      }
      
      override protected function InitGameMoveMapData() : void
      {
         var item:Object = null;
         var stMoveBlockMap:MoveBlockMap = null;
         var stMoveBlockData:MoveBlockData = null;
         var tempArr:Array = new Array();
         item = new Object();
         item.m_iDefultXGridNo = 0;
         item.m_iDefultYGridNo = 0;
         item.m_iStartXGridNo = 0;
         item.m_iStartYGridNo = 0;
         item.m_iEndXGridNo = 5;
         item.m_iEndYGridNo = 0;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
         item.m_iWidth = 4;
         item.m_iID = 0;
         item.ResidenceTime = 8;
         item.m_iXOffset = -14;
         item.m_iYOffset = 0;
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 5;
         item.m_iDefultYGridNo = 6;
         item.m_iStartXGridNo = 0;
         item.m_iStartYGridNo = 6;
         item.m_iEndXGridNo = 5;
         item.m_iEndYGridNo = 6;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
         item.m_iWidth = 4;
         item.m_iID = 0;
         item.ResidenceTime = 8;
         item.m_iXOffset = -18;
         item.m_iYOffset = 0;
         tempArr.push(item);
         for(var i:* = int(tempArr.length - 1); i >= 0; i--)
         {
            stMoveBlockMap = new MoveBlockMap(tempArr[i].m_iXOffset,tempArr[i].m_iYOffset);
            stMoveBlockData = new MoveBlockData();
            stMoveBlockData.m_iID = tempArr[i].m_iID;
            stMoveBlockData.m_iDefultXGridNo = tempArr[i].m_iDefultXGridNo;
            stMoveBlockData.m_iDefultYGridNo = tempArr[i].m_iDefultYGridNo;
            stMoveBlockData.m_iHeight = 1;
            stMoveBlockData.m_iWidth = tempArr[i].m_iWidth;
            stMoveBlockData.m_iStartXGridNo = tempArr[i].m_iStartXGridNo;
            stMoveBlockData.m_iStartYGridNo = tempArr[i].m_iStartYGridNo;
            stMoveBlockData.m_iEndXGridNo = tempArr[i].m_iEndXGridNo;
            stMoveBlockData.m_iEndYGridNo = tempArr[i].m_iEndYGridNo;
            stMoveBlockData.m_iSpeed = a_3491.a_1080 / (4 * 20);
            stMoveBlockData.m_iStartResidenceTime = item.ResidenceTime * 20;
            stMoveBlockData.m_iEndResideceTime = item.ResidenceTime * 20;
            stMoveBlockData.m_iDefultDirection = tempArr[i].m_iDefultDirection;
            stMoveBlockData.m_iDirectionType = 0;
            stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
            m_vMoveBlockMap.push(stMoveBlockMap);
         }
      }
      
      override public function a_4177() : void
      {
         ReleaseMoveMap();
         if(m_vMoveBlockMap != null)
         {
            m_vMoveBlockMap.length = 0;
            m_vMoveBlockMap = null;
         }
         super.a_4177();
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var i:int = 0;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               for(i = 0; i < this.m_OutArray.length; i++)
               {
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[this.m_OutArray[i][0]][this.m_OutArray[i][1]].m_iFieldGridType = 8;
               }
               this.createRemain = FIRST_CREATE_SECONDS * 20;
            }
         }
         return true;
      }
      
      public function CreateBlockGrid() : void
      {
         var arr:Array = this.m_lMoveDir[0];
         var stMoveBlockMap:KnightOneDayMoveBlockMap = new KnightOneDayMoveBlockMap(-20,-6);
         var stMoveBlockData:MoveBlockData = new MoveBlockData();
         stMoveBlockData.m_iID = 1;
         stMoveBlockData.m_iDefultXGridNo = arr[0];
         stMoveBlockData.m_iDefultYGridNo = arr[1];
         stMoveBlockData.m_iHeight = 1;
         stMoveBlockData.m_iWidth = 1;
         stMoveBlockData.m_iStartXGridNo = arr[0];
         stMoveBlockData.m_iStartYGridNo = arr[1];
         stMoveBlockData.m_iEndXGridNo = arr[2];
         stMoveBlockData.m_iEndYGridNo = arr[3];
         stMoveBlockData.m_iStartResidenceTime = 0;
         stMoveBlockData.m_iEndResideceTime = 0;
         stMoveBlockData.m_iDefultDirection = arr[4];
         stMoveBlockData.m_iDirectionType = 4;
         stMoveBlockData.m_iSpeed = a_3491.a_1080 / (4 * 20);
         stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
         m_vMoveBlockMap.push(stMoveBlockMap);
         stMoveBlockMap.CreateBlock(this,this.m_lMoveDir);
      }
      
      public function RemoveTargetgrid(blockMap:MoveBlockMap) : void
      {
         var index:int = m_vMoveBlockMap.indexOf(blockMap);
         if(index != -1)
         {
            m_vMoveBlockMap.splice(index,1);
            blockMap.ReleaseMoveMap();
         }
         else
         {
            trace("移除格子异常");
         }
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         --this.createRemain;
         if(this.createRemain == 0)
         {
            this.CreateBlockGrid();
            this.createRemain = NEXT_CREATE_SECONDS * 20;
         }
         super.OnTimeInterval(iTimeNum);
      }
   }
}

