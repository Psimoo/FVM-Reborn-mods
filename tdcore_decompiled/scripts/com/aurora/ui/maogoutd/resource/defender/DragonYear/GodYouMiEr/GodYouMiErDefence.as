package com.aurora.ui.maogoutd.resource.defender.DragonYear.GodYouMiEr
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class GodYouMiErDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 380;
      
      public function GodYouMiErDefence()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 2.1;
               break;
            case 1:
               iSkillDegreeEffect = 2.05;
               break;
            case 2:
               iSkillDegreeEffect = 2;
               break;
            case 3:
               iSkillDegreeEffect = 1.95;
               break;
            case 4:
               iSkillDegreeEffect = 1.9;
               break;
            case 5:
               iSkillDegreeEffect = 1.85;
               break;
            case 6:
               iSkillDegreeEffect = 1.8;
               break;
            case 7:
               iSkillDegreeEffect = 1.75;
               break;
            case 8:
               iSkillDegreeEffect = 1.6;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 6.5;
               break;
            case 1:
               iStarDegreeEffect = 7.5;
               break;
            case 2:
               iStarDegreeEffect = 9;
               break;
            case 3:
               iStarDegreeEffect = 10.5;
               break;
            case 4:
               iStarDegreeEffect = 13;
               break;
            case 5:
               iStarDegreeEffect = 15.5;
               break;
            case 6:
               iStarDegreeEffect = 18;
               break;
            case 7:
               iStarDegreeEffect = 22;
               break;
            case 8:
               iStarDegreeEffect = 26;
               break;
            case 9:
               iStarDegreeEffect = 30;
               break;
            case 10:
               iStarDegreeEffect = 34;
               break;
            case 11:
               iStarDegreeEffect = 38;
               break;
            case 12:
               iStarDegreeEffect = 48;
               break;
            case 13:
               iStarDegreeEffect = 58;
               break;
            case 14:
               iStarDegreeEffect = 70;
               break;
            case 15:
               iStarDegreeEffect = 82;
               break;
            case 16:
               iStarDegreeEffect = 98;
               break;
            case 17:
               iStarDegreeEffect = 130;
               break;
            case 18:
               iStarDegreeEffect = 195;
         }
         return 10 * iStarDegreeEffect;
      }
      
      internal static function GetFieldIntruderNumForAheadDirection(stFieldGrid:a_3491) : int
      {
         var stTargetFieldGrid:a_3491 = null;
         var stMoveIntruder:a_4206 = null;
         var iTotalIntruderNum:int = 0;
         var i:int = 0;
         if(stFieldGrid)
         {
            for(i = 0; i < BattleFieldView.a_1011; i++)
            {
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo - 1);
               if(stTargetFieldGrid != null)
               {
                  for each(stMoveIntruder in stTargetFieldGrid.a_1511)
                  {
                     if(!stMoveIntruder.isCannotSeeByFighter && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState))
                     {
                        iTotalIntruderNum++;
                     }
                  }
               }
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo);
               if(stTargetFieldGrid != null)
               {
                  for each(stMoveIntruder in stTargetFieldGrid.a_1511)
                  {
                     if(!stMoveIntruder.isCannotSeeByFighter && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState))
                     {
                        iTotalIntruderNum++;
                     }
                  }
               }
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo + 1);
               if(stTargetFieldGrid != null)
               {
                  for each(stMoveIntruder in stTargetFieldGrid.a_1511)
                  {
                     if(!stMoveIntruder.isCannotSeeByFighter && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState))
                     {
                        iTotalIntruderNum++;
                     }
                  }
               }
            }
         }
         return iTotalIntruderNum;
      }
   }
}

