package com.aurora.ui.maogoutd.resource.defender.TigerYear.PokerShield
{
   public class PokerShieldDefine
   {
      
      internal static const DEFENSE_PRICE:int = 130;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 95;
      
      internal static const SECONDTRANS_DEFENSE_PRICE:int = 95;
      
      internal static const POISON_ADD_HURT_VALUE:int = 35;
      
      internal static const MAX_LIFE_VALUE:int = 20 * 10;
      
      public function PokerShieldDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 25 * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 55;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 55;
               break;
            case 1:
               iStarDegreeEffect = 54;
               break;
            case 2:
               iStarDegreeEffect = 53;
               break;
            case 3:
               iStarDegreeEffect = 52;
               break;
            case 4:
               iStarDegreeEffect = 50;
               break;
            case 5:
               iStarDegreeEffect = 48;
               break;
            case 6:
               iStarDegreeEffect = 46;
               break;
            case 7:
               iStarDegreeEffect = 43;
               break;
            case 8:
               iStarDegreeEffect = 40;
               break;
            case 9:
               iStarDegreeEffect = 37;
               break;
            case 10:
               iStarDegreeEffect = 34;
               break;
            case 11:
               iStarDegreeEffect = 31;
               break;
            case 12:
               iStarDegreeEffect = 28;
               break;
            case 13:
               iStarDegreeEffect = 25;
               break;
            case 14:
               iStarDegreeEffect = 22;
               break;
            case 15:
               iStarDegreeEffect = 19;
               break;
            case 16:
               iStarDegreeEffect = 15;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function GetLifeValueByStarDegree(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 20;
               break;
            case 1:
               iStarDegreeEffect = 25;
               break;
            case 2:
               iStarDegreeEffect = 30;
               break;
            case 3:
               iStarDegreeEffect = 35;
               break;
            case 4:
               iStarDegreeEffect = 40;
               break;
            case 5:
               iStarDegreeEffect = 45;
               break;
            case 6:
               iStarDegreeEffect = 50;
               break;
            case 7:
               iStarDegreeEffect = 55;
               break;
            case 8:
               iStarDegreeEffect = 60;
               break;
            case 9:
               iStarDegreeEffect = 65;
               break;
            case 10:
               iStarDegreeEffect = 70;
               break;
            case 11:
               iStarDegreeEffect = 75;
               break;
            case 12:
               iStarDegreeEffect = 80;
               break;
            case 13:
               iStarDegreeEffect = 90;
               break;
            case 14:
               iStarDegreeEffect = 100;
               break;
            case 15:
               iStarDegreeEffect = 120;
               break;
            case 16:
               iStarDegreeEffect = 150;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function GetProduceEnergyTime(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 27;
               break;
            case 1:
               iStarDegreeEffect = 26;
               break;
            case 2:
               iStarDegreeEffect = 25;
               break;
            case 3:
               iStarDegreeEffect = 24;
               break;
            case 4:
               iStarDegreeEffect = 23;
               break;
            case 5:
               iStarDegreeEffect = 22;
               break;
            case 6:
               iStarDegreeEffect = 21;
               break;
            case 7:
               iStarDegreeEffect = 20;
               break;
            case 8:
               iStarDegreeEffect = 19;
               break;
            case 9:
               iStarDegreeEffect = 18;
               break;
            case 10:
               iStarDegreeEffect = 17;
               break;
            case 11:
               iStarDegreeEffect = 16;
               break;
            case 12:
               iStarDegreeEffect = 15;
               break;
            case 13:
               iStarDegreeEffect = 14;
               break;
            case 14:
               iStarDegreeEffect = 13;
               break;
            case 15:
               iStarDegreeEffect = 12;
               break;
            case 16:
               iStarDegreeEffect = 11;
         }
         return iStarDegreeEffect * 20;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 5;
               break;
            case 1:
               iSkillDegreeEffect = 7;
               break;
            case 2:
               iSkillDegreeEffect = 9;
               break;
            case 3:
               iSkillDegreeEffect = 11;
               break;
            case 4:
               iSkillDegreeEffect = 13;
               break;
            case 5:
               iSkillDegreeEffect = 15;
               break;
            case 6:
               iSkillDegreeEffect = 17;
               break;
            case 7:
               iSkillDegreeEffect = 20;
               break;
            case 8:
               iSkillDegreeEffect = 25;
         }
         return iSkillDegreeEffect;
      }
   }
}

