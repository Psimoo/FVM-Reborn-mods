package com.aurora.ui.maogoutd.resource.gamemap.newMap.RabbitYear
{
   import a_4718.b_182;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.VolcanicFireEffect;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.BaseGameMoveMap;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockData;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockFieldGrid;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockMap;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class WaterFeastDayThirdGameMoveMap extends BaseGameMoveMap
   {
      
      private static var ms_arrVolcanicFireEffects:Array;
      
      private static const DEEP_INDEX:int = 1;
      
      private var a_1445:a_4187 = new a_4187();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      private var WaterWheelPosition:Array = new Array([5,0,0,2],[5,1,0,-8],[5,5,0,10],[5,6,0,1]);
      
      private var m_arrWaterWheelEffect:Array = [];
      
      public function WaterFeastDayThirdGameMoveMap()
      {
         var iYIndex:int = 0;
         super();
         this.a_1445.m_iBattleFieldStageType = 1;
         this.a_1445.m_iBattleModType = 0;
         this.a_1445.m_iWeatherType = 0;
         if(null == ms_arrVolcanicFireEffects)
         {
            ms_arrVolcanicFireEffects = [];
            for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
            {
               ms_arrVolcanicFireEffects[iYIndex] = [];
            }
         }
      }
      
      override protected function InitGameMoveMapData() : void
      {
         var stMoveBlockMap:MoveBlockMap = null;
         var stMoveBlockData:MoveBlockData = null;
         var j:int = 0;
         stMoveBlockMap = new MoveBlockMap(-5,11);
         stMoveBlockData = new MoveBlockData();
         stMoveBlockData.m_iID = 0;
         stMoveBlockData.m_iDefultXGridNo = 0;
         stMoveBlockData.m_iDefultYGridNo = 2;
         stMoveBlockData.m_iHeight = 1;
         stMoveBlockData.m_iWidth = 5;
         stMoveBlockData.m_iStartXGridNo = 0;
         stMoveBlockData.m_iStartYGridNo = 2;
         stMoveBlockData.m_iEndXGridNo = 4;
         stMoveBlockData.m_iEndYGridNo = 2;
         stMoveBlockData.m_iSpeed = a_3491.a_1081 / (3 * 20);
         stMoveBlockData.m_iStartResidenceTime = 15 * 20;
         stMoveBlockData.m_iEndResideceTime = 15 * 20;
         stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
         stMoveBlockData.m_iDirectionType = 0;
         stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
         m_vMoveBlockMap.push(stMoveBlockMap);
         stMoveBlockMap = new MoveBlockMap(-5,10);
         stMoveBlockData = new MoveBlockData();
         stMoveBlockData.m_iID = 0;
         stMoveBlockData.m_iDefultXGridNo = 0;
         stMoveBlockData.m_iDefultYGridNo = 4;
         stMoveBlockData.m_iHeight = 1;
         stMoveBlockData.m_iWidth = 5;
         stMoveBlockData.m_iStartXGridNo = 0;
         stMoveBlockData.m_iStartYGridNo = 4;
         stMoveBlockData.m_iEndXGridNo = 4;
         stMoveBlockData.m_iEndYGridNo = 4;
         stMoveBlockData.m_iSpeed = a_3491.a_1081 / (3 * 20);
         stMoveBlockData.m_iStartResidenceTime = 15 * 20;
         stMoveBlockData.m_iEndResideceTime = 15 * 20;
         stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_RIGHT;
         stMoveBlockData.m_iDirectionType = 0;
         stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
         m_vMoveBlockMap.push(stMoveBlockMap);
         stMoveBlockMap = new MoveBlockMap(-5,10);
         stMoveBlockData = new MoveBlockData();
         stMoveBlockData.m_iID = 0;
         stMoveBlockData.m_iDefultXGridNo = 4;
         stMoveBlockData.m_iDefultYGridNo = 3;
         stMoveBlockData.m_iHeight = 1;
         stMoveBlockData.m_iWidth = 5;
         stMoveBlockData.m_iStartXGridNo = 0;
         stMoveBlockData.m_iStartYGridNo = 3;
         stMoveBlockData.m_iEndXGridNo = 4;
         stMoveBlockData.m_iEndYGridNo = 3;
         stMoveBlockData.m_iSpeed = a_3491.a_1081 / (3 * 20);
         stMoveBlockData.m_iStartResidenceTime = 15 * 20;
         stMoveBlockData.m_iEndResideceTime = 15 * 20;
         stMoveBlockData.m_iDefultDirection = MoveBlockFieldGrid.MOVE_LEFT;
         stMoveBlockData.m_iDirectionType = 0;
         stMoveBlockMap.InitBlockMap(stMoveBlockData,GetBitmapData);
         m_vMoveBlockMap.push(stMoveBlockMap);
      }
      
      override public function a_4176() : a_4187
      {
         return this.a_1445;
      }
      
      override public function a_4177() : void
      {
         var stMoveBlockMap:MoveBlockMap = null;
         var stMoveBlockData:MoveBlockData = null;
         ReleaseMoveMap();
         for each(stMoveBlockMap in m_vMoveBlockMap)
         {
            m_vMoveBlockMap.pop();
         }
         m_vMoveBlockMap = null;
         this.removeEffectMovie();
         super.a_4177();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stEffect:DayWaterWheelEffect = null;
         var iYIndex:int = 0;
         var stVolcanicFireEffect:VolcanicFireEffect = null;
         var stBaseShot:a_4348 = null;
         var arrFireXRang:Array = null;
         super.OnTimeInterval(iTimeNum);
         this.m_iCurrentTimeIntval = iTimeNum;
         if(iTimeNum % 20 == 0)
         {
            this.BurnFieldGridDefense(this.m_stCurrentBattleFieldView.stFieldGridsVector[0][8]);
            this.BurnFieldGridDefense(this.m_stCurrentBattleFieldView.stFieldGridsVector[1][8]);
            this.BurnFieldGridDefense(this.m_stCurrentBattleFieldView.stFieldGridsVector[5][8]);
            this.BurnFieldGridDefense(this.m_stCurrentBattleFieldView.stFieldGridsVector[6][8]);
         }
         if(iTimeNum % 6)
         {
            this.BurnFieldGridMoveIntruder(this.m_stCurrentBattleFieldView.stFieldGridsVector[0][8]);
            this.BurnFieldGridMoveIntruder(this.m_stCurrentBattleFieldView.stFieldGridsVector[1][8]);
            this.BurnFieldGridMoveIntruder(this.m_stCurrentBattleFieldView.stFieldGridsVector[5][8]);
            this.BurnFieldGridMoveIntruder(this.m_stCurrentBattleFieldView.stFieldGridsVector[6][8]);
            this.AddVolcanicFireEffect(this.m_stCurrentBattleFieldView.stFieldGridsVector[0][8]);
            this.AddVolcanicFireEffect(this.m_stCurrentBattleFieldView.stFieldGridsVector[1][8]);
            this.AddVolcanicFireEffect(this.m_stCurrentBattleFieldView.stFieldGridsVector[5][8]);
            this.AddVolcanicFireEffect(this.m_stCurrentBattleFieldView.stFieldGridsVector[6][8]);
         }
         if(ms_arrVolcanicFireEffects)
         {
            for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
            {
               for each(stVolcanicFireEffect in ms_arrVolcanicFireEffects[iYIndex])
               {
                  if(stVolcanicFireEffect)
                  {
                     stVolcanicFireEffect.a_4003(null);
                  }
               }
            }
         }
         for each(stEffect in this.m_arrWaterWheelEffect)
         {
            stEffect.a_4003(iTimeNum);
         }
         if(iTimeNum % 2 == 0)
         {
            arrFireXRang = this.GetFireHurtXRangByRow(0);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[0].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(1);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[1].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(2);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[2].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(3);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[3].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(4);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[4].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(5);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[5].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(6);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[6].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
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
         var arrXFireRange:Array = [];
         if(0 == iYIndexNum)
         {
            if(!this.IsExistDefenseForMagma(this.m_stCurrentBattleFieldView.stFieldGridsVector[0][8]))
            {
               arrXFireRange.push([a_3491.a_1080 * 8,a_3491.a_1080 * 9]);
            }
         }
         else if(1 == iYIndexNum)
         {
            if(!this.IsExistDefenseForMagma(this.m_stCurrentBattleFieldView.stFieldGridsVector[1][8]))
            {
               arrXFireRange.push([a_3491.a_1080 * 8,a_3491.a_1080 * 9]);
            }
         }
         else if(5 == iYIndexNum)
         {
            if(!this.IsExistDefenseForMagma(this.m_stCurrentBattleFieldView.stFieldGridsVector[5][8]))
            {
               arrXFireRange.push([a_3491.a_1080 * 8,a_3491.a_1080 * 9]);
            }
         }
         else if(6 == iYIndexNum)
         {
            if(!this.IsExistDefenseForMagma(this.m_stCurrentBattleFieldView.stFieldGridsVector[6][8]))
            {
               arrXFireRange.push([a_3491.a_1080 * 8,a_3491.a_1080 * 9]);
            }
         }
         return arrXFireRange;
      }
      
      protected function IsExistDefenseForMagma(stFieldGrid:a_3491) : Boolean
      {
         if(Boolean(stFieldGrid.m_stBaseToolDefense) || stFieldGrid.a_3492())
         {
            return true;
         }
         return false;
      }
      
      protected function IsExistDefenseForObstacle(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid.a_3492())
         {
            return true;
         }
         return false;
      }
      
      protected function BurnFieldGridDefense(stFieldGrid:a_3491) : Boolean
      {
         if(null != stFieldGrid.m_stBaseToolDefense)
         {
            stFieldGrid.m_stBaseToolDefense.m_iDieType = 1;
            stFieldGrid.m_stBaseToolDefense.a_3969(10);
         }
         else if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(10);
         }
         else if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(10);
         }
         else if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(10);
         }
         else if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(10);
         }
         else if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(10);
         }
         else if(stFieldGrid.HasNewSlot())
         {
            stFieldGrid.DamageNewSlot(false,0,false,10,1);
         }
         else if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(10);
         }
         return true;
      }
      
      protected function BurnFieldGridMoveIntruder(stFieldGrid:a_3491) : Boolean
      {
         var stBaseMoveIntruder:a_4206 = null;
         for each(stBaseMoveIntruder in stFieldGrid.a_1511)
         {
            stBaseMoveIntruder.a_4208(b_182.a_436,6);
         }
         return true;
      }
      
      protected function AddVolcanicFireEffect(stTempFieldGrid:a_3491) : Boolean
      {
         var stVolcanicFireEffect:VolcanicFireEffect = null;
         if(this.IsExistDefenseForMagma(stTempFieldGrid) || stTempFieldGrid.a_1511.length > 0)
         {
            if(null == ms_arrVolcanicFireEffects[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo])
            {
               stVolcanicFireEffect = VolcanicFireEffect.a_3926();
               stVolcanicFireEffect.a_1797(false);
               stVolcanicFireEffect.x = a_3491.a_1080 * stTempFieldGrid.m_iXGridNo;
               stVolcanicFireEffect.y = a_3491.a_1081 * (stTempFieldGrid.m_iYGridNo + 0.7);
               this.m_stCurrentBattleFieldView.AddToBattleView(stVolcanicFireEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stTempFieldGrid);
               ms_arrVolcanicFireEffects[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo] = stVolcanicFireEffect;
            }
         }
         else if(ms_arrVolcanicFireEffects[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo])
         {
            stVolcanicFireEffect = ms_arrVolcanicFireEffects[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo];
            stVolcanicFireEffect.a_3940();
            ms_arrVolcanicFireEffects[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo] = null;
         }
         return true;
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         var iYIndex:int = 0;
         var stVolcanicFireEffect:VolcanicFireEffect = null;
         if(stData is Array && stData[0] == 2)
         {
            if(ms_arrVolcanicFireEffects)
            {
               for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
               {
                  for each(stVolcanicFireEffect in ms_arrVolcanicFireEffects[iYIndex])
                  {
                     if(stVolcanicFireEffect)
                     {
                        stVolcanicFireEffect.a_3940();
                     }
                  }
                  ms_arrVolcanicFireEffects[iYIndex] = [];
               }
            }
         }
         return true;
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var i:int = 0;
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var stEffect:DayWaterWheelEffect = null;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[0][2].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[1][2].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[5][2].m_iFieldGridType = 3;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[6][2].m_iFieldGridType = 3;
               for(i = 0; i < this.WaterWheelPosition.length; i++)
               {
                  m_iXGridNo = int(this.WaterWheelPosition[i][0]);
                  m_iYGridNo = int(this.WaterWheelPosition[i][1]);
                  stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
                  if(stTargetFieldGrid != null)
                  {
                     stTargetFieldGrid.m_iFieldGridType = 3;
                     stEffect = DayWaterWheelEffect.a_3926();
                     stEffect.a_1797(false,3 * 20,1 * 20);
                     stEffect.m_TargetFieldGrid = stTargetFieldGrid;
                     stEffect.x = a_3491.a_1080 * m_iXGridNo + this.WaterWheelPosition[i][2];
                     stEffect.y = a_3491.a_1081 * m_iYGridNo + this.WaterWheelPosition[i][3];
                     this.m_stCurrentBattleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,stTargetFieldGrid);
                     this.m_arrWaterWheelEffect.push(stEffect);
                  }
               }
               stCurrentBattleFieldView.stFieldGridsVector[2][5].m_iFieldGridType = 3;
               stCurrentBattleFieldView.stFieldGridsVector[2][6].m_iFieldGridType = 3;
               stCurrentBattleFieldView.stFieldGridsVector[2][7].m_iFieldGridType = 3;
               stCurrentBattleFieldView.stFieldGridsVector[2][8].m_iFieldGridType = 3;
               stCurrentBattleFieldView.stFieldGridsVector[3][0].m_iFieldGridType = 3;
               stCurrentBattleFieldView.stFieldGridsVector[3][1].m_iFieldGridType = 3;
               stCurrentBattleFieldView.stFieldGridsVector[3][2].m_iFieldGridType = 3;
               stCurrentBattleFieldView.stFieldGridsVector[3][3].m_iFieldGridType = 3;
               stCurrentBattleFieldView.stFieldGridsVector[4][5].m_iFieldGridType = 3;
               stCurrentBattleFieldView.stFieldGridsVector[4][6].m_iFieldGridType = 3;
               stCurrentBattleFieldView.stFieldGridsVector[4][7].m_iFieldGridType = 3;
               stCurrentBattleFieldView.stFieldGridsVector[4][8].m_iFieldGridType = 3;
            }
         }
         return true;
      }
      
      public function removeEffectMovie() : void
      {
         var stEffect:DayWaterWheelEffect = null;
         while(this.m_arrWaterWheelEffect.length > 0)
         {
            stEffect = this.m_arrWaterWheelEffect.pop();
            stEffect.a_3940();
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
   }
}

