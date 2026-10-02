package com.aurora.ui.maogoutd.resource.defender.goldVirgo
{
   public class GoldVirgoGuardProtectorDefine
   {
      
      internal static const DEFENSE_PRICE:int = 125;
      
      internal static const LIFE_ADDITION:Number = 0.25;
      
      public function GoldVirgoGuardProtectorDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 200 - iStarDegree * 10;
      }
      
      internal static function GetCardLifeValueStarDegreeEffect(iStarDegree:int) : int
      {
         var iStarLifeValueEffect:int = 95;
         switch(iStarDegree)
         {
            case 0:
               iStarLifeValueEffect = 95;
               break;
            case 1:
               iStarLifeValueEffect = 100;
               break;
            case 2:
               iStarLifeValueEffect = 105;
               break;
            case 3:
               iStarLifeValueEffect = 110;
               break;
            case 4:
               iStarLifeValueEffect = 115;
               break;
            case 5:
               iStarLifeValueEffect = 125;
               break;
            case 6:
               iStarLifeValueEffect = 135;
               break;
            case 7:
               iStarLifeValueEffect = 145;
               break;
            case 8:
               iStarLifeValueEffect = 155;
               break;
            case 9:
               iStarLifeValueEffect = 170;
               break;
            case 10:
               iStarLifeValueEffect = 185;
               break;
            case 11:
               iStarLifeValueEffect = 200;
               break;
            case 12:
               iStarLifeValueEffect = 215;
               break;
            case 13:
               iStarLifeValueEffect = 235;
               break;
            case 14:
               iStarLifeValueEffect = 255;
               break;
            case 15:
               iStarLifeValueEffect = 275;
               break;
            case 16:
               iStarLifeValueEffect = 295;
               break;
            case 17:
               iStarLifeValueEffect = 330;
               break;
            case 18:
               iStarLifeValueEffect = 396;
         }
         return iStarLifeValueEffect * 10;
      }
   }
}

