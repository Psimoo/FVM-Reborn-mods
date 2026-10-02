package com.aurora.ui.maogoutd.resource.defender.dogTaurus
{
   public class DogTaurusFireAuxiliaryDefine
   {
      
      internal static const DEFENSE_PRICE:int = 175;
      
      internal static const REDUCE_DEFENSE_PRICE:int = 50;
      
      internal static const HURT_ADDITION:Number = 0.15;
      
      public function DogTaurusFireAuxiliaryDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 70;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 22;
               break;
            case 1:
               iStarDegreeEffect = 23;
               break;
            case 2:
               iStarDegreeEffect = 23;
               break;
            case 3:
               iStarDegreeEffect = 23;
               break;
            case 4:
               iStarDegreeEffect = 24;
               break;
            case 5:
               iStarDegreeEffect = 24;
               break;
            case 6:
               iStarDegreeEffect = 25;
               break;
            case 7:
               iStarDegreeEffect = 25;
               break;
            case 8:
               iStarDegreeEffect = 26;
               break;
            case 9:
               iStarDegreeEffect = 27;
               break;
            case 10:
               iStarDegreeEffect = 29;
               break;
            case 11:
               iStarDegreeEffect = 31;
               break;
            case 12:
               iStarDegreeEffect = 33;
               break;
            case 13:
               iStarDegreeEffect = 35;
               break;
            case 14:
               iStarDegreeEffect = 37;
               break;
            case 15:
               iStarDegreeEffect = 39;
               break;
            case 16:
               iStarDegreeEffect = 42;
         }
         return iStarDegreeEffect;
      }
      
      internal static function GetCardLifeValueStarDegreeEffect(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 300;
               break;
            case 1:
               iStarDegreeEffect = 350;
               break;
            case 2:
               iStarDegreeEffect = 400;
               break;
            case 3:
               iStarDegreeEffect = 450;
               break;
            case 4:
               iStarDegreeEffect = 500;
               break;
            case 5:
               iStarDegreeEffect = 550;
               break;
            case 6:
               iStarDegreeEffect = 600;
               break;
            case 7:
               iStarDegreeEffect = 650;
               break;
            case 8:
               iStarDegreeEffect = 700;
               break;
            case 9:
               iStarDegreeEffect = 750;
               break;
            case 10:
               iStarDegreeEffect = 800;
               break;
            case 11:
               iStarDegreeEffect = 850;
               break;
            case 12:
               iStarDegreeEffect = 900;
               break;
            case 13:
               iStarDegreeEffect = 1000;
               break;
            case 14:
               iStarDegreeEffect = 1100;
               break;
            case 15:
               iStarDegreeEffect = 1200;
               break;
            case 16:
               iStarDegreeEffect = 1450;
         }
         return iStarDegreeEffect;
      }
   }
}

