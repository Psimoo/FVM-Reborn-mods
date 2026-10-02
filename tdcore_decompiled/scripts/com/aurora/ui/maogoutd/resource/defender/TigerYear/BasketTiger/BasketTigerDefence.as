package com.aurora.ui.maogoutd.resource.defender.TigerYear.BasketTiger
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class BasketTigerDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 275;
      
      public function BasketTigerDefence()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 2.2;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 2.2;
               break;
            case 1:
               iSkillDegreeEffect = 2.15;
               break;
            case 2:
               iSkillDegreeEffect = 2.1;
               break;
            case 3:
               iSkillDegreeEffect = 2.05;
               break;
            case 4:
               iSkillDegreeEffect = 2;
               break;
            case 5:
               iSkillDegreeEffect = 1.95;
               break;
            case 6:
               iSkillDegreeEffect = 1.9;
               break;
            case 7:
               iSkillDegreeEffect = 1.85;
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
               iStarDegreeEffect = 8;
               break;
            case 1:
               iStarDegreeEffect = 10;
               break;
            case 2:
               iStarDegreeEffect = 12;
               break;
            case 3:
               iStarDegreeEffect = 14;
               break;
            case 4:
               iStarDegreeEffect = 16;
               break;
            case 5:
               iStarDegreeEffect = 18;
               break;
            case 6:
               iStarDegreeEffect = 21;
               break;
            case 7:
               iStarDegreeEffect = 24;
               break;
            case 8:
               iStarDegreeEffect = 27;
               break;
            case 9:
               iStarDegreeEffect = 38;
               break;
            case 10:
               iStarDegreeEffect = 45;
               break;
            case 11:
               iStarDegreeEffect = 54;
               break;
            case 12:
               iStarDegreeEffect = 63;
               break;
            case 13:
               iStarDegreeEffect = 72;
               break;
            case 14:
               iStarDegreeEffect = 81;
               break;
            case 15:
               iStarDegreeEffect = 96;
               break;
            case 16:
               iStarDegreeEffect = 112;
         }
         return 10 * iStarDegreeEffect;
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

