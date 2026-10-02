package com.aurora.ui.maogoutd.resource.defender.PigYear.GuiHuaJiu
{
   public class AlcoholBombDefine
   {
      
      internal static const DEFENSE_PRICE:int = 125;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 175;
      
      internal static const SECONDTRANS_DEFENSE_PRICE:int = 225;
      
      internal static const MAX_LIFE_VALUE:int = 20000;
      
      public function AlcoholBombDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 50;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 50;
               break;
            case 1:
               iSkillDegreeEffect = 48;
               break;
            case 2:
               iSkillDegreeEffect = 46;
               break;
            case 3:
               iSkillDegreeEffect = 42;
               break;
            case 4:
               iSkillDegreeEffect = 38;
               break;
            case 5:
               iSkillDegreeEffect = 34;
               break;
            case 6:
               iSkillDegreeEffect = 30;
               break;
            case 7:
               iSkillDegreeEffect = 25;
               break;
            case 8:
               iSkillDegreeEffect = 20;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 50;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 50;
               break;
            case 1:
               iStarDegreeEffect = 54;
               break;
            case 2:
               iStarDegreeEffect = 58;
               break;
            case 3:
               iStarDegreeEffect = 62;
               break;
            case 4:
               iStarDegreeEffect = 68;
               break;
            case 5:
               iStarDegreeEffect = 74;
               break;
            case 6:
               iStarDegreeEffect = 80;
               break;
            case 7:
               iStarDegreeEffect = 88;
               break;
            case 8:
               iStarDegreeEffect = 96;
               break;
            case 9:
               iStarDegreeEffect = 104;
               break;
            case 10:
               iStarDegreeEffect = 114;
               break;
            case 11:
               iStarDegreeEffect = 124;
               break;
            case 12:
               iStarDegreeEffect = 134;
               break;
            case 13:
               iStarDegreeEffect = 144;
               break;
            case 14:
               iStarDegreeEffect = 154;
               break;
            case 15:
               iStarDegreeEffect = 164;
               break;
            case 16:
               iStarDegreeEffect = 174;
         }
         return iStarDegreeEffect * 10;
      }
   }
}

