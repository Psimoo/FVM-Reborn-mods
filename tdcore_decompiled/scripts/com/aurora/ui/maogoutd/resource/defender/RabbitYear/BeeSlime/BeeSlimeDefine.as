package com.aurora.ui.maogoutd.resource.defender.RabbitYear.BeeSlime
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class BeeSlimeDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const DEFENSE_PRICE:int = 230;
      
      internal static const FIRSTTRANS_ADDITION:Number = 0.1;
      
      public function BeeSlimeDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 10;
               break;
            case 1:
               iStarDegreeEffect = 12;
               break;
            case 2:
               iStarDegreeEffect = 14;
               break;
            case 3:
               iStarDegreeEffect = 16;
               break;
            case 4:
               iStarDegreeEffect = 18;
               break;
            case 5:
               iStarDegreeEffect = 21;
               break;
            case 6:
               iStarDegreeEffect = 24;
               break;
            case 7:
               iStarDegreeEffect = 27;
               break;
            case 8:
               iStarDegreeEffect = 36;
               break;
            case 9:
               iStarDegreeEffect = 45;
               break;
            case 10:
               iStarDegreeEffect = 54;
               break;
            case 11:
               iStarDegreeEffect = 63;
               break;
            case 12:
               iStarDegreeEffect = 72;
               break;
            case 13:
               iStarDegreeEffect = 81;
               break;
            case 14:
               iStarDegreeEffect = 96;
               break;
            case 15:
               iStarDegreeEffect = 112;
               break;
            case 16:
               iStarDegreeEffect = 130;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 25;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 25;
               break;
            case 1:
               iSkillDegreeEffect = 24;
               break;
            case 2:
               iSkillDegreeEffect = 23;
               break;
            case 3:
               iSkillDegreeEffect = 22;
               break;
            case 4:
               iSkillDegreeEffect = 20;
               break;
            case 5:
               iSkillDegreeEffect = 18;
               break;
            case 6:
               iSkillDegreeEffect = 15;
               break;
            case 7:
               iSkillDegreeEffect = 12;
               break;
            case 8:
               iSkillDegreeEffect = 7;
         }
         return iSkillDegreeEffect * 10;
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

