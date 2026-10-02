package com.aurora.ui.maogoutd.resource.defender.HorseYear.GoldRebirthOsiris
{
   import a_4752.GlobalVariables;
   import com.aurora.protocol.game.maogoutd.CardDieVO;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.DefensePlaceHelper;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.GoldRebirthOsiris.effect.GoldOsirisGridRebirthEffect;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_4012;
   
   public class GoldRebirthOsirisDefence
   {
      
      internal static const DEFENSE_PRICE:int = 400;
      
      public static const PLACE_OFFSETS:Array = [[0,0],[0,-1],[0,1],[1,0],[-1,0],[-1,-1],[-1,1],[1,-1],[1,1],[-2,-2],[-2,2],[-2,-1],[-2,1],[-2,0],[-1,-2],[-1,2],[0,-2],[0,2],[1,-2],[1,2],[2,-2],[2,2],[2,-1],[2,1],[2,0]];
      
      public static const PLACE_OFFSETS_FINAL:Array = [[0,0],[0,-1],[0,1],[1,0],[-1,0],[-1,-1],[-1,1],[1,-1],[1,1],[-2,-2],[-2,2],[-2,-1],[-2,1],[-2,0],[-1,-2],[-1,2],[0,-2],[0,2],[1,-2],[1,2],[2,-2],[2,2],[2,-1],[2,1],[2,0],[-2,-3],[-2,3],[-1,-3],[-1,3],[0,-3],[0,3],[1,-3],[1,3],[2,-3],[2,3]];
      
      public function GoldRebirthOsirisDefence()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return a_3965(iStarDegree);
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 60;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 60;
               break;
            case 1:
               iStarDegreeEffect = 58;
               break;
            case 2:
               iStarDegreeEffect = 56;
               break;
            case 3:
               iStarDegreeEffect = 54;
               break;
            case 4:
               iStarDegreeEffect = 52;
               break;
            case 5:
               iStarDegreeEffect = 50;
               break;
            case 6:
               iStarDegreeEffect = 48;
               break;
            case 7:
               iStarDegreeEffect = 46;
               break;
            case 8:
               iStarDegreeEffect = 44;
               break;
            case 9:
               iStarDegreeEffect = 42;
               break;
            case 10:
               iStarDegreeEffect = 40;
               break;
            case 11:
               iStarDegreeEffect = 38;
               break;
            case 12:
               iStarDegreeEffect = 36;
               break;
            case 13:
               iStarDegreeEffect = 34;
               break;
            case 14:
               iStarDegreeEffect = 32;
               break;
            case 15:
               iStarDegreeEffect = 30;
               break;
            case 16:
               iStarDegreeEffect = 28;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function GetCardSkillWudiTimes(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 2.5;
               break;
            case 1:
               iSkillDegreeEffect = 2.55;
               break;
            case 2:
               iSkillDegreeEffect = 2.6;
               break;
            case 3:
               iSkillDegreeEffect = 2.65;
               break;
            case 4:
               iSkillDegreeEffect = 2.7;
               break;
            case 5:
               iSkillDegreeEffect = 2.75;
               break;
            case 6:
               iSkillDegreeEffect = 2.8;
               break;
            case 7:
               iSkillDegreeEffect = 3;
               break;
            case 8:
               iSkillDegreeEffect = 3.5;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function GetCardSkillEffectTick(iSkillDegree:int) : int
      {
         return GetCardSkillFangYuTimes(iSkillDegree);
      }
      
      internal static function GetCardSkillFangYuTimes(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 15;
               break;
            case 1:
               iSkillDegreeEffect = 15.5;
               break;
            case 2:
               iSkillDegreeEffect = 16;
               break;
            case 3:
               iSkillDegreeEffect = 16.5;
               break;
            case 4:
               iSkillDegreeEffect = 17;
               break;
            case 5:
               iSkillDegreeEffect = 17.5;
               break;
            case 6:
               iSkillDegreeEffect = 18;
               break;
            case 7:
               iSkillDegreeEffect = 18.5;
               break;
            case 8:
               iSkillDegreeEffect = 20;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:int = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 1;
               break;
            case 1:
               iSkillDegreeEffect = 1;
               break;
            case 2:
               iSkillDegreeEffect = 1;
               break;
            case 3:
               iSkillDegreeEffect = 1;
               break;
            case 4:
               iSkillDegreeEffect = 1;
               break;
            case 5:
               iSkillDegreeEffect = 1;
               break;
            case 6:
               iSkillDegreeEffect = 1;
               break;
            case 7:
               iSkillDegreeEffect = 1;
               break;
            case 8:
               iSkillDegreeEffect = 2;
         }
         return iSkillDegreeEffect;
      }
      
      internal static function PackProtectBuffTime(hitCount:int, fangYuTick:int, wuDiType:int = 0, wuDiTick:int = 0) : int
      {
         return hitCount + fangYuTick * 10 + wuDiType * 10000 + wuDiTick * 100000;
      }
      
      internal static function TotalRangeFangyuBuff(grid:a_3491, rangeX:int, rangeY:int, hitCount:int, fangYuTick:int) : void
      {
         var row:Array = null;
         var x:int = 0;
         var g:a_3491 = null;
         var defense:a_3962 = null;
         if(!grid || !grid.m_stCurrentBattbleFieldView || rangeX < 0 || rangeY < 0 || hitCount <= 0 || fangYuTick <= 0)
         {
            return;
         }
         var view:BattleFieldView = grid.m_stCurrentBattbleFieldView;
         var grids:Array = view.stFieldGridsVector;
         var xStart:int = Math.max(grid.m_iXGridNo - rangeX,0);
         var xEnd:int = Math.min(grid.m_iXGridNo + rangeX,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(grid.m_iYGridNo - rangeY,0);
         var yEnd:int = Math.min(grid.m_iYGridNo + rangeY,BattleFieldView.a_1012 - 1);
         for(var y:int = yStart; y <= yEnd; y++)
         {
            row = grids[y];
            if(row)
            {
               for(x = xStart; x <= xEnd; x++)
               {
                  g = row[x];
                  if(g)
                  {
                     defense = getRangeDefense(g);
                     if(defense)
                     {
                        defense.AddFangyuBuff(hitCount,fangYuTick);
                     }
                  }
               }
            }
         }
      }
      
      internal static function TotalRangeInvincibleBuff(grid:a_3491, rangeX:int, rangeY:int, wuDiTick:int, wuDiType:int, fangYuTick:int, hitCount:int) : void
      {
         var row:Array = null;
         var x:int = 0;
         var g:a_3491 = null;
         var defense:a_3962 = null;
         if(!grid || !grid.m_stCurrentBattbleFieldView || rangeX < 0 || rangeY < 0 || wuDiTick <= 0 || wuDiType <= 0)
         {
            return;
         }
         var view:BattleFieldView = grid.m_stCurrentBattbleFieldView;
         var grids:Array = view.stFieldGridsVector;
         var xStart:int = Math.max(grid.m_iXGridNo - rangeX,0);
         var xEnd:int = Math.min(grid.m_iXGridNo + rangeX,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(grid.m_iYGridNo - rangeY,0);
         var yEnd:int = Math.min(grid.m_iYGridNo + rangeY,BattleFieldView.a_1012 - 1);
         for(var y:int = yStart; y <= yEnd; y++)
         {
            row = grids[y];
            if(row)
            {
               for(x = xStart; x <= xEnd; x++)
               {
                  g = row[x];
                  if(g)
                  {
                     defense = getRangeDefense(g);
                     if(defense)
                     {
                        defense.AddInvincibleBuffTime(wuDiTick,wuDiType,fangYuTick,hitCount);
                     }
                  }
               }
            }
         }
      }
      
      private static function getRangeDefense(grid:a_3491) : a_3962
      {
         if(!grid)
         {
            return null;
         }
         return grid.m_stProtector || grid.m_stAttackFighter || grid.m_stFlowerDefense || grid.m_stBaseAuxiliaryFighter || grid.m_stTrayDefense;
      }
      
      internal static function AddGridRebirthEffect(grid:a_3491, transType:int, iDefenseTypeID:int, iOrigSeatID:int, iProtectBuffTime:int, needPost:Boolean) : void
      {
         var effect:GoldOsirisGridRebirthEffect = null;
         if(!grid || !grid.m_stCurrentBattbleFieldView)
         {
            return;
         }
         var battleFieldView:BattleFieldView = grid.m_stCurrentBattbleFieldView;
         effect = GoldOsirisGridRebirthEffect.a_3926(transType);
         effect.initData(grid,battleFieldView.a_2180(),iDefenseTypeID,iOrigSeatID,iProtectBuffTime,needPost);
         effect.a_1797(false);
         effect.x = (grid.m_iXGridNo + 0.5) * a_3491.a_1080;
         effect.y = (grid.m_iYGridNo + 0.5) * a_3491.a_1081;
         grid.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_TOP_TYPE,grid);
         effect.play();
      }
      
      internal static function skillAddCard(stFieldGrid:a_3491, skillTimes:int, rangeX:int, rangeY:int, transType:int, sucessCallPack:Function) : void
      {
         var placeX:int = 0;
         var placeY:int = 0;
         var best:CardDieVO = null;
         var stCurField:a_3491 = null;
         var stBaseDefense:a_3962 = null;
         if(!stFieldGrid || sucessCallPack == null || skillTimes <= 0)
         {
            return;
         }
         var battleFieldView:BattleFieldView = stFieldGrid.m_stCurrentBattbleFieldView;
         if(!battleFieldView)
         {
            return;
         }
         var placeOffsets:Array = transType == 3 ? PLACE_OFFSETS_FINAL : PLACE_OFFSETS;
         var eatArr:Array = GlobalVariables.getInstance().m_iEatDieArr;
         var helper:DefensePlaceHelper = DefensePlaceHelper.getInstance();
         var centerX:int = stFieldGrid.m_iInitialXGridNo;
         var centerY:int = stFieldGrid.m_iInitialYGridNo;
         var times:int = 0;
         var i:int = 0;
         while(i < placeOffsets.length && times < skillTimes)
         {
            placeX = centerX + placeOffsets[i][0];
            placeY = centerY + placeOffsets[i][1];
            best = findLatestDeathOnGrid(eatArr,placeX,placeY,centerX,centerY,rangeX,rangeY);
            if(best)
            {
               stCurField = battleFieldView.GetInitialFieldGrid(placeX,placeY);
               if(stCurField)
               {
                  stBaseDefense = a_4012.getInstance().a_4013(best.m_iDefenderTypeID) as a_3962;
                  if(stBaseDefense)
                  {
                     stBaseDefense.iDefenseTypeID = best.m_iDefenderTypeID;
                     if(!helper.CheckPlaceRuleAndCalcAddDefense(stBaseDefense,stCurField,true))
                     {
                        stBaseDefense.a_3940();
                     }
                     else if(!stCurField.CheckAddDefense(stBaseDefense))
                     {
                        stBaseDefense.a_3940();
                     }
                     else
                     {
                        times++;
                        sucessCallPack(stCurField,stBaseDefense,best.m_iOrigSeatID);
                        stBaseDefense.a_3940();
                     }
                  }
               }
            }
            i++;
         }
      }
      
      private static function findLatestDeathOnGrid(eatArr:Array, placeX:int, placeY:int, centerX:int, centerY:int, rangeX:int, rangeY:int) : CardDieVO
      {
         var best:CardDieVO = null;
         var vo:CardDieVO = null;
         var dx:int = 0;
         var dy:int = 0;
         for each(vo in eatArr)
         {
            if(vo)
            {
               if(!(vo.m_byXGridNo != placeX || vo.m_byYGridNo != placeY))
               {
                  dx = placeX - centerX;
                  dy = placeY - centerY;
                  if(!(dx < -rangeX || dx > rangeX || dy < -rangeY || dy > rangeY))
                  {
                     if(!best || vo.m_DieTime > best.m_DieTime)
                     {
                        best = vo;
                     }
                  }
               }
            }
         }
         return best;
      }
   }
}

