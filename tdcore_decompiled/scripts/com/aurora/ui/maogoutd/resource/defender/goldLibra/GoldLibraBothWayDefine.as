package com.aurora.ui.maogoutd.resource.defender.goldLibra
{
   import a_4718.b_183;
   
   public class GoldLibraBothWayDefine
   {
      
      internal static const DEFENSE_PRICE:int = 150;
      
      public function GoldLibraBothWayDefine()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_LibraBothWayShot;
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
               iStarDegreeEffect = 14;
               break;
            case 1:
               iStarDegreeEffect = 16;
               break;
            case 2:
               iStarDegreeEffect = 18;
               break;
            case 3:
               iStarDegreeEffect = 20;
               break;
            case 4:
               iStarDegreeEffect = 22;
               break;
            case 5:
               iStarDegreeEffect = 24;
               break;
            case 6:
               iStarDegreeEffect = 28;
               break;
            case 7:
               iStarDegreeEffect = 34;
               break;
            case 8:
               iStarDegreeEffect = 42;
               break;
            case 9:
               iStarDegreeEffect = 58;
               break;
            case 10:
               iStarDegreeEffect = 74;
               break;
            case 11:
               iStarDegreeEffect = 89;
               break;
            case 12:
               iStarDegreeEffect = 108;
               break;
            case 13:
               iStarDegreeEffect = 128;
               break;
            case 14:
               iStarDegreeEffect = 148;
               break;
            case 15:
               iStarDegreeEffect = 168;
               break;
            case 16:
               iStarDegreeEffect = 188;
               break;
            case 17:
               iStarDegreeEffect = 258;
               break;
            case 18:
               iStarDegreeEffect = 387;
         }
         return iStarDegreeEffect;
      }
      
      internal static function GetCardStarDegreeFinalEffectValue(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 14;
               break;
            case 1:
               iStarDegreeEffect = 16;
               break;
            case 2:
               iStarDegreeEffect = 18;
               break;
            case 3:
               iStarDegreeEffect = 20;
               break;
            case 4:
               iStarDegreeEffect = 22;
               break;
            case 5:
               iStarDegreeEffect = 24;
               break;
            case 6:
               iStarDegreeEffect = 28;
               break;
            case 7:
               iStarDegreeEffect = 34;
               break;
            case 8:
               iStarDegreeEffect = 42;
               break;
            case 9:
               iStarDegreeEffect = 58;
               break;
            case 10:
               iStarDegreeEffect = 74;
               break;
            case 11:
               iStarDegreeEffect = 89;
               break;
            case 12:
               iStarDegreeEffect = 108;
               break;
            case 13:
               iStarDegreeEffect = 128;
               break;
            case 14:
               iStarDegreeEffect = 148;
               break;
            case 15:
               iStarDegreeEffect = 168;
               break;
            case 16:
               iStarDegreeEffect = 188;
               break;
            case 17:
               iStarDegreeEffect = 258;
               break;
            case 18:
               iStarDegreeEffect = 387;
         }
         return iStarDegreeEffect;
      }
   }
}

