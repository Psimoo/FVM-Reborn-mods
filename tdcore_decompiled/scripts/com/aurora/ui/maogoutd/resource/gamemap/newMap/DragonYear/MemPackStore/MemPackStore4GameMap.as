package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear.MemPackStore
{
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.BaseGameMoveMap;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockData;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockFieldGrid;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockMap;
   import flash.display.BitmapData;
   
   public class MemPackStore4GameMap extends BaseGameMoveMap implements IMemPackMap
   {
      
      private static var ms_stDayAirHighBitmapData:BitmapData;
      
      private static var ms_stDayAirLowBitmapData:BitmapData;
      
      private static const DEEP_INDEX:int = 1;
      
      private var a_1445:a_4187 = new a_4187();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_arrEffect:Array = new Array();
      
      private var m_iWaveStatus:int;
      
      private var m_TotalObstaclePos:Array = new Array([0,3],[1,3],[2,3],[3,3],[4,3],[5,3],[6,3],[0,5],[1,5],[2,5],[3,5],[4,5],[5,5],[6,5],[0,7],[1,7],[2,7],[3,7],[4,7],[5,7],[6,7]);
      
      private var m_arrBaler:Array = new Array();
      
      private var m_iCalTick:int = 0;
      
      private var m_iBalerState:int = 0;
      
      private var m_arrUseGrid:Array = new Array();
      
      private var m_arrBalerGrid:Array = new Array();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      public function MemPackStore4GameMap()
      {
         super();
         this.a_1445.m_iBattleFieldStageType = 0;
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
         item.m_iDefultXGridNo = 3;
         item.m_iDefultYGridNo = 1;
         item.m_iStartXGridNo = 3;
         item.m_iStartYGridNo = 0;
         item.m_iEndXGridNo = 3;
         item.m_iEndYGridNo = 6;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_DOWN;
         item.m_iID = 0;
         item.m_iXOffset = 0;
         item.m_iYOffset = 4;
         item.m_iSpeed = a_3491.a_1080 / (3 * 20);
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 5;
         item.m_iDefultYGridNo = 3;
         item.m_iStartXGridNo = 5;
         item.m_iStartYGridNo = 0;
         item.m_iEndXGridNo = 5;
         item.m_iEndYGridNo = 6;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_DOWN;
         item.m_iID = 0;
         item.m_iXOffset = 0;
         item.m_iYOffset = 4;
         item.m_iSpeed = a_3491.a_1080 / (3 * 20);
         tempArr.push(item);
         item = new Object();
         item.m_iDefultXGridNo = 7;
         item.m_iDefultYGridNo = 5;
         item.m_iStartXGridNo = 7;
         item.m_iStartYGridNo = 0;
         item.m_iEndXGridNo = 7;
         item.m_iEndYGridNo = 6;
         item.m_iDefultDirection = MoveBlockFieldGrid.MOVE_DOWN;
         item.m_iID = 0;
         item.m_iXOffset = 0;
         item.m_iYOffset = 4;
         item.m_iSpeed = a_3491.a_1080 / (3 * 20);
         tempArr.push(item);
         for(var i:* = int(tempArr.length - 1); i >= 0; i--)
         {
            stMoveBlockMap = new MoveBlockMap(tempArr[i].m_iXOffset,tempArr[i].m_iYOffset);
            stMoveBlockData = new MoveBlockData();
            stMoveBlockData.m_iID = tempArr[i].m_iID;
            stMoveBlockData.m_iDefultXGridNo = tempArr[i].m_iDefultXGridNo;
            stMoveBlockData.m_iDefultYGridNo = tempArr[i].m_iDefultYGridNo;
            stMoveBlockData.m_iWidth = 1;
            stMoveBlockData.m_iHeight = 1;
            stMoveBlockData.m_iStartXGridNo = tempArr[i].m_iStartXGridNo;
            stMoveBlockData.m_iStartYGridNo = tempArr[i].m_iStartYGridNo;
            stMoveBlockData.m_iEndXGridNo = tempArr[i].m_iEndXGridNo;
            stMoveBlockData.m_iEndYGridNo = tempArr[i].m_iEndYGridNo;
            stMoveBlockData.m_iSpeed = tempArr[i].m_iSpeed;
            stMoveBlockData.m_iStartResidenceTime = 0;
            stMoveBlockData.m_iEndResideceTime = 0;
            stMoveBlockData.m_iDefultDirection = tempArr[i].m_iDefultDirection;
            stMoveBlockData.m_iDirectionType = 0;
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
         this.removeEffectMovie();
         super.a_4177();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         ++this.m_iCalTick;
         if(this.m_iBalerState == 0)
         {
            if(this.m_iCalTick == 40 * 20)
            {
               this.SetBalerState(1);
               this.m_iBalerState = 1;
               this.m_iCalTick = 0;
            }
         }
         else if(this.m_iBalerState == 1)
         {
            if(this.m_iCalTick == 20 * 5)
            {
               this.SetBalerState(2);
               this.m_iCalTick = 0;
               this.m_iBalerState = 0;
            }
         }
         super.OnTimeInterval(iTimeNum);
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var j:int = 0;
         var enterRoom:Object = null;
         if(null == ms_stDayAirHighBitmapData)
         {
            ms_stDayAirHighBitmapData = GetBitMap("DayHighAirCloudBitmapData");
            ms_stDayAirLowBitmapData = GetBitMap("DayLowAirCloudBitmapData");
         }
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               j = 0;
               for(j = 0; j < this.m_TotalObstaclePos.length; j++)
               {
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[this.m_TotalObstaclePos[j][0]][this.m_TotalObstaclePos[j][1]].m_iFieldGridType = 8;
               }
               this.removeEffectMovie();
               this.m_iWaveStatus = -1;
               this.m_arrUseGrid = [];
               this.m_arrBalerGrid = [];
               this.m_arrBaler = [];
               this.m_iCalTick = 0;
               this.m_iBalerState = 0;
               enterRoom = a_2161.e.getEnterRoom();
               this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
               this.AddBalerMouse(3,1,20000);
               this.AddBalerMouse(5,3,20000);
               this.AddBalerMouse(7,5,20000);
            }
         }
         return true;
      }
      
      private function SetBalerState(state:int) : void
      {
         for(var i:int = 0; i < this.m_arrBaler.length; i++)
         {
            this.m_arrBaler[i].SpecialSkillCallBack(2,state);
         }
      }
      
      private function removeEffectMovie() : void
      {
         var stEffect:* = undefined;
         while(this.m_arrEffect.length > 0)
         {
            stEffect = this.m_arrEffect.pop();
            if(stEffect)
            {
               stEffect.a_3940();
            }
         }
      }
      
      public function AddBalerMouse(m_iXGridNo:int, m_iYGridNo:int, hp:int) : Boolean
      {
         var stTargetFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         this.m_stCurrentBattleFieldView.stFieldGridsVector[m_iYGridNo][m_iXGridNo].m_iFieldGridType = 4;
         stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
         stBaseMoveIntruder = a_4255.getInstance().a_4256(8389127);
         if(stBaseMoveIntruder)
         {
            stBaseMoveIntruder.SpecialSkillCallBack(1,this,hp,false);
            stBaseMoveIntruder.a_1797((1 << 16) + m_iYGridNo * 100 + m_iXGridNo,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389127;
            stBaseMoveIntruder.x = m_iXGridNo * a_3491.a_1080;
            stBaseMoveIntruder.y = m_iYGridNo * a_3491.a_1081;
            if(stTargetFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stTargetFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(stBaseMoveIntruder,stTargetFieldGrid.m_iXGridNo,stTargetFieldGrid.m_iYGridNo);
            }
            stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stTargetFieldGrid,true,BattleLayerDefine.INTRUDER_LAND_TYPE);
            this.m_arrBaler.push(stBaseMoveIntruder);
         }
         this.m_arrBalerGrid.push(m_iYGridNo * 100 + m_iXGridNo);
         return true;
      }
      
      public function Remove(iNoX:int, iNoY:*) : void
      {
         var iNo:int = iNoY * 100 + iNoX;
         var iIndex:int = this.m_arrUseGrid.indexOf(iNo);
         if(iIndex != -1)
         {
            this.m_arrUseGrid.splice(iIndex,1);
         }
      }
      
      public function CanCreate(iXGridNo:int, iYGridNo:int) : Boolean
      {
         var stFieldGrid:a_3491 = this.m_stCurrentBattleFieldView.stFieldGridsVector[iYGridNo][iXGridNo];
         if(stFieldGrid == null)
         {
            return false;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            return false;
         }
         if(null != stFieldGrid.m_stAttackFighter)
         {
            return false;
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            return false;
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            return false;
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            return false;
         }
         var iCNo:int = iYGridNo * 100 + iXGridNo;
         if(this.m_arrUseGrid.indexOf(iCNo) != -1)
         {
            return false;
         }
         if(this.m_arrBalerGrid.indexOf(iCNo) != -1)
         {
            return false;
         }
         return true;
      }
      
      public function GetRandomUseGrid(iLine:int) : Array
      {
         var k:int = 0;
         var iNo:int = -1;
         var buildList:Array = new Array();
         for(var i:int = 0; i < 7; i++)
         {
            if(i != 3 && i != 5 && i != 7 && this.CanCreate(i,iLine))
            {
               buildList.push(iLine * 100 + i);
            }
         }
         if(buildList.length > 0)
         {
            iNo = int(buildList[this.m_stRandomSeed.nextInt(buildList.length)]);
            this.m_arrUseGrid.push(iNo);
            return new Array(iNo % 100,Math.floor(iNo / 100),1);
         }
         for(var j:int = 0; j < 7; j++)
         {
            for(k = 0; k < 7; k++)
            {
               if(iLine != j && k != 3 && k != 5 && k != 7)
               {
                  if(this.CanCreate(k,j))
                  {
                     buildList.push(j * 100 + k);
                  }
               }
            }
         }
         if(buildList.length > 0)
         {
            iNo = int(buildList[this.m_stRandomSeed.nextInt(buildList.length)]);
            this.m_arrUseGrid.push(iNo);
            return new Array(iNo % 100,Math.floor(iNo / 100),1);
         }
         var randomX:int = -1;
         var randomY:int = -1;
         var find:int = 0;
         var count:int = 0;
         while(true)
         {
            randomX = int(this.m_stRandomSeed.nextInt(7));
            randomY = int(this.m_stRandomSeed.nextInt(7));
            if(!(randomX == 3 || randomX == 5 || randomX == 7))
            {
               iNo = randomY * 100 + randomX;
               count++;
               if(this.m_arrUseGrid.indexOf(iNo) == -1 && this.m_arrBalerGrid.indexOf(iNo) == -1)
               {
                  find = 1;
                  break;
               }
               if(count >= 50)
               {
                  break;
               }
            }
         }
         this.m_arrUseGrid.push(iNo);
         return new Array(randomX,randomY,find);
      }
      
      public function GetRandomIdx(count:int) : int
      {
         return this.m_stRandomSeed.nextInt(count);
      }
   }
}

