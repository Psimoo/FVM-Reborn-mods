package com.aurora.ui.maogoutd.resource.defender.TigerYear.DaFuTiger
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class DaFuTigerDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 120;
      
      public function DaFuTigerDefence()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return a_3965(iStarDegree);
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 50;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 50;
               break;
            case 1:
               iStarDegreeEffect = 48;
               break;
            case 2:
               iStarDegreeEffect = 46;
               break;
            case 3:
               iStarDegreeEffect = 44;
               break;
            case 4:
               iStarDegreeEffect = 42;
               break;
            case 5:
               iStarDegreeEffect = 40;
               break;
            case 6:
               iStarDegreeEffect = 38;
               break;
            case 7:
               iStarDegreeEffect = 35;
               break;
            case 8:
               iStarDegreeEffect = 32;
               break;
            case 9:
               iStarDegreeEffect = 29;
               break;
            case 10:
               iStarDegreeEffect = 26;
               break;
            case 11:
               iStarDegreeEffect = 23;
               break;
            case 12:
               iStarDegreeEffect = 20;
               break;
            case 13:
               iStarDegreeEffect = 17;
               break;
            case 14:
               iStarDegreeEffect = 14;
               break;
            case 15:
               iStarDegreeEffect = 11;
               break;
            case 16:
               iStarDegreeEffect = 7;
         }
         return 10 * iStarDegreeEffect;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 15;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 15;
               break;
            case 1:
               iSkillDegreeEffect = 14.5;
               break;
            case 2:
               iSkillDegreeEffect = 14;
               break;
            case 3:
               iSkillDegreeEffect = 13.5;
               break;
            case 4:
               iSkillDegreeEffect = 13;
               break;
            case 5:
               iSkillDegreeEffect = 12;
               break;
            case 6:
               iSkillDegreeEffect = 11;
               break;
            case 7:
               iSkillDegreeEffect = 10;
               break;
            case 8:
               iSkillDegreeEffect = 8;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function GetFieldIntruderNumForAheadDirection(stFieldGrid:a_3491) : int
      {
         var stTargetFieldGrid:a_3491 = null;
         var iIntruderIndex:int = 0;
         var iTotalIntruderNum:int = 0;
         var i:int = 0;
         if(stFieldGrid)
         {
            for(i = stFieldGrid.m_iXGridNo; i < BattleFieldView.a_1011; i++)
            {
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo);
               for(iIntruderIndex = 0; iIntruderIndex < stTargetFieldGrid.a_1511.length; iIntruderIndex++)
               {
                  if((stTargetFieldGrid.a_1511[iIntruderIndex] as a_4206).iSpaceState == 0)
                  {
                     iTotalIntruderNum++;
                  }
               }
            }
         }
         return iTotalIntruderNum;
      }
   }
}

