package com.aurora.ui.maogoutd.resource.defender.HorseYear.stardome
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_3971;
   import com.aurora.ui.maogoutd.resource.defender.a_3975;
   import com.aurora.ui.maogoutd.resource.defender.a_4012;
   import com.aurora.ui.maogoutd.resource.defender.defenderSet.IDefenderSet;
   
   public class StarDomeHorseDefence
   {
      
      internal static const DEFENSE_PRICE:int = 350;
      
      internal static const REDUCE_PRICE:int = 100;
      
      internal static const REDUCE_TIME:int = 30;
      
      public static var ChangeInToOrder:Array = [[0,0],[0,-1],[0,1],[1,0],[-1,0],[-1,-1],[-1,1],[1,-1],[1,1],[-2,0],[2,0],[0,-2],[0,2],[-2,-1],[-2,1],[2,-1],[2,1],[-1,-2],[-1,2],[1,-2],[1,2],[-2,-2],[-2,2],[2,-2],[2,2]];
      
      public function StarDomeHorseDefence()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return a_3965(iStarDegree);
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
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
      
      internal static function GetCardSkillEffectTick(iSkillDegree:int) : int
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
      
      public static function TryAddCardCopy(stPlaceField:a_3491, cardID:int, iOrigSeatID:int, protectBuffTime:int) : Boolean
      {
         var sameArr:Array = null;
         var iCnt:int = 0;
         var i:* = 0;
         var offset:Array = null;
         var stTargetField:a_3491 = null;
         if(!stPlaceField)
         {
            return false;
         }
         var stBaseDefense:a_3962 = a_4012.getInstance().a_4013(cardID) as a_3962;
         if(!stBaseDefense)
         {
            return false;
         }
         stBaseDefense.iDefenseTypeID = cardID;
         stBaseDefense.m_iPlaceTimeIntervals = stPlaceField.m_stCurrentBattbleFieldView.iTimeIntervalNum;
         stBaseDefense.m_iDefenseGlobalID = stPlaceField.m_stCurrentBattbleFieldView.a_2180();
         if(!CanCopyCard(stBaseDefense,stPlaceField))
         {
            stBaseDefense.a_3940();
            return false;
         }
         var stInitialFieldGrid:a_3491 = stPlaceField.m_stCurrentBattbleFieldView.a_3438(stPlaceField.m_iXGridNo,stPlaceField.m_iYGridNo);
         a_3962.a_1088.a_2059(stBaseDefense.m_iDefenseGlobalID,cardID,stInitialFieldGrid.m_iInitialXGridNo,stInitialFieldGrid.m_iInitialYGridNo,0,2,20,0,0,iOrigSeatID,protectBuffTime);
         if(stBaseDefense.a_3512() == 287572013 || stBaseDefense.a_3512() == 292552863 || stBaseDefense.a_3512() == 292552975)
         {
            sameArr = [stPlaceField];
            iCnt = 0;
            i = 0;
            while(i < ChangeInToOrder.length && iCnt < 2)
            {
               offset = ChangeInToOrder[i];
               stTargetField = stPlaceField.m_stCurrentBattbleFieldView.a_3438(stPlaceField.m_iXGridNo + offset[0],stPlaceField.m_iYGridNo + offset[1]);
               if(!(!stTargetField || sameArr.indexOf(stTargetField) != -1 || !stTargetField.CheckAddDefense(stBaseDefense)))
               {
                  stInitialFieldGrid = stPlaceField.m_stCurrentBattbleFieldView.a_3438(stTargetField.m_iXGridNo,stTargetField.m_iYGridNo);
                  a_3962.a_1088.a_2059(stPlaceField.m_stCurrentBattbleFieldView.a_2180(),cardID,stInitialFieldGrid.m_iInitialXGridNo,stInitialFieldGrid.m_iInitialYGridNo,0,2,20,0,0,iOrigSeatID,protectBuffTime);
                  sameArr.push(stTargetField);
                  iCnt++;
               }
               i--;
            }
         }
         stBaseDefense.a_3940();
         return true;
      }
      
      public static function CanCopyCard(m_stCopyBaseDefense:a_3962, stFieldGrid:a_3491) : Boolean
      {
         var coveredDefense:a_3962 = null;
         var stDefenderSet:IDefenderSet = null;
         var m_CanAddCard:Boolean = true;
         if(stFieldGrid == null || m_stCopyBaseDefense == null)
         {
            return false;
         }
         if(stFieldGrid.m_stAttackFighter is IDefenderSet && (stFieldGrid.m_stAttackFighter as IDefenderSet).IsUpgradeID(m_stCopyBaseDefense.a_3512()))
         {
            stDefenderSet = stFieldGrid.m_stAttackFighter as IDefenderSet;
            m_CanAddCard = !stDefenderSet.IsFull() ? true : false;
         }
         else if((m_stCopyBaseDefense.iUpgradeID & 0xFF0000) > 0)
         {
            coveredDefense = stFieldGrid.getIUpgradeDefense();
            if(m_stCopyBaseDefense is a_3975 && null != stFieldGrid.m_stProtector && stFieldGrid.m_stProtector.iUpgradeID == (m_stCopyBaseDefense.iUpgradeID & 0xFFFF))
            {
               stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
               m_CanAddCard = true;
            }
            else if(m_stCopyBaseDefense is a_3953 && null != stFieldGrid.m_stAttackFighter && stFieldGrid.m_stAttackFighter.iUpgradeID == (m_stCopyBaseDefense.iUpgradeID & 0xFFFF))
            {
               stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
               m_CanAddCard = true;
            }
            else if(m_stCopyBaseDefense is a_3960 && null != stFieldGrid.m_stBoomDefense && stFieldGrid.m_stBoomDefense.iUpgradeID == (m_stCopyBaseDefense.iUpgradeID & 0xFFFF))
            {
               stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
               m_CanAddCard = true;
            }
            else if(m_stCopyBaseDefense is a_3971 && null != stFieldGrid.m_stFlowerDefense && stFieldGrid.m_stFlowerDefense.iUpgradeID == (m_stCopyBaseDefense.iUpgradeID & 0xFFFF))
            {
               stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
               m_CanAddCard = true;
            }
            else if(m_stCopyBaseDefense is a_3959 && null != stFieldGrid.m_stBaseAuxiliaryFighter && stFieldGrid.m_stBaseAuxiliaryFighter.iUpgradeID == (m_stCopyBaseDefense.iUpgradeID & 0xFFFF))
            {
               stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
               m_CanAddCard = true;
            }
            else if(m_stCopyBaseDefense is a_3959 && stFieldGrid.TryConsumeUpgradeMatchNewSlot(m_stCopyBaseDefense))
            {
               m_CanAddCard = true;
            }
            else if(Boolean(coveredDefense) && m_stCopyBaseDefense.iUpgradeArray.indexOf(coveredDefense.a_3512()) != -1)
            {
               coveredDefense.a_3969(coveredDefense.iLifeValue);
               m_CanAddCard = true;
            }
            else
            {
               m_CanAddCard = false;
            }
         }
         return m_CanAddCard;
      }
      
      public static function getFangyuDefense(grid:a_3491) : a_3962
      {
         if(!grid)
         {
            return null;
         }
         return grid.m_stProtector || grid.m_stAttackFighter || grid.m_stFlowerDefense || grid.m_stBaseAuxiliaryFighter || grid.m_stTrayDefense;
      }
      
      public static function TatalRangeFangyuSkill(grid:a_3491, range:int, hitTime:int, continueTick:int) : void
      {
         var row:Array = null;
         var x:int = 0;
         var g:a_3491 = null;
         var defense:a_3962 = null;
         if(!grid || !grid.m_stCurrentBattbleFieldView || range < 0 || hitTime <= 0 || continueTick <= 0)
         {
            return;
         }
         var view:BattleFieldView = grid.m_stCurrentBattbleFieldView;
         var grids:Array = view.stFieldGridsVector;
         var xStart:int = Math.max(grid.m_iXGridNo - range,0);
         var xEnd:int = Math.min(grid.m_iXGridNo + range,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(grid.m_iYGridNo - range,0);
         var yEnd:int = Math.min(grid.m_iYGridNo + range,BattleFieldView.a_1012 - 1);
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
                     defense = getFangyuDefense(g);
                     if(defense)
                     {
                        defense.AddFangyuBuff(hitTime,continueTick);
                     }
                  }
               }
            }
         }
      }
      
      public static function TatalRangeFangyuSkill2(grid:a_3491, width:int, height:int, continueTick:int) : void
      {
         var row:Array = null;
         var x:int = 0;
         var g:a_3491 = null;
         var defense:a_3962 = null;
         if(!grid || !grid.m_stCurrentBattbleFieldView || width < 0 || height < 0 || continueTick <= 0)
         {
            return;
         }
         var view:BattleFieldView = grid.m_stCurrentBattbleFieldView;
         var grids:Array = view.stFieldGridsVector;
         var xStart:int = Math.max(grid.m_iXGridNo - width,0);
         var xEnd:int = Math.min(grid.m_iXGridNo + width,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(grid.m_iYGridNo - height,0);
         var yEnd:int = Math.min(grid.m_iYGridNo + height,BattleFieldView.a_1012 - 1);
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
                     defense = getFangyuDefense(g);
                     if(defense)
                     {
                        defense.AddFangyuBuff(1,continueTick);
                     }
                  }
               }
            }
         }
      }
   }
}

