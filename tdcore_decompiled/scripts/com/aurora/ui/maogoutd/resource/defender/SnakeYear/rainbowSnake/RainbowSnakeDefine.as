package com.aurora.ui.maogoutd.resource.defender.SnakeYear.rainbowSnake
{
   public class RainbowSnakeDefine
   {
      
      internal static const DEFENSE_PRICE:int = 205;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 95;
      
      internal static const SECONDTRANS_DEFENSE_PRICE:int = 95;
      
      internal static const POISON_ADD_HURT_VALUE:int = 35;
      
      internal static const MAX_LIFE_VALUE:int = 20 * 10;
      
      public function RainbowSnakeDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 15 * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 5;
         switch(iStarDegree)
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
               iStarDegreeEffect = 16;
               break;
            case 8:
               iStarDegreeEffect = 18;
               break;
            case 9:
               iStarDegreeEffect = 20;
               break;
            case 10:
               iStarDegreeEffect = 26;
               break;
            case 11:
               iStarDegreeEffect = 32;
               break;
            case 12:
               iStarDegreeEffect = 40;
               break;
            case 13:
               iStarDegreeEffect = 48;
               break;
            case 14:
               iStarDegreeEffect = 58;
               break;
            case 15:
               iStarDegreeEffect = 68;
               break;
            case 16:
               iStarDegreeEffect = 78;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function GetLifeValueByStarDegree(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 85;
               break;
            case 1:
               iStarDegreeEffect = 90;
               break;
            case 2:
               iStarDegreeEffect = 95;
               break;
            case 3:
               iStarDegreeEffect = 100;
               break;
            case 4:
               iStarDegreeEffect = 110;
               break;
            case 5:
               iStarDegreeEffect = 120;
               break;
            case 6:
               iStarDegreeEffect = 130;
               break;
            case 7:
               iStarDegreeEffect = 140;
               break;
            case 8:
               iStarDegreeEffect = 155;
               break;
            case 9:
               iStarDegreeEffect = 170;
               break;
            case 10:
               iStarDegreeEffect = 185;
               break;
            case 11:
               iStarDegreeEffect = 200;
               break;
            case 12:
               iStarDegreeEffect = 220;
               break;
            case 13:
               iStarDegreeEffect = 240;
               break;
            case 14:
               iStarDegreeEffect = 260;
               break;
            case 15:
               iStarDegreeEffect = 280;
               break;
            case 16:
               iStarDegreeEffect = 300;
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
               iSkillDegreeEffect = 2;
               break;
            case 1:
               iSkillDegreeEffect = 1.95;
               break;
            case 2:
               iSkillDegreeEffect = 1.9;
               break;
            case 3:
               iSkillDegreeEffect = 1.85;
               break;
            case 4:
               iSkillDegreeEffect = 1.8;
               break;
            case 5:
               iSkillDegreeEffect = 1.75;
               break;
            case 6:
               iSkillDegreeEffect = 1.7;
               break;
            case 7:
               iSkillDegreeEffect = 1.6;
               break;
            case 8:
               iSkillDegreeEffect = 1.5;
         }
         return iSkillDegreeEffect * 20;
      }
   }
}

