package com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.LanternFestival
{
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockData;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockFieldGrid;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockMap;
   
   public class LanternFestival4GameMap extends LanternFestivalBaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      private var lastIndex:int = 0;
      
      public function LanternFestival4GameMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
         m_OutArray = [[3,0],[4,0],[5,0],[6,0],[7,0],[8,0],[1,2],[2,2],[5,2],[6,2],[7,2],[8,2],[1,4],[2,4],[3,4],[4,4],[7,4],[8,4],[1,6],[2,6],[3,6],[4,6],[5,6],[6,6]];
         m_TotalObstaclePos = [];
         m_arrPot = [[7,1,null],[6,1,null],[5,3,null],[4,3,null],[7,5,null],[6,5,null]];
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
         item.m_iStartXGridNo = 1;
         item.m_iStartYGridNo = 0;
         item.m_iEndXGridNo = 7;
         item.m_iEndYGridNo = 0;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
         item.m_iID = 0;
         item.m_iXOffset = 0;
         item.m_iYOffset = 0;
         item.m_iSpeed = a_3491.a_1080 / (4 * 20);
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 3;
         item.m_iDefultYGridNo = 2;
         item.m_iStartXGridNo = 1;
         item.m_iStartYGridNo = 2;
         item.m_iEndXGridNo = 7;
         item.m_iEndYGridNo = 2;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
         item.m_iID = 0;
         item.m_iXOffset = 0;
         item.m_iYOffset = 8;
         item.m_iSpeed = a_3491.a_1080 / (4 * 20);
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 5;
         item.m_iDefultYGridNo = 4;
         item.m_iStartXGridNo = 1;
         item.m_iStartYGridNo = 4;
         item.m_iEndXGridNo = 7;
         item.m_iEndYGridNo = 4;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
         item.m_iID = 0;
         item.m_iXOffset = 0;
         item.m_iYOffset = 8;
         item.m_iSpeed = a_3491.a_1080 / (4 * 20);
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 7;
         item.m_iDefultYGridNo = 6;
         item.m_iStartXGridNo = 1;
         item.m_iStartYGridNo = 6;
         item.m_iEndXGridNo = 7;
         item.m_iEndYGridNo = 6;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
         item.m_iID = 0;
         item.m_iXOffset = 0;
         item.m_iYOffset = 7;
         item.m_iSpeed = a_3491.a_1080 / (4 * 20);
         tempArr.push(item);
         for(var i:* = int(tempArr.length - 1); i >= 0; i--)
         {
            stMoveBlockMap = new MoveBlockMap(tempArr[i].m_iXOffset,tempArr[i].m_iYOffset);
            stMoveBlockData = new MoveBlockData();
            stMoveBlockData.m_iID = tempArr[i].m_iID;
            stMoveBlockData.m_iDefultXGridNo = tempArr[i].m_iDefultXGridNo;
            stMoveBlockData.m_iDefultYGridNo = tempArr[i].m_iDefultYGridNo;
            stMoveBlockData.m_iWidth = 2;
            stMoveBlockData.m_iHeight = 1;
            stMoveBlockData.m_iStartXGridNo = tempArr[i].m_iStartXGridNo;
            stMoveBlockData.m_iStartYGridNo = tempArr[i].m_iStartYGridNo;
            stMoveBlockData.m_iEndXGridNo = tempArr[i].m_iEndXGridNo;
            stMoveBlockData.m_iEndYGridNo = tempArr[i].m_iEndYGridNo;
            stMoveBlockData.m_iSpeed = tempArr[i].m_iSpeed;
            stMoveBlockData.m_iStartResidenceTime = 4 * 20;
            stMoveBlockData.m_iEndResideceTime = 4 * 20;
            stMoveBlockData.m_iDefultDirection = tempArr[i].m_iDefultDirection;
            stMoveBlockData.m_iDirectionType = 0;
            stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
            m_vMoveBlockMap.push(stMoveBlockMap);
         }
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var idx:int = 0;
         if(iTimeNum == 1)
         {
            CreateRice(0,1);
            CreateRice(1,1);
            this.lastIndex = 0;
         }
         else if(iTimeNum != 0 && iTimeNum % (20 * 30) == 0)
         {
            idx = int(m_stRandomSeed.nextInt(3));
            while(this.lastIndex == idx)
            {
               idx = int(m_stRandomSeed.nextInt(3));
            }
            this.lastIndex = idx;
            if(idx == 0)
            {
               CreateRice(0,1);
               CreateRice(1,1);
            }
            else if(idx == 1)
            {
               CreateRice(0,3);
               CreateRice(1,3);
            }
            else if(idx == 2)
            {
               CreateRice(0,5);
               CreateRice(1,5);
            }
         }
         super.OnTimeInterval(iTimeNum);
      }
   }
}

