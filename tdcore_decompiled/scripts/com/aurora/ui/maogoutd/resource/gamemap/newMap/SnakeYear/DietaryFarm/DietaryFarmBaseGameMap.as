package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.DietaryFarm
{
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.BaseGameMoveMap;
   
   public class DietaryFarmBaseGameMap extends BaseGameMoveMap
   {
      
      public static var a_1445:a_4187 = new a_4187();
      
      protected var m_stCurrentBattleFieldView:BattleFieldView;
      
      public var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      protected var m_OutArray:Array = new Array();
      
      protected var m_WaterArray:Array = new Array();
      
      protected var m_Barrier1Array:Array = new Array();
      
      protected var m_Barrier2Array:Array = new Array();
      
      protected var m_iRunTick:int = 0;
      
      public function DietaryFarmBaseGameMap()
      {
         super();
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
      }
      
      override protected function InitGameMoveMapData() : void
      {
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var i:int = 0;
         var j:int = 0;
         var grid:a_3491 = null;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            this.m_iRunTick = 0;
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            i = 0;
            j = 0;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stRandomSeed.setSeed(100,500);
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               for(j = 0; j < this.m_Barrier1Array.length; j++)
               {
                  grid = this.m_stCurrentBattleFieldView.a_3438(this.m_Barrier1Array[j][0],this.m_Barrier1Array[j][1]);
                  if(grid != null)
                  {
                     grid.m_iFieldGridType = 8;
                  }
               }
               for(j = 0; j < this.m_Barrier2Array.length; j++)
               {
                  grid = this.m_stCurrentBattleFieldView.a_3438(this.m_Barrier2Array[j][0],this.m_Barrier2Array[j][1]);
                  if(grid != null)
                  {
                     grid.m_iFieldGridType = 4;
                  }
               }
               for(j = 0; j < this.m_WaterArray.length; j++)
               {
                  grid = this.m_stCurrentBattleFieldView.a_3438(this.m_WaterArray[j][0],this.m_WaterArray[j][1]);
                  if(grid != null)
                  {
                     grid.m_isNeedTray = true;
                  }
               }
               for(j = 0; j < this.m_OutArray.length; j++)
               {
                  this.CreateCup(this.m_OutArray[j]);
               }
            }
         }
         return true;
      }
      
      public function CreateCup(arr:Array) : DietaryFarmCupMoveIntruder
      {
         var fieldGrid:a_3491 = null;
         var cup:DietaryFarmCupMoveIntruder = null;
         fieldGrid = this.m_stCurrentBattleFieldView.a_3438(arr[0],arr[1]);
         if(fieldGrid == null)
         {
            return null;
         }
         if(a_1445.m_iBattleFieldStageType == 1)
         {
            cup = DietaryFarmCupDayMoveIntruder.a_3926();
         }
         else
         {
            cup = DietaryFarmCupNightMoveIntruder.a_3926();
         }
         cup.stFieldGrid = fieldGrid;
         cup.a_1797(false);
         this.m_stCurrentBattleFieldView.AddToBattleView(cup,BattleLayerDefine.INTRUDER_LAND_TYPE,fieldGrid);
         cup.x = a_3491.a_1080 * fieldGrid.m_iXGridNo;
         cup.y = a_3491.a_1081 * fieldGrid.m_iYGridNo - 40;
         arr[2] = cup;
         this.m_stCurrentBattleFieldView.m_arrEffectArray.push(cup);
         if(this.m_stCurrentBattleFieldView.GetGameMoveMap() != null)
         {
            this.m_stCurrentBattleFieldView.GetGameMoveMap().AddMoveDisplayObject(cup,fieldGrid.m_iXGridNo,fieldGrid.m_iYGridNo);
         }
         cup.play();
         return cup;
      }
      
      public function CreateMouse(hp:int, deadHp:int, arr:Array, waitTick:int) : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:DietaryFarmJuBaoMoveIntruder = null;
         stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(8,3);
         stBaseMoveIntruder = DietaryFarmJuBaoMoveIntruder.a_3926();
         if(stBaseMoveIntruder)
         {
            stBaseMoveIntruder.InitData(hp,deadHp,arr,waitTick);
            stBaseMoveIntruder.a_1797((1 << 16) + 99,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
            stTargetFieldGrid.m_stMouseObstacle = stBaseMoveIntruder;
            this.m_stCurrentBattleFieldView.a_3459(stBaseMoveIntruder,stTargetFieldGrid,false);
            stBaseMoveIntruder.x = stTargetFieldGrid.m_iXGridNo * a_3491.a_1080;
            stBaseMoveIntruder.y = stTargetFieldGrid.m_iYGridNo * a_3491.a_1081;
         }
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         super.OnTimeInterval(iTimeNum);
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         return true;
      }
      
      override public function a_4177() : void
      {
         var i:int = 0;
         ReleaseMoveMap();
         super.a_4177();
      }
   }
}

