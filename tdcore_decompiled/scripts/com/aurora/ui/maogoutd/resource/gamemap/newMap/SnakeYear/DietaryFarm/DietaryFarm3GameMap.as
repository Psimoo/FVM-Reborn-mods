package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.DietaryFarm
{
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockData;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockFieldGrid;
   
   public class DietaryFarm3GameMap extends DietaryFarmBaseGameMap
   {
      
      private var randomArr:Array = [[0,0],[1,0],[2,0],[8,0],[0,1],[1,1],[2,1],[4,1],[5,1],[6,1],[8,1],[0,2],[1,2],[2,2],[4,2],[5,2],[6,2],[8,2],[0,3],[1,3],[2,3],[4,3],[5,3],[6,3],[8,3],[0,4],[1,4],[2,4],[4,4],[5,6],[6,4],[8,4],[0,5],[1,5],[2,5],[4,5],[5,5],[6,5],[8,5],[0,6],[1,6],[2,6],[8,6]];
      
      public function DietaryFarm3GameMap()
      {
         super();
         m_OutArray = [[3,1,null],[7,1,null],[3,3,null],[7,3,null],[3,5,null],[7,5,null]];
         m_Barrier1Array = [[3,0],[4,0],[5,0],[6,0],[7,0],[3,6],[4,6],[5,6],[6,6],[7,6],[3,1],[3,2],[3,3],[3,4],[3,5],[7,1],[7,2],[7,3],[7,4],[7,5]];
         a_1445.m_iBattleFieldStageType = 0;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         ++m_iRunTick;
         if(m_iRunTick == 30 * 20)
         {
            CreateMouse(240000,60000,this.randomArr,10 * 20);
         }
         super.OnTimeInterval(iTimeNum);
      }
      
      override protected function InitGameMoveMapData() : void
      {
         this.CreateBlockGrid([3,5,MoveBlockFieldGrid.MOVE_UP]);
         this.CreateBlockGrid([3,3,MoveBlockFieldGrid.MOVE_UP]);
         this.CreateBlockGrid([3,1,MoveBlockFieldGrid.MOVE_UP]);
         this.CreateBlockGrid([7,1,MoveBlockFieldGrid.MOVE_DOWN]);
         this.CreateBlockGrid([7,3,MoveBlockFieldGrid.MOVE_DOWN]);
         this.CreateBlockGrid([7,5,MoveBlockFieldGrid.MOVE_DOWN]);
      }
      
      public function CreateBlockGrid(gridParams:Array) : void
      {
         var stMoveBlockMap:DietaryFarmMoveBlockMap = new DietaryFarmMoveBlockMap(-7,-16);
         var stMoveBlockData:MoveBlockData = new MoveBlockData();
         stMoveBlockData.m_iShowWidth = 67;
         stMoveBlockData.m_iShowWidth = 84;
         stMoveBlockData.m_iID = 0;
         stMoveBlockData.m_iDefultXGridNo = gridParams[0];
         stMoveBlockData.m_iDefultYGridNo = gridParams[1];
         stMoveBlockData.m_iHeight = 1;
         stMoveBlockData.m_iWidth = 1;
         stMoveBlockData.m_iStartXGridNo = 3;
         stMoveBlockData.m_iStartYGridNo = 0;
         stMoveBlockData.m_iEndXGridNo = 7;
         stMoveBlockData.m_iEndYGridNo = 6;
         stMoveBlockData.m_WaitTime = 15 * 20;
         stMoveBlockData.m_iStartResidenceTime = 0;
         stMoveBlockData.m_iEndResideceTime = 0;
         stMoveBlockData.m_iDefultDirection = gridParams[2];
         stMoveBlockData.m_iDirectionType = 3;
         stMoveBlockData.m_iSpeed = a_3491.a_1080 / (4 * 20);
         stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
         m_vMoveBlockMap.push(stMoveBlockMap);
      }
      
      override public function CreateCup(arr:Array) : DietaryFarmCupMoveIntruder
      {
         var cup:DietaryFarmCupMoveIntruder = super.CreateCup(arr);
         if(cup != null)
         {
            cup.SetOffsetY(18);
         }
         return cup;
      }
   }
}

