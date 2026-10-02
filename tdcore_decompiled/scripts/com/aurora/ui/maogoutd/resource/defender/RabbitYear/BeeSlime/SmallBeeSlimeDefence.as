package com.aurora.ui.maogoutd.resource.defender.RabbitYear.BeeSlime
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class SmallBeeSlimeDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 0;
      
      public function SmallBeeSlimeDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 1.3;
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
               iSkillDegreeEffect = 0.9;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 1.3;
               break;
            case 1:
               iStarDegreeEffect = 1.4;
               break;
            case 2:
               iStarDegreeEffect = 1.6;
               break;
            case 3:
               iStarDegreeEffect = 1.8;
               break;
            case 4:
               iStarDegreeEffect = 2.1;
               break;
            case 5:
               iStarDegreeEffect = 2.4;
               break;
            case 6:
               iStarDegreeEffect = 2.7;
               break;
            case 7:
               iStarDegreeEffect = 3;
               break;
            case 8:
               iStarDegreeEffect = 4;
               break;
            case 9:
               iStarDegreeEffect = 5;
               break;
            case 10:
               iStarDegreeEffect = 6;
               break;
            case 11:
               iStarDegreeEffect = 7;
               break;
            case 12:
               iStarDegreeEffect = 9;
               break;
            case 13:
               iStarDegreeEffect = 11;
               break;
            case 14:
               iStarDegreeEffect = 13;
               break;
            case 15:
               iStarDegreeEffect = 15;
               break;
            case 16:
               iStarDegreeEffect = 17;
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

