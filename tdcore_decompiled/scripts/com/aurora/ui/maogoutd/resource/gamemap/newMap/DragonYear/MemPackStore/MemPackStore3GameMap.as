package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear.MemPackStore
{
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   
   public class MemPackStore3GameMap extends BaseGameMap implements IMemPackMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_arrBaler:Array = new Array();
      
      private var m_iCalTick:int = 0;
      
      private var m_iBalerState:int = 0;
      
      private var m_OutArray:Array = new Array();
      
      private var BarrierArray:Array = new Array([1,7],[3,7],[5,7]);
      
      private var m_TotalObstaclePos:Array = new Array([1,6],[3,6],[5,6]);
      
      private var m_arrUseGrid:Array = new Array();
      
      private var m_arrBalerGrid:Array = new Array();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      public function MemPackStore3GameMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 1;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var i:int = 0;
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
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
         if(iTimeNum % 10 == 0)
         {
            for(i = 0; i < this.BarrierArray.length; i++)
            {
               m_iXGridNo = int(this.BarrierArray[i][1]);
               m_iYGridNo = int(this.BarrierArray[i][0]);
               stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               if(stTargetFieldGrid != null && stTargetFieldGrid.ClimbIsEmpty())
               {
                  stTargetFieldGrid.InitClimb();
               }
            }
         }
      }
      
      private function SetBalerState(state:int) : void
      {
         for(var i:int = 0; i < this.m_arrBaler.length; i++)
         {
            this.m_arrBaler[i].SpecialSkillCallBack(2,state);
         }
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var i:int = 0;
         var k:int = 0;
         var j:int = 0;
         var enterRoom:Object = null;
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
               for(k = 0; k < this.BarrierArray.length; k++)
               {
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[this.BarrierArray[k][0]][this.BarrierArray[k][1]].m_iFieldGridType = 4;
               }
               for(j = 0; j < this.m_TotalObstaclePos.length; j++)
               {
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[this.m_TotalObstaclePos[j][0]][this.m_TotalObstaclePos[j][1]].m_iFieldGridType = 4;
               }
               this.m_arrUseGrid = [];
               this.m_arrBalerGrid = [107,307,507];
               this.m_arrBaler = [];
               this.m_iCalTick = 0;
               this.m_iBalerState = 0;
               enterRoom = a_2161.e.getEnterRoom();
               this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
               this.AddBalerMouse(6,1,4000);
               this.AddBalerMouse(6,3,4000);
               this.AddBalerMouse(6,5,4000);
            }
         }
         return true;
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         return true;
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
            stBaseMoveIntruder.SpecialSkillCallBack(1,this,hp,true);
            stBaseMoveIntruder.a_1797((1 << 16) + m_iYGridNo * 100 + m_iXGridNo,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389127;
            stBaseMoveIntruder.x = m_iXGridNo * a_3491.a_1080;
            stBaseMoveIntruder.y = m_iYGridNo * a_3491.a_1081;
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
            if(this.CanCreate(i,iLine))
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
               if(iLine != j)
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
         do
         {
            randomX = int(this.m_stRandomSeed.nextInt(7));
            randomY = int(this.m_stRandomSeed.nextInt(7));
            iNo = randomY * 100 + randomX;
            count++;
            if(this.m_arrUseGrid.indexOf(iNo) == -1 && this.m_arrBalerGrid.indexOf(iNo) == -1)
            {
               find = 1;
               break;
            }
         }
         while(count < 50);
         this.m_arrUseGrid.push(iNo);
         return new Array(randomX,randomY,find);
      }
      
      public function GetRandomIdx(count:int) : int
      {
         return this.m_stRandomSeed.nextInt(count);
      }
   }
}

