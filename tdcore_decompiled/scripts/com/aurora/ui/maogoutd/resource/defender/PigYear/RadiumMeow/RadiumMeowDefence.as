package com.aurora.ui.maogoutd.resource.defender.PigYear.RadiumMeow
{
   public class RadiumMeowDefence
   {
      
      internal static const DEFENSE_PRICE:int = 325;
      
      internal static const REDUCE_DEFENSE_PRICE:int = 50;
      
      internal static const HURT_ADDITION:Number = 0.2;
      
      internal static const FIRSTTRANS_LIFEADD:int = 24;
      
      internal static const LIFE_VALUE:int = 2000;
      
      public function RadiumMeowDefence()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int) : int
      {
         return 550;
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 6;
               break;
            case 1:
               iStarDegreeEffect = 7;
               break;
            case 2:
               iStarDegreeEffect = 8;
               break;
            case 3:
               iStarDegreeEffect = 10;
               break;
            case 4:
               iStarDegreeEffect = 12;
               break;
            case 5:
               iStarDegreeEffect = 14;
               break;
            case 6:
               iStarDegreeEffect = 16;
               break;
            case 7:
               iStarDegreeEffect = 20;
               break;
            case 8:
               iStarDegreeEffect = 23;
               break;
            case 9:
               iStarDegreeEffect = 26;
               break;
            case 10:
               iStarDegreeEffect = 30;
               break;
            case 11:
               iStarDegreeEffect = 34;
               break;
            case 12:
               iStarDegreeEffect = 38;
               break;
            case 13:
               iStarDegreeEffect = 42;
               break;
            case 14:
               iStarDegreeEffect = 46;
               break;
            case 15:
               iStarDegreeEffect = 50;
               break;
            case 16:
               iStarDegreeEffect = 54;
         }
         return 10 * iStarDegreeEffect;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 10;
               break;
            case 1:
               iSkillDegreeEffect = 11;
               break;
            case 2:
               iSkillDegreeEffect = 12;
               break;
            case 3:
               iSkillDegreeEffect = 13;
               break;
            case 4:
               iSkillDegreeEffect = 15;
               break;
            case 5:
               iSkillDegreeEffect = 17;
               break;
            case 6:
               iSkillDegreeEffect = 20;
               break;
            case 7:
               iSkillDegreeEffect = 23;
               break;
            case 8:
               iSkillDegreeEffect = 26;
         }
         return iSkillDegreeEffect * 20;
      }
   }
}

