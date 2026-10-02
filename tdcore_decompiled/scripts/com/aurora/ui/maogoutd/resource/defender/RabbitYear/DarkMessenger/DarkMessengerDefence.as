package com.aurora.ui.maogoutd.resource.defender.RabbitYear.DarkMessenger
{
   public class DarkMessengerDefence
   {
      
      internal static const DEFENSE_PRICE:int = 330;
      
      internal static const REDUCE_DEFENSE_PRICE:int = 50;
      
      internal static const HURT_ADDITION:Number = 0.2;
      
      internal static const FIRSTTRANS_LIFEADD:int = 24;
      
      internal static const LIFE_VALUE:int = 2000;
      
      public function DarkMessengerDefence()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int) : int
      {
         return 500;
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 8.5;
               break;
            case 1:
               iStarDegreeEffect = 10;
               break;
            case 2:
               iStarDegreeEffect = 11.5;
               break;
            case 3:
               iStarDegreeEffect = 14.5;
               break;
            case 4:
               iStarDegreeEffect = 17.5;
               break;
            case 5:
               iStarDegreeEffect = 20.5;
               break;
            case 6:
               iStarDegreeEffect = 23.5;
               break;
            case 7:
               iStarDegreeEffect = 28.5;
               break;
            case 8:
               iStarDegreeEffect = 32.5;
               break;
            case 9:
               iStarDegreeEffect = 37.5;
               break;
            case 10:
               iStarDegreeEffect = 42.5;
               break;
            case 11:
               iStarDegreeEffect = 47.5;
               break;
            case 12:
               iStarDegreeEffect = 52.5;
               break;
            case 13:
               iStarDegreeEffect = 58;
               break;
            case 14:
               iStarDegreeEffect = 64;
               break;
            case 15:
               iStarDegreeEffect = 70;
               break;
            case 16:
               iStarDegreeEffect = 76;
               break;
            case 17:
               iStarDegreeEffect = 116;
               break;
            case 18:
               iStarDegreeEffect = 186;
         }
         return 10 * iStarDegreeEffect;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 15;
               break;
            case 1:
               iSkillDegreeEffect = 16;
               break;
            case 2:
               iSkillDegreeEffect = 17;
               break;
            case 3:
               iSkillDegreeEffect = 18;
               break;
            case 4:
               iSkillDegreeEffect = 20;
               break;
            case 5:
               iSkillDegreeEffect = 22;
               break;
            case 6:
               iSkillDegreeEffect = 26;
               break;
            case 7:
               iSkillDegreeEffect = 31;
               break;
            case 8:
               iSkillDegreeEffect = 36;
         }
         return iSkillDegreeEffect * 20;
      }
   }
}

