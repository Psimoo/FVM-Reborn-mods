package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear.Almonds
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
   
   public class DayAlmondsGameMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      private var m_arrSkyAirShipFansEffect:Array = [];
      
      private var m_arrFieldGridExistFans:Array = [];
      
      private var m_TotalObstaclePos:Array = new Array([0,5],[1,5],[2,4],[3,4],[4,3],[5,2],[6,2]);
      
      private var m_stEyeofwind:EyeOfWindEffect;
      
      private var m_FlyGranuleMouseArr:Array = new Array();
      
      private var m_iCreateTickCount:int = 0;
      
      private var m_iLastCreateTick:int = 0;
      
      private var m_iCreatePosition:int = 0;
      
      public function DayAlmondsGameMap()
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
      
      override public function a_4177() : void
      {
         if(this.m_stEyeofwind)
         {
            this.m_stEyeofwind.a_3940();
            this.m_stEyeofwind = null;
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
            }
         }
         return true;
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
      
      public function CreateEyeOfWind() : void
      {
         var effect:EyeOfWindEffect = EyeOfWindEffect.a_3926();
         effect.a_1797(false);
         effect.InitFiledGrid(this.m_stCurrentBattleFieldView,7,5);
         this.m_stEyeofwind = effect;
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
            stBaseMoveIntruder.SpecialSkillCallBack(null,100000,a_3491.a_1080 / (3 * 20),initPosY,initPosX);
            stBaseMoveIntruder.a_1797((1 << 16) + m_iYGridNo + 30,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389008;
            this.m_FlyGranuleMouseArr.push(stBaseMoveIntruder);
            stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stTargetFieldGrid,true,BattleLayerDefine.INTRUDER_SKY_TYPE);
         }
         return true;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stSkyAirShipFansEffect:SkyAirShipFansEffect = null;
         var arrBaseMoveIntruderVector:Array = null;
         var stMoveIntruder:a_4206 = null;
         var stTempFieldGrid:a_3491 = null;
         this.m_iCurrentTimeIntval = iTimeNum;
         if(iTimeNum == 20 * 20)
         {
            this.CreateEyeOfWind();
         }
         if(Boolean(this.m_stEyeofwind) && this.m_stEyeofwind.m_bUse == true)
         {
            this.m_stEyeofwind.OnLogicUpdate(iTimeNum);
         }
         if(this.m_iCurrentTimeIntval != 0)
         {
            if(iTimeNum - this.m_iLastCreateTick == 5 * 20 && this.m_iCreateTickCount < 2)
            {
               this.addFlyGranuleMouse();
               ++this.m_iCreateTickCount;
               this.m_iLastCreateTick = iTimeNum;
            }
            if(iTimeNum - this.m_iLastCreateTick == 32 * 20 && this.m_iCreateTickCount == 2)
            {
               this.m_iCreatePosition = this.m_stRandomSeed.nextInt(3);
               this.addFlyGranuleMouse();
               this.m_iCreateTickCount = 1;
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

