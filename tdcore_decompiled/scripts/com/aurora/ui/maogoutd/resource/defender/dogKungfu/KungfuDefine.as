package com.aurora.ui.maogoutd.resource.defender.dogKungfu
{
   import a_4718.b_183;
   
   public class KungfuDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 145;
      
      public function KungfuDefine()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 90;
      }
      
      internal static function GetGrownTimeByCardSkillDegree(iSkillDegree:int) : int
      {
         var iStarDegreeHurtValue:uint = 8;
         switch(iSkillDegree)
         {
            case 0:
               iStarDegreeHurtValue = 8;
               break;
            case 1:
               iStarDegreeHurtValue = 8;
               break;
            case 2:
               iStarDegreeHurtValue = 8;
               break;
            case 3:
               iStarDegreeHurtValue = 8;
               break;
            case 4:
               iStarDegreeHurtValue = 8;
               break;
            case 5:
               iStarDegreeHurtValue = 8;
               break;
            case 6:
               iStarDegreeHurtValue = 8;
               break;
            case 7:
               iStarDegreeHurtValue = 8;
               break;
            case 8:
               iStarDegreeHurtValue = 8;
               break;
            case 9:
               iStarDegreeHurtValue = 8;
               break;
            case 10:
               iStarDegreeHurtValue = 8;
               break;
            case 11:
               iStarDegreeHurtValue = 8;
               break;
            case 12:
               iStarDegreeHurtValue = 8;
               break;
            case 13:
               iStarDegreeHurtValue = 8;
               break;
            case 14:
               iStarDegreeHurtValue = 8;
               break;
            case 15:
               iStarDegreeHurtValue = 8;
         }
         return iStarDegreeHurtValue;
      }
      
      internal static function a_3966(iSkillDegree:int) : Number
      {
         var iSkillDegreeSpeedValue:Number = 1.2;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeSpeedValue = 1.2;
               break;
            case 1:
               iSkillDegreeSpeedValue = 1.15;
               break;
            case 2:
               iSkillDegreeSpeedValue = 1.1;
               break;
            case 3:
               iSkillDegreeSpeedValue = 1.05;
               break;
            case 4:
               iSkillDegreeSpeedValue = 1;
               break;
            case 5:
               iSkillDegreeSpeedValue = 0.95;
               break;
            case 6:
               iSkillDegreeSpeedValue = 0.9;
               break;
            case 7:
               iSkillDegreeSpeedValue = 0.85;
               break;
            case 8:
               iSkillDegreeSpeedValue = 0.7;
         }
         return iSkillDegreeSpeedValue * 20;
      }
      
      internal static function GetHurtValueByCardStarDegree(iStarDegree:int) : Number
      {
         var iStarDegreeHurtValue:Number = 2.2;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeHurtValue = 2.2;
               break;
            case 1:
               iStarDegreeHurtValue = 2.6;
               break;
            case 2:
               iStarDegreeHurtValue = 3;
               break;
            case 3:
               iStarDegreeHurtValue = 3.4;
               break;
            case 4:
               iStarDegreeHurtValue = 3.8;
               break;
            case 5:
               iStarDegreeHurtValue = 4.2;
               break;
            case 6:
               iStarDegreeHurtValue = 4.6;
               break;
            case 7:
               iStarDegreeHurtValue = 5.4;
               break;
            case 8:
               iStarDegreeHurtValue = 6.6;
               break;
            case 9:
               iStarDegreeHurtValue = 8.2;
               break;
            case 10:
               iStarDegreeHurtValue = 11.5;
               break;
            case 11:
               iStarDegreeHurtValue = 14.5;
               break;
            case 12:
               iStarDegreeHurtValue = 18;
               break;
            case 13:
               iStarDegreeHurtValue = 22;
               break;
            case 14:
               iStarDegreeHurtValue = 25;
               break;
            case 15:
               iStarDegreeHurtValue = 28;
               break;
            case 16:
               iStarDegreeHurtValue = 29;
         }
         return 10 * iStarDegreeHurtValue;
      }
   }
}

