package com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.LanternFestival
{
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.EffectManager;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.BaseGameMoveMap;
   
   public class LanternFestivalBaseGameMap extends BaseGameMoveMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      public var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      protected var m_OutArray:Array = [[7,0],[8,0],[7,2],[8,2],[7,4],[8,4],[7,6],[8,6]];
      
      protected var m_TotalObstaclePos:Array = new Array();
      
      protected var m_arrPot:Array = [[7,1,null],[8,1,null],[7,3,null],[8,3,null],[7,5,null],[8,5,null]];
      
      public function LanternFestivalBaseGameMap()
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
      
      override protected function InitGameMoveMapData() : void
      {
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
         var enterRoom:Object = null;
         var i:int = 0;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               enterRoom = a_2161.e.getEnterRoom();
               this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
               i = 0;
               for(i = 0; i < this.m_OutArray.length; i++)
               {
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[this.m_OutArray[i][1]][this.m_OutArray[i][0]].m_iFieldGridType = 8;
               }
               for(i = 0; i < this.m_TotalObstaclePos.length; i++)
               {
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[this.m_TotalObstaclePos[i][1]][this.m_TotalObstaclePos[i][0]].m_iFieldGridType = 4;
               }
               for(i = 0; i < this.m_arrPot.length; i++)
               {
                  this.CreatePot(this.m_arrPot[i]);
               }
            }
         }
         return true;
      }
      
      public function CreateRice(iNoX:int, iNoY:int) : void
      {
         var stEffect:RaceDumpingEffect = null;
         stEffect = EffectManager.getInstance().CheckOutOne(RaceDumpingEffect,RaceDumpingEffectMovie) as RaceDumpingEffect;
         this.m_stCurrentBattleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
         stEffect.x = a_3491.a_1080 * (iNoX + 0.5);
         stEffect.y = a_3491.a_1081 * (iNoY + 0.5);
         var xx:LanternFestivalBaseGameMap = this as LanternFestivalBaseGameMap;
         stEffect.InitData(xx,this.m_stCurrentBattleFieldView,iNoX,iNoY);
      }
      
      public function CreatePot(arr:Array) : void
      {
         var grid:a_3491 = null;
         var stEffect:CookingPotEffect = null;
         grid = this.m_stCurrentBattleFieldView.stFieldGridsVector[arr[1]][arr[0]];
         if(grid == null)
         {
            return;
         }
         grid.m_iFieldGridType = 8;
         stEffect = EffectManager.getInstance().CheckOutOne(CookingPotEffect,CookingPotEffectMovie) as CookingPotEffect;
         this.m_stCurrentBattleFieldView.AddToBattleView(stEffect,BattleLayerDefine.INTRUDER_LAND_TYPE,grid);
         stEffect.x = a_3491.a_1080 * (arr[0] + 0.5);
         stEffect.y = a_3491.a_1081 * (arr[1] + 0.5);
         stEffect.InitData(grid);
         arr[2] = stEffect;
      }
      
      public function TriggerPot(iNoX:int, iNoY:int) : Boolean
      {
         var cookingPotEffect:CookingPotEffect = null;
         var i:int = 0;
         for(i = 0; i < this.m_arrPot.length; i++)
         {
            if(this.m_arrPot[i][0] == iNoX && this.m_arrPot[i][1] == iNoY && this.m_arrPot[i][1] != null)
            {
               cookingPotEffect = this.m_arrPot[i][2];
               cookingPotEffect.AddPot();
               return true;
            }
         }
         return false;
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         return true;
      }
   }
}

