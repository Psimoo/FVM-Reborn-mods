package com.aurora.ui.maogoutd.resource.defender.fusionCard.GodFire
{
   public class GodFirePrimaryAuxiliaryDefine
   {
      
      internal static const DEFENSE_PRICE:int = 175;
      
      internal static const REDUCE_DEFENSE_PRICE:int = 50;
      
      internal static const HURT_ADDITION:Number = 0.15;
      
      public function GodFirePrimaryAuxiliaryDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         return 28 - iSkillDegree;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 26;
               break;
            case 1:
               iStarDegreeEffect = 27;
               break;
            case 2:
               iStarDegreeEffect = 28;
               break;
            case 3:
               iStarDegreeEffect = 29;
               break;
            case 4:
               iStarDegreeEffect = 30;
               break;
            case 5:
               iStarDegreeEffect = 31;
               break;
            case 6:
               iStarDegreeEffect = 32;
               break;
            case 7:
               iStarDegreeEffect = 33;
               break;
            case 8:
               iStarDegreeEffect = 34;
               break;
            case 9:
               iStarDegreeEffect = 36;
               break;
            case 10:
               iStarDegreeEffect = 38;
               break;
            case 11:
               iStarDegreeEffect = 40;
               break;
            case 12:
               iStarDegreeEffect = 42;
               break;
            case 13:
               iStarDegreeEffect = 44;
               break;
            case 14:
               iStarDegreeEffect = 46;
               break;
            case 15:
               iStarDegreeEffect = 48;
               break;
            case 16:
               iStarDegreeEffect = 50;
               break;
            case 17:
               iStarDegreeEffect = 55;
               break;
            case 18:
               iStarDegreeEffect = 60;
         }
         return iStarDegreeEffect;
      }
      
      internal static function GetCardLifeValueStarDegreeEffect(iStarDegree:int) : int
      {
         var iStarLifeValueEffect:int = 50;
         switch(iStarDegree)
         {
            case 0:
               iStarLifeValueEffect = 50;
               break;
            case 1:
               iStarLifeValueEffect = 70;
               break;
            case 2:
               iStarLifeValueEffect = 90;
               break;
            case 3:
               iStarLifeValueEffect = 110;
               break;
            case 4:
               iStarLifeValueEffect = 130;
               break;
            case 5:
               iStarLifeValueEffect = 150;
               break;
            case 6:
               iStarLifeValueEffect = 170;
               break;
            case 7:
               iStarLifeValueEffect = 200;
               break;
            case 8:
               iStarLifeValueEffect = 230;
               break;
            case 9:
               iStarLifeValueEffect = 260;
               break;
            case 10:
               iStarLifeValueEffect = 290;
               break;
            case 11:
               iStarLifeValueEffect = 320;
               break;
            case 12:
               iStarLifeValueEffect = 350;
               break;
            case 13:
               iStarLifeValueEffect = 380;
               break;
            case 14:
               iStarLifeValueEffect = 410;
               break;
            case 15:
               iStarLifeValueEffect = 450;
               break;
            case 16:
               iStarLifeValueEffect = 490;
               break;
            case 17:
               iStarLifeValueEffect = 530;
               break;
            case 18:
               iStarLifeValueEffect = 570;
         }
         return iStarLifeValueEffect;
      }
   }
}

