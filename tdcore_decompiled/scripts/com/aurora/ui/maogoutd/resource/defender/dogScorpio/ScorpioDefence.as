package com.aurora.ui.maogoutd.resource.defender.dogScorpio
{
   import a_4718.b_183;
   
   public class ScorpioDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 225;
      
      public function ScorpioDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 80;
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
         var iSkillDegreeSpeedValue:Number = 1.6;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeSpeedValue = 1.6;
               break;
            case 1:
               iSkillDegreeSpeedValue = 1.55;
               break;
            case 2:
               iSkillDegreeSpeedValue = 1.5;
               break;
            case 3:
               iSkillDegreeSpeedValue = 1.45;
               break;
            case 4:
               iSkillDegreeSpeedValue = 1.4;
               break;
            case 5:
               iSkillDegreeSpeedValue = 1.35;
               break;
            case 6:
               iSkillDegreeSpeedValue = 1.25;
               break;
            case 7:
               iSkillDegreeSpeedValue = 1.15;
               break;
            case 8:
               iSkillDegreeSpeedValue = 1;
         }
         return iSkillDegreeSpeedValue * 20;
      }
      
      internal static function GetHurtValueByCardStarDegree(iStarDegree:int) : int
      {
         var iStarDegreeHurtValue:int = 1;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeHurtValue = 1;
               break;
            case 1:
               iStarDegreeHurtValue = 1.2;
               break;
            case 2:
               iStarDegreeHurtValue = 1.3;
               break;
            case 3:
               iStarDegreeHurtValue = 1.5;
               break;
            case 4:
               iStarDegreeHurtValue = 1.7;
               break;
            case 5:
               iStarDegreeHurtValue = 1.9;
               break;
            case 6:
               iStarDegreeHurtValue = 2.2;
               break;
            case 7:
               iStarDegreeHurtValue = 2.5;
               break;
            case 8:
               iStarDegreeHurtValue = 3;
               break;
            case 9:
               iStarDegreeHurtValue = 4.5;
               break;
            case 10:
               iStarDegreeHurtValue = 6;
               break;
            case 11:
               iStarDegreeHurtValue = 7.5;
               break;
            case 12:
               iStarDegreeHurtValue = 9;
               break;
            case 13:
               iStarDegreeHurtValue = 10.5;
               break;
            case 14:
               iStarDegreeHurtValue = 12;
               break;
            case 15:
               iStarDegreeHurtValue = 13.5;
               break;
            case 16:
               iStarDegreeHurtValue = 15;
         }
         return 10 * iStarDegreeHurtValue;
      }
   }
}

