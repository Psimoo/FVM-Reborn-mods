package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear.SummerStar
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
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class NightSuspensionParticleGameMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_iAppearedTime:int;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      private var m_arrEffect:Array = new Array();
      
      private var m_OutArray:Array = new Array();
      
      private var m_TotalObstaclePos:Array = new Array([0,6],[0,8],[6,6],[6,8]);
      
      private var m_FlyGranuleMouseArr:Array = new Array();
      
      private var m_LastBornField:a_3491;
      
      private var m_iWaveStatus:int;
      
      private var m_isBroken:Boolean;
      
      public function NightSuspensionParticleGameMap()
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
      
      override public function a_4177() : void
      {
         this.removeEffectMovie();
         super.a_4177();
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var i:int = 0;
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
               for(j = 0; j < this.m_TotalObstaclePos.length; j++)
               {
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[this.m_TotalObstaclePos[j][0]][this.m_TotalObstaclePos[j][1]].m_iFieldGridType = 4;
               }
               this.removeEffectMovie();
               this.m_iAppearedTime = 0;
               this.m_LastBornField = null;
               this.m_iWaveStatus = -1;
               enterRoom = a_2161.e.getEnterRoom();
               this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
            }
         }
         return true;
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         return true;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stTempFieldGrid:a_3491 = null;
         var stBaseShot:a_4348 = null;
         var arrFireXRang:Array = null;
         if(this.m_iAppearedTime == 0)
         {
            this.m_iAppearedTime = iTimeNum;
         }
         this.m_iCurrentTimeIntval = iTimeNum - this.m_iAppearedTime;
         if(this.m_iCurrentTimeIntval % (40 * 20) == 0 && this.m_iCurrentTimeIntval != 0)
         {
            this.addFlyGranuleMouse();
         }
         var isChanged:Boolean = false;
         var i:int = 0;
         if(iTimeNum % 2 == 0)
         {
            for(i = 0; i < BattleFieldView.a_1012; i++)
            {
               arrFireXRang = this.GetFireHurtXRangByRow(i);
               for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[i].slice())
               {
                  if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
                  {
                     stBaseShot.a_4350();
                  }
               }
            }
         }
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
         if(this.m_FlyGranuleMouseArr.length >= 3)
         {
            return false;
         }
         do
         {
            m_iXGridNo = this.m_stRandomSeed.nextInt(5) + 2;
            m_iYGridNo = this.m_stRandomSeed.nextInt(4) + 1;
            stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
         }
         while(this.m_LastBornField != null && this.m_LastBornField.m_iXGridNo == stTargetFieldGrid.m_iXGridNo);
         stBaseMoveIntruder = a_4255.getInstance().a_4256(8389008);
         if(stBaseMoveIntruder)
         {
            stBaseMoveIntruder.SpecialSkillCallBack(stTargetFieldGrid,100000,a_3491.a_1080 / (3 * 20));
            stBaseMoveIntruder.a_1797((1 << 16) + stTargetFieldGrid.m_iYGridNo + 30,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389008;
            stBaseMoveIntruder.x = stTargetFieldGrid.m_iXGridNo * a_3491.a_1080;
            stBaseMoveIntruder.y = stTargetFieldGrid.m_iYGridNo * a_3491.a_1081;
            this.m_FlyGranuleMouseArr.push(stBaseMoveIntruder);
            this.m_LastBornField = stTargetFieldGrid;
            stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stTargetFieldGrid,true,BattleLayerDefine.INTRUDER_SKY_TYPE);
         }
         return true;
      }
      
      override public function OnWaveStatusDataByServer(iWaveStatus:int) : void
      {
         if(iWaveStatus == 1 && this.m_iWaveStatus != 1)
         {
            this.m_iWaveStatus = iWaveStatus;
            this.addBaseLaserEffect();
         }
      }
      
      private function addBaseLaserEffect() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var stEffect:BaseLaserEffect = null;
         stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(6,0);
         if(stTargetFieldGrid != null)
         {
            stEffect = BaseLaserEffect.a_3926();
            stEffect.stOriginalFieldGrid = stTargetFieldGrid;
            stEffect.a_1797(false);
            stEffect.x = (stTargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            stEffect.y = stTargetFieldGrid.m_iYGridNo * a_3491.a_1081;
            this.m_stCurrentBattleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stTargetFieldGrid);
            this.m_arrEffect.push(stEffect);
         }
         stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(8,0);
         if(stTargetFieldGrid != null)
         {
            stEffect = BaseLaserEffect.a_3926();
            stEffect.stOriginalFieldGrid = stTargetFieldGrid;
            stEffect.a_1797(false);
            stEffect.x = (stTargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            stEffect.y = stTargetFieldGrid.m_iYGridNo * a_3491.a_1081;
            this.m_stCurrentBattleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stTargetFieldGrid);
            this.m_arrEffect.push(stEffect);
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
      
      protected function IsShotInXRang(numXShotPos:Number, arrXRang:Array) : Boolean
      {
         var arrXTempRang:Array = null;
         for each(arrXTempRang in arrXRang)
         {
            if(numXShotPos > arrXTempRang[0] && numXShotPos < arrXTempRang[1])
            {
               return true;
            }
         }
         return false;
      }
      
      protected function GetFireHurtXRangByRow(iYIndexNum:int) : Array
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var arrXFireRange:Array = [];
         for(var i:int = 0; i < this.m_TotalObstaclePos.length; i++)
         {
            if(this.m_TotalObstaclePos[i][0] == iYIndexNum)
            {
               m_iYGridNo = int(this.m_TotalObstaclePos[i][0]);
               m_iXGridNo = int(this.m_TotalObstaclePos[i][1]);
               if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[m_iYGridNo][m_iXGridNo]))
               {
                  arrXFireRange.push([a_3491.a_1080 * (m_iXGridNo + 0),a_3491.a_1080 * (m_iXGridNo + 1)]);
               }
            }
         }
         return arrXFireRange;
      }
      
      protected function IsExistDefenseForGrid(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid.a_3492())
         {
            return true;
         }
         return false;
      }
   }
}

