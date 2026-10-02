package com.aurora.ui.maogoutd.resource.defender.goldSagittarius
{
   import a_4718.b_183;
   
   public class GoldSagittariusDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 300;
      
      public function GoldSagittariusDefine()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_SagittariusShot;
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
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
               iStarDegreeEffect = 17;
               break;
            case 1:
               iStarDegreeEffect = 20;
               break;
            case 2:
               iStarDegreeEffect = 23;
               break;
            case 3:
               iStarDegreeEffect = 26;
               break;
            case 4:
               iStarDegreeEffect = 29;
               break;
            case 5:
               iStarDegreeEffect = 32;
               break;
            case 6:
               iStarDegreeEffect = 35;
               break;
            case 7:
               iStarDegreeEffect = 41;
               break;
            case 8:
               iStarDegreeEffect = 51;
               break;
            case 9:
               iStarDegreeEffect = 63;
               break;
            case 10:
               iStarDegreeEffect = 87;
               break;
            case 11:
               iStarDegreeEffect = 111;
               break;
            case 12:
               iStarDegreeEffect = 135;
               break;
            case 13:
               iStarDegreeEffect = 158;
               break;
            case 14:
               iStarDegreeEffect = 185;
               break;
            case 15:
               iStarDegreeEffect = 210;
               break;
            case 16:
               iStarDegreeEffect = 235;
               break;
            case 17:
               iStarDegreeEffect = 325;
               break;
            case 18:
               iStarDegreeEffect = 488;
         }
         return iStarDegreeEffect;
      }
   }
}

