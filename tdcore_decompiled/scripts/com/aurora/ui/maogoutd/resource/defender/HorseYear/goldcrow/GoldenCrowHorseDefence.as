package com.aurora.ui.maogoutd.resource.defender.HorseYear.goldcrow
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class GoldenCrowHorseDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 380;
      
      public function GoldenCrowHorseDefence()
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
               iSkillDegreeEffect = 2.5;
               break;
            case 1:
               iSkillDegreeEffect = 2.45;
               break;
            case 2:
               iSkillDegreeEffect = 2.4;
               break;
            case 3:
               iSkillDegreeEffect = 2.35;
               break;
            case 4:
               iSkillDegreeEffect = 2.3;
               break;
            case 5:
               iSkillDegreeEffect = 2.2;
               break;
            case 6:
               iSkillDegreeEffect = 2.1;
               break;
            case 7:
               iSkillDegreeEffect = 2;
               break;
            case 8:
               iSkillDegreeEffect = 1.75;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 5;
               break;
            case 1:
               iStarDegreeEffect = 6;
               break;
            case 2:
               iStarDegreeEffect = 7;
               break;
            case 3:
               iStarDegreeEffect = 8;
               break;
            case 4:
               iStarDegreeEffect = 10;
               break;
            case 5:
               iStarDegreeEffect = 12;
               break;
            case 6:
               iStarDegreeEffect = 14;
               break;
            case 7:
               iStarDegreeEffect = 17;
               break;
            case 8:
               iStarDegreeEffect = 20;
               break;
            case 9:
               iStarDegreeEffect = 23;
               break;
            case 10:
               iStarDegreeEffect = 26;
               break;
            case 11:
               iStarDegreeEffect = 30;
               break;
            case 12:
               iStarDegreeEffect = 38;
               break;
            case 13:
               iStarDegreeEffect = 48;
               break;
            case 14:
               iStarDegreeEffect = 58;
               break;
            case 15:
               iStarDegreeEffect = 68;
               break;
            case 16:
               iStarDegreeEffect = 80;
         }
         return 10 * iStarDegreeEffect;
      }
      
      internal static function GetFieldIntruderNumForAheadDirection(stFieldGrid:a_3491, range:int = 1) : int
      {
         var stTargetFieldGrid:a_3491 = null;
         var stMoveIntruder:a_4206 = null;
         var yStart:int = 0;
         var yEnd:int = 0;
         var yIndex:int = 0;
         var iTotalIntruderNum:int = 0;
         var i:int = 0;
         if(stFieldGrid)
         {
            yStart = Math.max(stFieldGrid.m_iYGridNo - range,0);
            yEnd = Math.min(stFieldGrid.m_iYGridNo + range,BattleFieldView.a_1012 - 1);
            loop0:
            for(i = 0; i < BattleFieldView.a_1011; )
            {
               yIndex = yStart;
               loop1:
               while(true)
               {
                  if(yIndex > yEnd)
                  {
                     i++;
                     continue loop0;
                  }
                  stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,yIndex);
                  if(stTargetFieldGrid != null)
                  {
                     for each(stMoveIntruder in stTargetFieldGrid.a_1511)
                     {
                        if(!stMoveIntruder.isCannotSeeByFighter && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState))
                        {
                           break loop1;
                        }
                     }
                  }
                  yIndex++;
               }
               return 1;
            }
         }
         return iTotalIntruderNum;
      }
   }
}

