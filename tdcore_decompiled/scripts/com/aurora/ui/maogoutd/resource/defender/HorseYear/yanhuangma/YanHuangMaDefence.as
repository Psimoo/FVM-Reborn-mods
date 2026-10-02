package com.aurora.ui.maogoutd.resource.defender.HorseYear.yanhuangma
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class YanHuangMaDefence
   {
      
      internal static const DEFENSE_PRICE:int = 320;
      
      public function YanHuangMaDefence()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 3.5;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 3.5;
               break;
            case 1:
               iSkillDegreeEffect = 3.45;
               break;
            case 2:
               iSkillDegreeEffect = 3.4;
               break;
            case 3:
               iSkillDegreeEffect = 3.35;
               break;
            case 4:
               iSkillDegreeEffect = 3.3;
               break;
            case 5:
               iSkillDegreeEffect = 3.2;
               break;
            case 6:
               iSkillDegreeEffect = 3.1;
               break;
            case 7:
               iSkillDegreeEffect = 3;
               break;
            case 8:
               iSkillDegreeEffect = 2.5;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 7.5;
               break;
            case 1:
               iStarDegreeEffect = 8.5;
               break;
            case 2:
               iStarDegreeEffect = 9.5;
               break;
            case 3:
               iStarDegreeEffect = 11;
               break;
            case 4:
               iStarDegreeEffect = 13;
               break;
            case 5:
               iStarDegreeEffect = 15;
               break;
            case 6:
               iStarDegreeEffect = 17;
               break;
            case 7:
               iStarDegreeEffect = 20;
               break;
            case 8:
               iStarDegreeEffect = 25;
               break;
            case 9:
               iStarDegreeEffect = 30;
               break;
            case 10:
               iStarDegreeEffect = 40;
               break;
            case 11:
               iStarDegreeEffect = 50;
               break;
            case 12:
               iStarDegreeEffect = 65;
               break;
            case 13:
               iStarDegreeEffect = 80;
               break;
            case 14:
               iStarDegreeEffect = 100;
               break;
            case 15:
               iStarDegreeEffect = 120;
               break;
            case 16:
               iStarDegreeEffect = 140;
         }
         return 10 * iStarDegreeEffect;
      }
      
      public static function GetFieldIntruderNumForFiveDirection(stFieldGrid:a_3491) : int
      {
         var i:int = 0;
         if(stFieldGrid)
         {
            for(i = 0; i < BattleFieldView.a_1012; i++)
            {
               if(stFieldGrid.m_stCurrentBattbleFieldView.stFieldRowIntruderStatusArray[i] > 0)
               {
                  return 1;
               }
            }
         }
         return 0;
      }
   }
}

