package com.aurora.ui.maogoutd.resource.defender.fusionCard.EggPitcher
{
   public class EggPitcherDefence
   {
      
      public function EggPitcherDefence()
      {
         super();
      }
      
      public static function a_3965(a_1094:int) : int
      {
         var iStarDegreeEffect:int = 5;
         switch(a_1094)
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
               iStarDegreeEffect = 28;
               break;
            case 11:
               iStarDegreeEffect = 36;
               break;
            case 12:
               iStarDegreeEffect = 45;
               break;
            case 13:
               iStarDegreeEffect = 55;
               break;
            case 14:
               iStarDegreeEffect = 66;
               break;
            case 15:
               iStarDegreeEffect = 78;
               break;
            case 16:
               iStarDegreeEffect = 90;
         }
         return 10 * iStarDegreeEffect;
      }
      
      public static function a_3966(m_iSkillDegree:int) : int
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
      
      public static function GetCardGradeDegree1EffectValue(iGradeDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iGradeDegree)
         {
            case 0:
               iStarDegreeEffect = 3;
               break;
            case 1:
               iStarDegreeEffect = 3;
               break;
            case 2:
               iStarDegreeEffect = 3.5;
               break;
            case 3:
               iStarDegreeEffect = 4;
               break;
            case 4:
               iStarDegreeEffect = 5;
               break;
            case 5:
               iStarDegreeEffect = 6;
               break;
            case 6:
               iStarDegreeEffect = 7;
               break;
            case 7:
               iStarDegreeEffect = 8.5;
               break;
            case 8:
               iStarDegreeEffect = 10;
               break;
            case 9:
               iStarDegreeEffect = 11.5;
               break;
            case 10:
               iStarDegreeEffect = 14;
               break;
            case 11:
               iStarDegreeEffect = 18;
               break;
            case 12:
               iStarDegreeEffect = 22.5;
               break;
            case 13:
               iStarDegreeEffect = 27.5;
               break;
            case 14:
               iStarDegreeEffect = 33;
               break;
            case 15:
               iStarDegreeEffect = 39;
               break;
            case 16:
               iStarDegreeEffect = 45;
         }
         return 10 * iStarDegreeEffect;
      }
      
      public static function GetCardGradeDegree2EffectValue(iGradeDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iGradeDegree)
         {
            case 0:
               iStarDegreeEffect = 1.3;
               break;
            case 1:
               iStarDegreeEffect = 1.3;
               break;
            case 2:
               iStarDegreeEffect = 1.5;
               break;
            case 3:
               iStarDegreeEffect = 1.8;
               break;
            case 4:
               iStarDegreeEffect = 2.4;
               break;
            case 5:
               iStarDegreeEffect = 3.1;
               break;
            case 6:
               iStarDegreeEffect = 3.8;
               break;
            case 7:
               iStarDegreeEffect = 4.5;
               break;
            case 8:
               iStarDegreeEffect = 5.4;
               break;
            case 9:
               iStarDegreeEffect = 6.3;
               break;
            case 10:
               iStarDegreeEffect = 7.6;
               break;
            case 11:
               iStarDegreeEffect = 9;
               break;
            case 12:
               iStarDegreeEffect = 10.4;
               break;
            case 13:
               iStarDegreeEffect = 11.8;
               break;
            case 14:
               iStarDegreeEffect = 13.2;
               break;
            case 15:
               iStarDegreeEffect = 14.6;
               break;
            case 16:
               iStarDegreeEffect = 16.2;
         }
         return 10 * iStarDegreeEffect;
      }
      
      public static function GetCardGradeDegree3EffectValue(iGradeDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iGradeDegree)
         {
            case 0:
               iStarDegreeEffect = 1.05;
               break;
            case 1:
               iStarDegreeEffect = 1.05;
               break;
            case 2:
               iStarDegreeEffect = 1.05;
               break;
            case 3:
               iStarDegreeEffect = 1.1;
               break;
            case 4:
               iStarDegreeEffect = 1.1;
               break;
            case 5:
               iStarDegreeEffect = 1.15;
               break;
            case 6:
               iStarDegreeEffect = 1.15;
               break;
            case 7:
               iStarDegreeEffect = 1.2;
               break;
            case 8:
               iStarDegreeEffect = 1.2;
               break;
            case 9:
               iStarDegreeEffect = 1.25;
               break;
            case 10:
               iStarDegreeEffect = 1.25;
               break;
            case 11:
               iStarDegreeEffect = 1.3;
               break;
            case 12:
               iStarDegreeEffect = 1.4;
               break;
            case 13:
               iStarDegreeEffect = 1.5;
               break;
            case 14:
               iStarDegreeEffect = 1.6;
               break;
            case 15:
               iStarDegreeEffect = 1.7;
               break;
            case 16:
               iStarDegreeEffect = 1.8;
         }
         return 20 * iStarDegreeEffect;
      }
      
      public static function GetCardGradeDegree4EffectValue(iGradeDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iGradeDegree)
         {
            case 0:
               iStarDegreeEffect = 0.05;
               break;
            case 1:
               iStarDegreeEffect = 0.05;
               break;
            case 2:
               iStarDegreeEffect = 0.06;
               break;
            case 3:
               iStarDegreeEffect = 0.07;
               break;
            case 4:
               iStarDegreeEffect = 0.08;
               break;
            case 5:
               iStarDegreeEffect = 0.09;
               break;
            case 6:
               iStarDegreeEffect = 0.1;
               break;
            case 7:
               iStarDegreeEffect = 0.11;
               break;
            case 8:
               iStarDegreeEffect = 0.12;
               break;
            case 9:
               iStarDegreeEffect = 0.13;
               break;
            case 10:
               iStarDegreeEffect = 0.14;
               break;
            case 11:
               iStarDegreeEffect = 0.15;
               break;
            case 12:
               iStarDegreeEffect = 0.16;
               break;
            case 13:
               iStarDegreeEffect = 0.17;
               break;
            case 14:
               iStarDegreeEffect = 0.18;
               break;
            case 15:
               iStarDegreeEffect = 0.19;
               break;
            case 16:
               iStarDegreeEffect = 0.2;
         }
         return 100 * iStarDegreeEffect;
      }
   }
}

