package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear.Duonanzi
{
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.effect.SkyAirShipFansEffect;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   
   public class DuonanziNebulaGameMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      private var m_arrSkyAirShipFansEffect:Array = [];
      
      private var m_arrFieldGridExistFans:Array = [];
      
      private var m_iWaveCount:* = 0;
      
      private var m_TotalObstaclePos:Array = new Array([1,2],[1,3],[1,4],[1,5],[1,6],[2,2],[2,3],[2,4],[2,5],[2,6],[3,2],[3,3],[3,4],[3,5],[3,6],[4,2],[4,3],[4,4],[4,5],[4,6],[5,2],[5,3],[5,4],[5,5],[5,6]);
      
      private var lColdStarRingGridEffect:Array = new Array();
      
      private var m_FlyGranuleMouseArr:Array = new Array();
      
      private var m_LastBornField:a_3491;
      
      private var m_iCreateTickCount:int = 0;
      
      private var m_iLastCreateTick:int = 0;
      
      private var m_iCreatePosition:int = 0;
      
      private var m_stEyeofwind:DuonaziEyeOfWindEffect;
      
      private var m_stEyeofwind2:DuonaziEyeOfWindEffect;
      
      private var m_iWaveStatus:int;
      
      public function DuonanziNebulaGameMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
      
      override public function OnWaveStatusDataByServer(iWaveStatus:int) : void
      {
         if(iWaveStatus == 2)
         {
            ++this.m_iWaveCount;
         }
      }
      
      override public function a_4177() : void
      {
         for(var i:int = 0; i < this.lColdStarRingGridEffect.length; i++)
         {
            this.lColdStarRingGridEffect[i].a_3940();
         }
         this.lColdStarRingGridEffect.length = 0;
         if(this.m_stEyeofwind)
         {
            this.m_stEyeofwind.a_3940();
            this.m_stEyeofwind = null;
         }
         if(this.m_stEyeofwind2)
         {
            this.m_stEyeofwind2.a_3940();
            this.m_stEyeofwind2 = null;
         }
         super.a_4177();
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var j:int = 0;
         var enterRoom:Object = null;
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
               this.m_iLastCreateTick = 0;
               this.m_iCreateTickCount = 0;
               enterRoom = a_2161.e.getEnterRoom();
               this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
               this.m_iCreatePosition = this.m_stRandomSeed.nextInt(3);
               this.m_iWaveCount = 0;
               this.m_iWaveStatus = -1;
            }
         }
         this.CreateDebulaMissif(4,3,10);
         this.CreateDebulaMissif(4,2,15);
         this.CreateDebulaMissif(4,4,15);
         this.CreateDebulaMissif(3,3,15);
         this.CreateDebulaMissif(5,3,15);
         this.CreateDebulaMissif(4,1,20);
         this.CreateDebulaMissif(5,2,20);
         this.CreateDebulaMissif(6,3,20);
         this.CreateDebulaMissif(5,4,20);
         this.CreateDebulaMissif(4,5,20);
         this.CreateDebulaMissif(3,4,20);
         this.CreateDebulaMissif(2,3,20);
         this.CreateDebulaMissif(3,2,20);
         this.CreateDebulaMissif(3,1,25);
         this.CreateDebulaMissif(5,1,25);
         this.CreateDebulaMissif(6,2,25);
         this.CreateDebulaMissif(6,4,25);
         this.CreateDebulaMissif(5,5,25);
         this.CreateDebulaMissif(3,5,25);
         this.CreateDebulaMissif(2,4,25);
         this.CreateDebulaMissif(2,2,25);
         return true;
      }
      
      public function CreateDebulaMissif(m_iXGridNo:int, m_iYGridNo:int, iWaitTick:int) : void
      {
         var stTargetFieldGrid:a_3491 = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
         if(stTargetFieldGrid == null)
         {
            return;
         }
         var effect:DuonanziNebulaMassifEffect = DuonanziNebulaMassifEffect.a_3926();
         if(effect)
         {
            effect.a_1797(false);
            effect.InitData(stTargetFieldGrid,iWaitTick);
            this.lColdStarRingGridEffect.push(effect);
         }
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         var stSkyAirShipFansEffect:SkyAirShipFansEffect = null;
         if(stData is Array && stData[0] == 2)
         {
            for each(stSkyAirShipFansEffect in this.m_arrSkyAirShipFansEffect.slice())
            {
               stSkyAirShipFansEffect.a_3940();
            }
            this.m_arrSkyAirShipFansEffect = [];
            this.m_arrFieldGridExistFans = [];
         }
         return true;
      }
      
      private function addFlyGranuleMouse() : Boolean
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         for(var i:* = 0; i < this.m_FlyGranuleMouseArr.length; i++)
         {
            stBaseMoveIntruder = this.m_FlyGranuleMouseArr[i];
            if(stBaseMoveIntruder.iLifeValue <= 0 || stBaseMoveIntruder.m_stCurrentFieldGrid == null || stBaseMoveIntruder.parent == null)
            {
               this.m_FlyGranuleMouseArr.splice(i,1);
               i--;
            }
         }
         if(this.m_FlyGranuleMouseArr.length >= 4)
         {
            return false;
         }
         var initPosY:int = -1;
         var initPosX:int = -1;
         if(this.m_iCreatePosition == 0)
         {
            initPosY = -60;
         }
         else if(this.m_iCreatePosition == 1)
         {
            initPosY = BattleFieldView.a_1014 + 60;
         }
         else if(this.m_iCreatePosition == 2)
         {
            initPosX = BattleFieldView.a_1013 + 60;
         }
         m_iXGridNo = this.m_stRandomSeed.nextInt(5) + 2;
         m_iYGridNo = this.m_stRandomSeed.nextInt(4) + 1;
         stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
         stBaseMoveIntruder = a_4255.getInstance().a_4256(8389008);
         if(stBaseMoveIntruder)
         {
            stBaseMoveIntruder.SpecialSkillCallBack(stTargetFieldGrid,100000,a_3491.a_1080 / (3 * 20),initPosY,initPosX);
            stBaseMoveIntruder.a_1797((1 << 16) + stTargetFieldGrid.m_iYGridNo + 30,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389008;
            this.m_FlyGranuleMouseArr.push(stBaseMoveIntruder);
            this.m_LastBornField = stTargetFieldGrid;
            stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stTargetFieldGrid,true,BattleLayerDefine.INTRUDER_SKY_TYPE);
         }
         return true;
      }
      
      override public function OnWaveStatusData(iWaveStatus:int) : void
      {
         if(iWaveStatus == 2 && this.m_iWaveStatus != 2)
         {
            this.m_iWaveStatus = iWaveStatus;
            this.CreateEyeOfWind();
         }
         else if(iWaveStatus == 4 && this.m_iWaveStatus != 4)
         {
            this.m_iWaveStatus = iWaveStatus;
            this.CreateEyeOfWind2();
         }
      }
      
      public function CreateEyeOfWind() : void
      {
         var effect:DuonaziEyeOfWindEffect = DuonaziEyeOfWindEffect.a_3926();
         effect.a_1797(false);
         if(this.m_stRandomSeed.nextInt(2) == 1)
         {
            effect.InitFiledGrid(this.m_stCurrentBattleFieldView,6,1);
         }
         else
         {
            effect.InitFiledGrid(this.m_stCurrentBattleFieldView,6,5);
         }
         this.m_stEyeofwind = effect;
      }
      
      public function CreateEyeOfWind2() : void
      {
         var effect:DuonaziEyeOfWindEffect = DuonaziEyeOfWindEffect.a_3926();
         effect.a_1797(false);
         if(this.m_stRandomSeed.nextInt(2) == 1)
         {
            effect.InitFiledGrid(this.m_stCurrentBattleFieldView,2,1);
         }
         else
         {
            effect.InitFiledGrid(this.m_stCurrentBattleFieldView,2,5);
         }
         this.m_stEyeofwind2 = effect;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stSkyAirShipFansEffect:SkyAirShipFansEffect = null;
         var arrBaseMoveIntruderVector:Array = null;
         var stMoveIntruder:a_4206 = null;
         var stTempFieldGrid:a_3491 = null;
         this.m_iCurrentTimeIntval = iTimeNum;
         for(var i:int = 0; i < this.lColdStarRingGridEffect.length; i++)
         {
            this.lColdStarRingGridEffect[i].OnLogicUpdate(iTimeNum);
         }
         if(Boolean(this.m_stEyeofwind) && this.m_stEyeofwind.m_bUse == false)
         {
            this.m_stEyeofwind = null;
         }
         if(Boolean(this.m_stEyeofwind2) && this.m_stEyeofwind2.m_bUse == false)
         {
            this.m_stEyeofwind2 = null;
         }
         var eyeCount1:int = 0;
         if(Boolean(this.m_stEyeofwind) && this.m_stEyeofwind.m_bUse == true)
         {
            this.m_stEyeofwind.OnLogicUpdate(iTimeNum);
            eyeCount1++;
         }
         if(Boolean(this.m_stEyeofwind2) && this.m_stEyeofwind2.m_bUse == true)
         {
            this.m_stEyeofwind2.OnLogicUpdate(iTimeNum);
            eyeCount1++;
         }
         if(eyeCount1 == 2)
         {
            this.m_stEyeofwind.m_iState = 1;
            this.m_stEyeofwind2.m_iState = 2;
         }
         else if(eyeCount1 == 1)
         {
            if(Boolean(this.m_stEyeofwind) && this.m_stEyeofwind.m_bUse == true)
            {
               this.m_stEyeofwind.m_iState = 0;
            }
            if(Boolean(this.m_stEyeofwind2) && this.m_stEyeofwind2.m_bUse == true)
            {
               this.m_stEyeofwind2.m_iState = 0;
            }
         }
         if(this.m_iCurrentTimeIntval != 0 && this.m_iWaveCount < 2)
         {
            if(iTimeNum - this.m_iLastCreateTick == 4 * 20 && this.m_iCreateTickCount < 3)
            {
               ++this.m_iCreateTickCount;
               this.addFlyGranuleMouse();
               this.m_iLastCreateTick = iTimeNum;
            }
            if(iTimeNum - this.m_iLastCreateTick == 32 * 20 && this.m_iCreateTickCount == 3)
            {
               this.m_iCreatePosition = this.m_stRandomSeed.nextInt(3);
               this.m_iCreateTickCount = 1;
               this.addFlyGranuleMouse();
               this.m_iLastCreateTick = iTimeNum;
            }
         }
         for each(stSkyAirShipFansEffect in this.m_arrSkyAirShipFansEffect)
         {
            stSkyAirShipFansEffect.a_4003(iTimeNum);
         }
         if(iTimeNum % 160 == 0)
         {
            arrBaseMoveIntruderVector = this.m_stCurrentBattleFieldView.m_arrBaseMoveIntruderVector;
            for each(stTempFieldGrid in this.m_arrFieldGridExistFans)
            {
               for each(stMoveIntruder in stTempFieldGrid.a_1511.slice())
               {
                  if(stMoveIntruder.iLifeValue <= 1800 && stMoveIntruder.iSpaceState == 0)
                  {
                     stTempFieldGrid.a_3457(stMoveIntruder);
                     stTempFieldGrid.m_stCurrentBattbleFieldView.a_3457(stMoveIntruder);
                     if(-1 != arrBaseMoveIntruderVector.indexOf(stMoveIntruder))
                     {
                        arrBaseMoveIntruderVector.splice(arrBaseMoveIntruderVector.indexOf(stMoveIntruder),1);
                     }
                     this.m_stCurrentBattleFieldView.a_3459(stMoveIntruder,this.m_stCurrentBattleFieldView.a_3438(stTempFieldGrid.m_iXGridNo - 3,stTempFieldGrid.m_iYGridNo),false);
                     stMoveIntruder.x = a_3491.a_1080 * (stTempFieldGrid.m_iXGridNo - 2.5);
                  }
               }
            }
         }
      }
   }
}

