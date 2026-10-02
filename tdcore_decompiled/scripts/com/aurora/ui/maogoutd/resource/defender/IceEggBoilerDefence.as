package com.aurora.ui.maogoutd.resource.defender
{
   public class IceEggBoilerDefence
   {
      
      internal static const DEFENSE_PRICE:int = 325;
      
      public function IceEggBoilerDefence()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int) : int
      {
         return 100;
      }
      
      internal static function a_3966(m_iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:int = 0;
         if(m_iSkillDegree <= 4)
         {
            iSkillDegreeEffect = 1 * m_iSkillDegree;
         }
         else if(m_iSkillDegree > 4)
         {
            iSkillDegreeEffect = 1 * 4 + 2 * (m_iSkillDegree - 4);
         }
         return 2 * iSkillDegreeEffect;
      }
      
      internal static function GetCardStarDegreeBaseEffectValue(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 10;
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
               iStarDegreeEffect = 20;
               break;
            case 6:
               iStarDegreeEffect = 22;
               break;
            case 7:
               iStarDegreeEffect = 26;
               break;
            case 8:
               iStarDegreeEffect = 32;
               break;
            case 9:
               iStarDegreeEffect = 40;
               break;
            case 10:
               iStarDegreeEffect = 55;
               break;
            case 11:
               iStarDegreeEffect = 70;
               break;
            case 12:
               iStarDegreeEffect = 85;
               break;
            case 13:
               iStarDegreeEffect = 100;
               break;
            case 14:
               iStarDegreeEffect = 115;
               break;
            case 15:
               iStarDegreeEffect = 130;
               break;
            case 16:
               iStarDegreeEffect = 145;
         }
         return iStarDegreeEffect;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 11;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 11;
               break;
            case 1:
               iStarDegreeEffect = 15.6;
               break;
            case 2:
               iStarDegreeEffect = 18.2;
               break;
            case 3:
               iStarDegreeEffect = 20.8;
               break;
            case 4:
               iStarDegreeEffect = 23.4;
               break;
            case 5:
               iStarDegreeEffect = 26;
               break;
            case 6:
               iStarDegreeEffect = 28.6;
               break;
            case 7:
               iStarDegreeEffect = 33.8;
               break;
            case 8:
               iStarDegreeEffect = 41.6;
               break;
            case 9:
               iStarDegreeEffect = 52;
               break;
            case 10:
               iStarDegreeEffect = 71.5;
               break;
            case 11:
               iStarDegreeEffect = 91;
               break;
            case 12:
               iStarDegreeEffect = 110.5;
               break;
            case 13:
               iStarDegreeEffect = 130;
               break;
            case 14:
               iStarDegreeEffect = 149.5;
               break;
            case 15:
               iStarDegreeEffect = 169;
               break;
            case 16:
               iStarDegreeEffect = 188.5;
         }
         return iStarDegreeEffect;
      }
   }
}

