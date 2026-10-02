package com.aurora.ui.maogoutd.resource.gamemap.newMap.CattleYear
{
   import a_4718.b_182;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.AddMouseFireBuff;
   import com.aurora.ui.maogoutd.resource.effect.RemoveCardFireBuff;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class DayDongjunTreasureThirdGameMap extends BaseGameMap
   {
      
      private static var ms_arrAddMouseFireBuff:Array;
      
      private static var ms_arrRemoveCardFireBuff:Array;
      
      private static var a_1445:a_4187 = new a_4187();
      
      private var ms_arrFirePosition:Array = new Array([1,6],[1,7],[1,8],[2,6],[2,7],[2,8],[3,6],[3,7],[3,8],[4,6],[4,7],[4,8],[5,6],[5,7],[5,8]);
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      public function DayDongjunTreasureThirdGameMap()
      {
         var iYIndex:int = 0;
         var iYIndex0:int = 0;
         super();
         a_1445.m_iBattleFieldStageType = 1;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
         if(null == ms_arrAddMouseFireBuff)
         {
            ms_arrAddMouseFireBuff = [];
            for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
            {
               ms_arrAddMouseFireBuff[iYIndex] = [];
            }
         }
         if(null == ms_arrRemoveCardFireBuff)
         {
            ms_arrRemoveCardFireBuff = [];
            for(iYIndex0 = 0; iYIndex0 < BattleFieldView.a_1012; iYIndex0++)
            {
               ms_arrRemoveCardFireBuff[iYIndex0] = [];
            }
         }
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[0][6].m_iFieldGridType = 4;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[0][7].m_iFieldGridType = 4;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[0][8].m_iFieldGridType = 4;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[6][6].m_iFieldGridType = 4;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[6][7].m_iFieldGridType = 4;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[6][8].m_iFieldGridType = 4;
            }
         }
         this.m_iChangeCount = 1;
         this.m_stRandomSeed.setSeed(100,500);
         return true;
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         var iYIndex:int = 0;
         var cardBuff:RemoveCardFireBuff = null;
         var iYIndex0:int = 0;
         var mouseBuff:AddMouseFireBuff = null;
         if(stData is Array && stData[0] == 2)
         {
            if(ms_arrRemoveCardFireBuff)
            {
               for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
               {
                  for each(cardBuff in ms_arrRemoveCardFireBuff[iYIndex])
                  {
                     if(cardBuff)
                     {
                        cardBuff.a_3940();
                     }
                  }
                  ms_arrRemoveCardFireBuff[iYIndex] = [];
               }
            }
            if(ms_arrAddMouseFireBuff)
            {
               for(iYIndex0 = 0; iYIndex0 < BattleFieldView.a_1012; iYIndex0++)
               {
                  for each(mouseBuff in ms_arrAddMouseFireBuff[iYIndex0])
                  {
                     if(mouseBuff)
                     {
                        mouseBuff.a_3940();
                     }
                  }
                  ms_arrAddMouseFireBuff[iYIndex0] = [];
               }
            }
         }
         return true;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stTempFieldGrid:a_3491 = null;
         var stMouseBuff:AddMouseFireBuff = null;
         var stCardBuff:RemoveCardFireBuff = null;
         var Index:int = 0;
         var stBaseShot:a_4348 = null;
         var arrFireXRang:Array = null;
         this.m_iCurrentTimeIntval = iTimeNum;
         var isChanged:Boolean = false;
         if(iTimeNum % 20 == 0)
         {
            for(Index = 0; Index < this.ms_arrFirePosition.length; Index++)
            {
               this.BurnFieldGridDefense(this.m_stCurrentBattleFieldView.stFieldGridsVector[this.ms_arrFirePosition[Index][0]][this.ms_arrFirePosition[Index][1]]);
            }
         }
         if(iTimeNum % 6)
         {
            for(Index = 0; Index < this.ms_arrFirePosition.length; Index++)
            {
               this.BurnFieldGridMoveIntruder(this.m_stCurrentBattleFieldView.stFieldGridsVector[this.ms_arrFirePosition[Index][0]][this.ms_arrFirePosition[Index][1]]);
            }
            for(Index = 0; Index < this.ms_arrFirePosition.length; Index++)
            {
               this.AddVolcanicFireEffect(this.m_stCurrentBattleFieldView.stFieldGridsVector[this.ms_arrFirePosition[Index][0]][this.ms_arrFirePosition[Index][1]]);
            }
         }
         if(iTimeNum % 2 == 0)
         {
            arrFireXRang = this.GetFireHurtXRangByRow(0);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[0].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 8 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(1);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[1].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 8 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(2);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[2].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 8 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(4);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[4].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 8 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(5);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[5].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 8 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(6);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[6].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 8 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            if(ms_arrAddMouseFireBuff)
            {
               for(Index = 0; Index < BattleFieldView.a_1012; Index++)
               {
                  for each(stMouseBuff in ms_arrAddMouseFireBuff[Index])
                  {
                     if(stMouseBuff)
                     {
                        stMouseBuff.a_4003(null);
                     }
                  }
               }
            }
            if(ms_arrRemoveCardFireBuff)
            {
               for(Index = 0; Index < BattleFieldView.a_1012; Index++)
               {
                  for each(stCardBuff in ms_arrRemoveCardFireBuff[Index])
                  {
                     if(stCardBuff)
                     {
                        stCardBuff.a_4003(null);
                     }
                  }
               }
            }
         }
      }
      
      protected function AddVolcanicFireEffect(stTempFieldGrid:a_3491) : Boolean
      {
         var stVolcanicFireEffect:* = undefined;
         if(stTempFieldGrid.a_1511.length > 0)
         {
            if(null == ms_arrAddMouseFireBuff[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo])
            {
               stVolcanicFireEffect = AddMouseFireBuff.a_3926();
               stVolcanicFireEffect.a_1797(false);
               stVolcanicFireEffect.x = a_3491.a_1080 * stTempFieldGrid.m_iXGridNo - 5;
               stVolcanicFireEffect.y = a_3491.a_1081 * stTempFieldGrid.m_iYGridNo + 5;
               this.m_stCurrentBattleFieldView.AddToBattleView(stVolcanicFireEffect,BattleLayerDefine.INTRUDER_BOTTOM_TYPE,stTempFieldGrid);
               ms_arrAddMouseFireBuff[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo] = stVolcanicFireEffect;
            }
         }
         else if(ms_arrAddMouseFireBuff[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo])
         {
            stVolcanicFireEffect = ms_arrAddMouseFireBuff[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo];
            stVolcanicFireEffect.a_3940();
            ms_arrAddMouseFireBuff[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo] = null;
         }
         if(this.IsExistDefenseForGrid(stTempFieldGrid))
         {
            if(null == ms_arrRemoveCardFireBuff[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo])
            {
               stVolcanicFireEffect = RemoveCardFireBuff.a_3926();
               stVolcanicFireEffect.a_1797(false);
               stVolcanicFireEffect.x = a_3491.a_1080 * stTempFieldGrid.m_iXGridNo - 15;
               stVolcanicFireEffect.y = a_3491.a_1081 * stTempFieldGrid.m_iYGridNo + 8;
               this.m_stCurrentBattleFieldView.AddToBattleView(stVolcanicFireEffect,BattleLayerDefine.INTRUDER_BOTTOM_TYPE,stTempFieldGrid);
               ms_arrRemoveCardFireBuff[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo] = stVolcanicFireEffect;
            }
         }
         else if(ms_arrRemoveCardFireBuff[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo])
         {
            stVolcanicFireEffect = ms_arrRemoveCardFireBuff[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo];
            stVolcanicFireEffect.a_3940();
            ms_arrRemoveCardFireBuff[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo] = null;
         }
         return true;
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
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[0][6]))
            {
               arrXFireRange.push([a_3491.a_1080 * 6,a_3491.a_1080 * 7]);
            }
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[0][7]))
            {
               arrXFireRange.push([a_3491.a_1080 * 7,a_3491.a_1080 * 8]);
            }
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[0][8]))
            {
               arrXFireRange.push([a_3491.a_1080 * 8,a_3491.a_1080 * 9]);
            }
         }
         else if(1 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[1][6]))
            {
               arrXFireRange.push([a_3491.a_1080 * 6,a_3491.a_1080 * 7]);
            }
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[1][7]))
            {
               arrXFireRange.push([a_3491.a_1080 * 7,a_3491.a_1080 * 8]);
            }
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[1][8]))
            {
               arrXFireRange.push([a_3491.a_1080 * 8,a_3491.a_1080 * 9]);
            }
         }
         else if(2 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[2][6]))
            {
               arrXFireRange.push([a_3491.a_1080 * 6,a_3491.a_1080 * 7]);
            }
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[2][7]))
            {
               arrXFireRange.push([a_3491.a_1080 * 7,a_3491.a_1080 * 8]);
            }
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[2][8]))
            {
               arrXFireRange.push([a_3491.a_1080 * 8,a_3491.a_1080 * 9]);
            }
         }
         else if(3 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[3][6]))
            {
               arrXFireRange.push([a_3491.a_1080 * 6,a_3491.a_1080 * 7]);
            }
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[3][7]))
            {
               arrXFireRange.push([a_3491.a_1080 * 7,a_3491.a_1080 * 8]);
            }
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[3][8]))
            {
               arrXFireRange.push([a_3491.a_1080 * 8,a_3491.a_1080 * 9]);
            }
         }
         else if(4 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[4][6]))
            {
               arrXFireRange.push([a_3491.a_1080 * 6,a_3491.a_1080 * 7]);
            }
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[4][7]))
            {
               arrXFireRange.push([a_3491.a_1080 * 7,a_3491.a_1080 * 8]);
            }
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[4][8]))
            {
               arrXFireRange.push([a_3491.a_1080 * 8,a_3491.a_1080 * 9]);
            }
         }
         else if(5 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[5][6]))
            {
               arrXFireRange.push([a_3491.a_1080 * 6,a_3491.a_1080 * 7]);
            }
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[5][7]))
            {
               arrXFireRange.push([a_3491.a_1080 * 7,a_3491.a_1080 * 8]);
            }
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[5][8]))
            {
               arrXFireRange.push([a_3491.a_1080 * 8,a_3491.a_1080 * 9]);
            }
         }
         else if(6 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[6][6]))
            {
               arrXFireRange.push([a_3491.a_1080 * 6,a_3491.a_1080 * 7]);
            }
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[6][7]))
            {
               arrXFireRange.push([a_3491.a_1080 * 7,a_3491.a_1080 * 8]);
            }
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[6][8]))
            {
               arrXFireRange.push([a_3491.a_1080 * 8,a_3491.a_1080 * 9]);
            }
         }
         return arrXFireRange;
      }
      
      protected function IsExistDefenseForGrid(stFieldGrid:a_3491) : Boolean
      {
         if(Boolean(stFieldGrid.m_stBaseToolDefense) || stFieldGrid.a_3492())
         {
            return true;
         }
         return false;
      }
      
      protected function BurnFieldGridDefense(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         return stFieldGrid.BurnFieldGridDefenseNormal(10);
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

