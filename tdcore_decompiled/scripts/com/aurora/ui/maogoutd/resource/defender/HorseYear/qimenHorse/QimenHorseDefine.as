package com.aurora.ui.maogoutd.resource.defender.HorseYear.qimenHorse
{
   public class QimenHorseDefine
   {
      
      internal static const DEFENSE_PRICE:int = 270;
      
      public function QimenHorseDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 6;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 7.5;
               break;
            case 1:
               iStarDegreeEffect = 9;
               break;
            case 2:
               iStarDegreeEffect = 10.5;
               break;
            case 3:
               iStarDegreeEffect = 13;
               break;
            case 4:
               iStarDegreeEffect = 15;
               break;
            case 5:
               iStarDegreeEffect = 17;
               break;
            case 6:
               iStarDegreeEffect = 19;
               break;
            case 7:
               iStarDegreeEffect = 24;
               break;
            case 8:
               iStarDegreeEffect = 29;
               break;
            case 9:
               iStarDegreeEffect = 34;
               break;
            case 10:
               iStarDegreeEffect = 40;
               break;
            case 11:
               iStarDegreeEffect = 46;
               break;
            case 12:
               iStarDegreeEffect = 52;
               break;
            case 13:
               iStarDegreeEffect = 58;
               break;
            case 14:
               iStarDegreeEffect = 65;
               break;
            case 15:
               iStarDegreeEffect = 72;
               break;
            case 16:
               iStarDegreeEffect = 82;
         }
         return int(iStarDegreeEffect * 10);
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:int = 150;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 150;
               break;
            case 1:
               iSkillDegreeEffect = 145;
               break;
            case 2:
               iSkillDegreeEffect = 140;
               break;
            case 3:
               iSkillDegreeEffect = 130;
               break;
            case 4:
               iSkillDegreeEffect = 120;
               break;
            case 5:
               iSkillDegreeEffect = 110;
               break;
            case 6:
               iSkillDegreeEffect = 100;
               break;
            case 7:
               iSkillDegreeEffect = 90;
               break;
            case 8:
               iSkillDegreeEffect = 70;
         }
         return iSkillDegreeEffect;
      }
   }
}

