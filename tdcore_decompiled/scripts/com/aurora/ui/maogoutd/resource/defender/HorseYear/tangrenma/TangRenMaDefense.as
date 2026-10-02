package com.aurora.ui.maogoutd.resource.defender.HorseYear.tangrenma
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_4012;
   
   public class TangRenMaDefense
   {
      
      internal static const STRAIGHT_SHOT_COUNT:int = 3;
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 2;
      
      internal static const DEFENSE_PRICE:int = 350;
      
      internal static const REDUCE_DEFENSE_PRICE:int = 50;
      
      internal static const ROW_RANGE_SMALL:int = 1;
      
      internal static const COPY_SPAWN_OFFSETS:Array = [[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]];
      
      public function TangRenMaDefense()
      {
         super();
      }
      
      private static function getGridKey(stFieldGrid:a_3491) : String
      {
         return stFieldGrid.m_iInitialXGridNo + "_" + stFieldGrid.m_iInitialYGridNo;
      }
      
      public static function ClearPendingCopyGrid(stFieldGrid:a_3491) : void
      {
         if(Boolean(stFieldGrid) && Boolean(stFieldGrid.m_stCurrentBattbleFieldView))
         {
            delete stFieldGrid.m_stCurrentBattbleFieldView.ms_dicPendingCopyGrid[getGridKey(stFieldGrid)];
         }
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 200;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 1.3;
               break;
            case 1:
               iSkillDegreeEffect = 1.25;
               break;
            case 2:
               iSkillDegreeEffect = 1.2;
               break;
            case 3:
               iSkillDegreeEffect = 1.15;
               break;
            case 4:
               iSkillDegreeEffect = 1.1;
               break;
            case 5:
               iSkillDegreeEffect = 1.05;
               break;
            case 6:
               iSkillDegreeEffect = 1;
               break;
            case 7:
               iSkillDegreeEffect = 0.95;
               break;
            case 8:
               iSkillDegreeEffect = 0.8;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var starDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               starDegreeEffect = 4.5;
               break;
            case 1:
               starDegreeEffect = 5.5;
               break;
            case 2:
               starDegreeEffect = 6.5;
               break;
            case 3:
               starDegreeEffect = 7;
               break;
            case 4:
               starDegreeEffect = 9;
               break;
            case 5:
               starDegreeEffect = 11;
               break;
            case 6:
               starDegreeEffect = 14;
               break;
            case 7:
               starDegreeEffect = 17;
               break;
            case 8:
               starDegreeEffect = 20;
               break;
            case 9:
               starDegreeEffect = 23;
               break;
            case 10:
               starDegreeEffect = 28;
               break;
            case 11:
               starDegreeEffect = 36;
               break;
            case 12:
               starDegreeEffect = 45;
               break;
            case 13:
               starDegreeEffect = 55;
               break;
            case 14:
               starDegreeEffect = 66;
               break;
            case 15:
               starDegreeEffect = 78;
               break;
            default:
               starDegreeEffect = 90;
         }
         return starDegreeEffect * 10;
      }
      
      internal static function HasTargetInView(stFieldGrid:a_3491) : Boolean
      {
         var grid:a_3491 = null;
         var intruder:a_4206 = null;
         if(!stFieldGrid || !stFieldGrid.m_stCurrentBattbleFieldView)
         {
            return false;
         }
         var view:BattleFieldView = stFieldGrid.m_stCurrentBattbleFieldView;
         var yGrid:int = stFieldGrid.m_iYGridNo;
         for(var xi:int = 0; xi < BattleFieldView.a_1011; xi++)
         {
            grid = view.a_3438(xi,yGrid);
            if(grid)
            {
               for each(intruder in grid.a_1511)
               {
                  if(canTargetIntruder(intruder))
                  {
                     return true;
                  }
               }
            }
         }
         return false;
      }
      
      private static function canTargetIntruder(intruder:a_4206) : Boolean
      {
         if(!intruder || intruder.iLifeValue <= 0 || !intruder.m_stCurrentFieldGrid || !intruder.parent || !intruder.visible)
         {
            return false;
         }
         if(intruder.iSpaceState == 1 || intruder.iSpaceState == 3)
         {
            return false;
         }
         return true;
      }
      
      internal static function SpawnCopyDefenses(gride:a_3491, cardID:int, starDegree:int, skillDegree:int, copyCount:int) : void
      {
         var offset:Array = null;
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetField:a_3491 = null;
         var view:BattleFieldView = null;
         var stBaseDefense:a_3953 = null;
         var addResult:Boolean = false;
         var stInitialFieldGrid:a_3491 = null;
         if(!gride)
         {
            return;
         }
         var i:int = 0;
         var iCnt:int = 0;
         while(i < COPY_SPAWN_OFFSETS.length && iCnt < copyCount)
         {
            offset = COPY_SPAWN_OFFSETS[i] as Array;
            if(offset)
            {
               m_iXGridNo = gride.m_iXGridNo + offset[0];
               m_iYGridNo = gride.m_iYGridNo + offset[1];
               stTargetField = gride.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               if(stTargetField)
               {
                  view = gride.m_stCurrentBattbleFieldView;
                  if(view.ms_dicPendingCopyGrid[getGridKey(stTargetField)] === undefined)
                  {
                     stBaseDefense = a_4012.getInstance().a_4013(cardID) as a_3953;
                     if(stBaseDefense)
                     {
                        stBaseDefense.iDefenseTypeID = cardID;
                        stBaseDefense.a_1094 = starDegree;
                        stBaseDefense.m_iSkillDegree = skillDegree;
                        stBaseDefense.m_iPlaceTimeIntervals = gride.m_stCurrentBattbleFieldView.iTimeIntervalNum;
                        stBaseDefense.m_iDefenseGlobalID = gride.m_stCurrentBattbleFieldView.a_2180();
                        addResult = stTargetField.CheckAddDefense(stBaseDefense);
                        if(addResult)
                        {
                           view.ms_dicPendingCopyGrid[getGridKey(stTargetField)] = true;
                           stInitialFieldGrid = gride.m_stCurrentBattbleFieldView.a_3438(stTargetField.m_iXGridNo,stTargetField.m_iYGridNo);
                           a_3962.a_1088.a_2059(stBaseDefense.m_iDefenseGlobalID,stBaseDefense.a_3512(),stInitialFieldGrid.m_iInitialXGridNo,stInitialFieldGrid.m_iInitialYGridNo,0,0,starDegree);
                           iCnt++;
                        }
                        else
                        {
                           stBaseDefense.a_3940();
                        }
                     }
                  }
               }
            }
            i++;
         }
      }
   }
}

