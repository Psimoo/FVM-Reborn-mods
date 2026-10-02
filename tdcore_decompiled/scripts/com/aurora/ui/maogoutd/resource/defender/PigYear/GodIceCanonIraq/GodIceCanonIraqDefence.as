package com.aurora.ui.maogoutd.resource.defender.PigYear.GodIceCanonIraq
{
   import a_4718.b_183;
   
   public class GodIceCanonIraqDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 325;
      
      internal static const REDUEC_DEFENSE_PRICE:int = 100;
      
      public function GodIceCanonIraqDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 15 * 10;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 6;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 6;
               break;
            case 1:
               iSkillDegreeEffect = 5.8;
               break;
            case 2:
               iSkillDegreeEffect = 5.6;
               break;
            case 3:
               iSkillDegreeEffect = 5.4;
               break;
            case 4:
               iSkillDegreeEffect = 5.2;
               break;
            case 5:
               iSkillDegreeEffect = 5;
               break;
            case 6:
               iSkillDegreeEffect = 4.8;
               break;
            case 7:
               iSkillDegreeEffect = 4.6;
               break;
            case 8:
               iSkillDegreeEffect = 4.3;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 8.5;
               break;
            case 1:
               iStarDegreeEffect = 10;
               break;
            case 2:
               iStarDegreeEffect = 11.5;
               break;
            case 3:
               iStarDegreeEffect = 13;
               break;
            case 4:
               iStarDegreeEffect = 15;
               break;
            case 5:
               iStarDegreeEffect = 17;
               break;
            case 6:
               iStarDegreeEffect = 19;
               break;
            case 7:
               iStarDegreeEffect = 23;
               break;
            case 8:
               iStarDegreeEffect = 27;
               break;
            case 9:
               iStarDegreeEffect = 32;
               break;
            case 10:
               iStarDegreeEffect = 37;
               break;
            case 11:
               iStarDegreeEffect = 43;
               break;
            case 12:
               iStarDegreeEffect = 53;
               break;
            case 13:
               iStarDegreeEffect = 63;
               break;
            case 14:
               iStarDegreeEffect = 83;
               break;
            case 15:
               iStarDegreeEffect = 103;
               break;
            case 16:
               iStarDegreeEffect = 133;
               break;
            case 17:
               iStarDegreeEffect = 163;
               break;
            case 18:
               iStarDegreeEffect = 195;
         }
         return iStarDegreeEffect * 10;
      }
   }
}

