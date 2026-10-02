package com.aurora.ui.maogoutd.resource.defender.CattleYear.BubbleGum
{
   public class BubbleGumBoomDefine
   {
      
      internal static const DEFENSE_PRICE:int = 155;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 175;
      
      internal static const SECONDTRANS_DEFENSE_PRICE:int = 225;
      
      internal static const MAX_LIFE_VALUE:int = 1000 + 300;
      
      public function BubbleGumBoomDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return GetCardGrownTimeValue(iStarDegree);
      }
      
      internal static function GetCardGrownTimeValue(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 30;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 30;
               break;
            case 1:
               iStarDegreeEffect = 29;
               break;
            case 2:
               iStarDegreeEffect = 28;
               break;
            case 3:
               iStarDegreeEffect = 27;
               break;
            case 4:
               iStarDegreeEffect = 26;
               break;
            case 5:
               iStarDegreeEffect = 25;
               break;
            case 6:
               iStarDegreeEffect = 24;
               break;
            case 7:
               iStarDegreeEffect = 22;
               break;
            case 8:
               iStarDegreeEffect = 20;
               break;
            case 9:
               iStarDegreeEffect = 18;
               break;
            case 10:
               iStarDegreeEffect = 16;
               break;
            case 11:
               iStarDegreeEffect = 14;
               break;
            case 12:
               iStarDegreeEffect = 12;
               break;
            case 13:
               iStarDegreeEffect = 10;
               break;
            case 14:
               iStarDegreeEffect = 9;
               break;
            case 15:
               iStarDegreeEffect = 8;
               break;
            case 16:
               iStarDegreeEffect = 7;
         }
         return iStarDegreeEffect * 10;
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
               iSkillDegreeEffect = 14;
               break;
            case 2:
               iSkillDegreeEffect = 13;
               break;
            case 3:
               iSkillDegreeEffect = 12;
               break;
            case 4:
               iSkillDegreeEffect = 11;
               break;
            case 5:
               iSkillDegreeEffect = 10;
               break;
            case 6:
               iSkillDegreeEffect = 9;
               break;
            case 7:
               iSkillDegreeEffect = 8;
               break;
            case 8:
               iSkillDegreeEffect = 5;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function GetCardLifeValue(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 5;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 5;
               break;
            case 1:
               iStarDegreeEffect = 5;
               break;
            case 2:
               iStarDegreeEffect = 5;
               break;
            case 3:
               iStarDegreeEffect = 6;
               break;
            case 4:
               iStarDegreeEffect = 6;
               break;
            case 5:
               iStarDegreeEffect = 6;
               break;
            case 6:
               iStarDegreeEffect = 7;
               break;
            case 7:
               iStarDegreeEffect = 7;
               break;
            case 8:
               iStarDegreeEffect = 8;
               break;
            case 9:
               iStarDegreeEffect = 9;
               break;
            case 10:
               iStarDegreeEffect = 10;
               break;
            case 11:
               iStarDegreeEffect = 11;
               break;
            case 12:
               iStarDegreeEffect = 13;
               break;
            case 13:
               iStarDegreeEffect = 15;
               break;
            case 14:
               iStarDegreeEffect = 17;
               break;
            case 15:
               iStarDegreeEffect = 20;
               break;
            case 16:
               iStarDegreeEffect = 25;
         }
         return iStarDegreeEffect * 10;
      }
   }
}

