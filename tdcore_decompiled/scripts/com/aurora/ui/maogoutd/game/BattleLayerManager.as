package com.aurora.ui.maogoutd.game
{
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class BattleLayerManager extends Sprite
   {
      
      private var m_stEffectBottom2LayerSp:Sprite;
      
      private var m_stEffectBottomLayerSp:Sprite;
      
      private var m_stDefenseBattleLayer:BattleLayer;
      
      private var m_stIntruderBattleLayer:BattleLayer;
      
      private var m_stShotBattleLayer:Sprite;
      
      private var m_stEffectCenterLayer:BattleLayer;
      
      private var m_stObstacleLayer:BattleLayer;
      
      private var m_stBossBottomEffectLayer:Sprite;
      
      private var m_stIntruderSkyBattleLayer:BattleLayer;
      
      private var m_stSkyBossBattleLayer:BattleLayer;
      
      private var m_stEffectTopSp:Sprite;
      
      private var m_vBattleLayerInfo:Vector.<BattleLayerInfo>;
      
      public function BattleLayerManager()
      {
         super();
         this.a_3014();
      }
      
      private function a_3014() : void
      {
         var i:int = 0;
         if(this.m_stEffectBottomLayerSp)
         {
            return;
         }
         this.m_vBattleLayerInfo = new Vector.<BattleLayerInfo>();
         this.m_stEffectBottomLayerSp = new Sprite();
         this.m_stEffectBottom2LayerSp = new Sprite();
         this.m_stObstacleLayer = new BattleLayer(false,7);
         this.m_stDefenseBattleLayer = new BattleLayer(true,10);
         this.m_stIntruderBattleLayer = new BattleLayer(false,7);
         this.m_stEffectCenterLayer = new BattleLayer(false,7);
         this.m_stShotBattleLayer = new Sprite();
         this.m_stBossBottomEffectLayer = new Sprite();
         this.m_stIntruderSkyBattleLayer = new BattleLayer(false,7);
         this.m_stSkyBossBattleLayer = new BattleLayer(false,7);
         this.m_stEffectTopSp = new Sprite();
         addChild(this.m_stEffectBottom2LayerSp);
         addChild(this.m_stEffectBottomLayerSp);
         for(i = 0; i < 7; i++)
         {
            addChild(this.m_stDefenseBattleLayer.m_vLayer[i]);
            addChild(this.m_stObstacleLayer.m_vLayer[i]);
            addChild(this.m_stIntruderBattleLayer.m_vLayer[i]);
            addChild(this.m_stEffectCenterLayer.m_vLayer[i]);
         }
         addChild(this.m_stBossBottomEffectLayer);
         for(i = 0; i < 7; i++)
         {
            addChild(this.m_stSkyBossBattleLayer.m_vLayer[i]);
            addChild(this.m_stIntruderSkyBattleLayer.m_vLayer[i]);
         }
         addChild(this.m_stShotBattleLayer);
         addChild(this.m_stEffectTopSp);
      }
      
      public function AddToBattleView(stDisplayObject:DisplayObject, iType:int, stTargetFieldGrid:a_3491 = null) : void
      {
         var compList:Array = null;
         var i:* = 0;
         var stBattleLayerInfo:BattleLayerInfo = null;
         var grid:a_3491 = null;
         if(Boolean(!this.IsWorldBossMap() && stTargetFieldGrid) && Boolean(stTargetFieldGrid.m_stCurrentBattbleFieldView) && stTargetFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap() != null)
         {
            if(!(stDisplayObject is a_4206 && (stDisplayObject as a_4206).m_bServerIssued))
            {
               compList = new Array();
               i = 0;
               for(i = 0; i < this.m_vBattleLayerInfo.length; i++)
               {
                  if(Boolean(this.m_vBattleLayerInfo[i].m_stDisplayObject) && this.m_vBattleLayerInfo[i].m_stDisplayObject == stDisplayObject)
                  {
                     compList.push(i);
                  }
               }
               if(compList.length > 0)
               {
                  for(i = int(compList.length - 1); i >= 0; i--)
                  {
                     this.m_vBattleLayerInfo[compList[i]].a_4330();
                     this.m_vBattleLayerInfo.splice(compList[i],1);
                  }
               }
               stBattleLayerInfo = BattleLayerInfo.a_3926();
               this.m_vBattleLayerInfo.push(stBattleLayerInfo);
               stBattleLayerInfo.m_iType = iType;
               stBattleLayerInfo.m_stDisplayObject = stDisplayObject;
               grid = (this.parent as BattleFieldView).a_3438(stTargetFieldGrid.m_iXGridNo,stTargetFieldGrid.m_iYGridNo);
               stBattleLayerInfo.a_1598.m_iInitialXGridNo = grid.m_iInitialXGridNo;
               stBattleLayerInfo.a_1598.m_iInitialYGridNo = grid.m_iInitialYGridNo;
               stBattleLayerInfo.a_1598.m_iXGridNo = stTargetFieldGrid.m_iXGridNo;
               stBattleLayerInfo.a_1598.m_iYGridNo = stTargetFieldGrid.m_iYGridNo;
            }
         }
         this.AddToLayer(stDisplayObject,iType,stTargetFieldGrid);
      }
      
      private function IsWorldBossMap() : Boolean
      {
         var iMapID:int = 0;
         if(Boolean(root) && Boolean(root.hasOwnProperty("m_stGameData")) && Boolean((root as Object).m_stGameData))
         {
            iMapID = int((root as Object).m_stGameData["iMapID"]);
            if((iMapID & 0xF0000000) == 1879048192)
            {
               return true;
            }
         }
         return false;
      }
      
      private function AddToLayer(stDisplayObject:DisplayObject, iType:int, stBindFieldGrid:a_3491 = null) : void
      {
         switch(iType)
         {
            case BattleLayerDefine.EFFECTS_BASE2_TYPE:
               this.m_stEffectBottom2LayerSp.addChild(stDisplayObject);
               break;
            case BattleLayerDefine.EFFECTS_BASE_TYPE:
            case BattleLayerDefine.DEFENSE_BOTTOM_TOOL_TYPE:
            case BattleLayerDefine.INTRUDER_BOTTOM_TYPE:
               this.m_stEffectBottomLayerSp.addChild(stDisplayObject);
               break;
            case BattleLayerDefine.DEFENSE_TRAY_TYPE:
               this.m_stDefenseBattleLayer.AddToLayer(stDisplayObject,stBindFieldGrid,0);
               break;
            case BattleLayerDefine.DEFENSE_SHADOW_TYPE:
               this.m_stDefenseBattleLayer.AddToLayer(stDisplayObject,stBindFieldGrid,1);
               break;
            case BattleLayerDefine.EFFECT_LAYER_TRAY_BOTTOM_TYPE:
               this.m_stDefenseBattleLayer.AddToLayer(stDisplayObject,stBindFieldGrid,2);
               break;
            case BattleLayerDefine.DEFENSE_PROTECTOR_BEFORE_TYPE:
               this.m_stDefenseBattleLayer.AddToLayer(stDisplayObject,stBindFieldGrid,3);
               break;
            case BattleLayerDefine.DEFENSE_ATTACK_FIGHTER_TYPE:
               this.m_stDefenseBattleLayer.AddToLayer(stDisplayObject,stBindFieldGrid,4);
               break;
            case BattleLayerDefine.DEFENSE_BOOM_TYPE:
               this.m_stDefenseBattleLayer.AddToLayer(stDisplayObject,stBindFieldGrid,5);
               break;
            case BattleLayerDefine.DEFENSE_FLOWER_TYPE:
               this.m_stDefenseBattleLayer.AddToLayer(stDisplayObject,stBindFieldGrid,6);
               break;
            case BattleLayerDefine.DEFENSE_PROTECTOR_AFTER_TYPE:
               this.m_stDefenseBattleLayer.AddToLayer(stDisplayObject,stBindFieldGrid,7);
               break;
            case BattleLayerDefine.DEFENSE_AUXILIARY_FIGHTER_TYPE:
               this.m_stDefenseBattleLayer.AddToLayer(stDisplayObject,stBindFieldGrid,8);
               break;
            case BattleLayerDefine.INTRUDER_WATER_TYPE:
            case BattleLayerDefine.INTRUDER_LAND_TYPE:
               this.m_stIntruderBattleLayer.AddToLayer(stDisplayObject,stBindFieldGrid,stBindFieldGrid.m_iYGridNo);
               break;
            case BattleLayerDefine.BOSS_BOTTOM_EFFECT_TYPE:
               this.m_stBossBottomEffectLayer.addChild(stDisplayObject);
               break;
            case BattleLayerDefine.INTRUDER_SKY_TYPE:
               this.m_stIntruderSkyBattleLayer.AddToLayer(stDisplayObject,stBindFieldGrid,stBindFieldGrid.m_iYGridNo);
               break;
            case BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE:
               this.m_stSkyBossBattleLayer.AddToLayer(stDisplayObject,stBindFieldGrid,stBindFieldGrid.m_iYGridNo);
               break;
            case BattleLayerDefine.SHOT_TYPE:
               this.m_stShotBattleLayer.addChild(stDisplayObject);
               break;
            case BattleLayerDefine.EFFECT_LAYER_TOP_TYPE:
            case BattleLayerDefine.DEFENSE_TOP_TOOL_TYPE:
               this.m_stEffectCenterLayer.AddToLayer(stDisplayObject,stBindFieldGrid,stBindFieldGrid.m_iYGridNo);
               break;
            case BattleLayerDefine.EFFECTS_TOP_TYPE:
               this.m_stEffectTopSp.addChild(stDisplayObject);
               break;
            case BattleLayerDefine.OBSTACL_TYPE:
               this.m_stObstacleLayer.AddToLayer(stDisplayObject,stBindFieldGrid,stBindFieldGrid.m_iYGridNo);
               break;
            default:
               throw new Error("报错了，未知型号");
         }
      }
      
      public function Sort() : void
      {
         var stBattleLayerInfo:BattleLayerInfo = null;
         var stFieldGird:a_3491 = null;
         var targetGrid:a_3491 = null;
         if(this.IsWorldBossMap())
         {
            return;
         }
         for each(stBattleLayerInfo in this.m_vBattleLayerInfo)
         {
            targetGrid = stBattleLayerInfo.a_1598;
            if(Boolean(targetGrid && stBattleLayerInfo.m_stDisplayObject) && Boolean(stBattleLayerInfo.m_stDisplayObject.parent) && stBattleLayerInfo.m_stDisplayObject.parent != GameCardView.a_1089)
            {
               stFieldGird = (this.parent as BattleFieldView).GetInitialFieldGrid(targetGrid.m_iInitialXGridNo,targetGrid.m_iInitialYGridNo);
               if(stFieldGird.m_iYGridNo != targetGrid.m_iYGridNo)
               {
                  targetGrid.m_iYGridNo = stFieldGird.m_iYGridNo;
                  this.AddToLayer(stBattleLayerInfo.m_stDisplayObject,stBattleLayerInfo.m_iType,targetGrid);
               }
            }
            else
            {
               this.m_vBattleLayerInfo.splice(this.m_vBattleLayerInfo.indexOf(stBattleLayerInfo),1);
               stBattleLayerInfo.a_4330();
            }
         }
      }
      
      public function CleanUp() : void
      {
         var stBattleLayerInfo:BattleLayerInfo = null;
         var stFieldGird:a_3491 = null;
         while(this.m_vBattleLayerInfo.length)
         {
            stBattleLayerInfo = this.m_vBattleLayerInfo.pop();
            stBattleLayerInfo.a_4330();
         }
      }
   }
}

