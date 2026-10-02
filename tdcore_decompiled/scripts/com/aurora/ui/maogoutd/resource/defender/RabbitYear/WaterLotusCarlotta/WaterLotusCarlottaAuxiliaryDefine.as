package com.aurora.ui.maogoutd.resource.defender.RabbitYear.WaterLotusCarlotta
{
   import a_4718.b_183;
   
   public class WaterLotusCarlottaAuxiliaryDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 150;
      
      public function WaterLotusCarlottaAuxiliaryDefine()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 7;
               break;
            case 1:
               iStarDegreeEffect = 8;
               break;
            case 2:
               iStarDegreeEffect = 9;
               break;
            case 3:
               iStarDegreeEffect = 10;
               break;
            case 4:
               iStarDegreeEffect = 11;
               break;
            case 5:
               iStarDegreeEffect = 12;
               break;
            case 6:
               iStarDegreeEffect = 13;
               break;
            case 7:
               iStarDegreeEffect = 15;
               break;
            case 8:
               iStarDegreeEffect = 17;
               break;
            case 9:
               iStarDegreeEffect = 19;
               break;
            case 10:
               iStarDegreeEffect = 22;
               break;
            case 11:
               iStarDegreeEffect = 25;
               break;
            case 12:
               iStarDegreeEffect = 29;
               break;
            case 13:
               iStarDegreeEffect = 33;
               break;
            case 14:
               iStarDegreeEffect = 37;
               break;
            case 15:
               iStarDegreeEffect = 41;
               break;
            case 16:
               iStarDegreeEffect = 45;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 10;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 10;
               break;
            case 1:
               iSkillDegreeEffect = 12;
               break;
            case 2:
               iSkillDegreeEffect = 14;
               break;
            case 3:
               iSkillDegreeEffect = 16;
               break;
            case 4:
               iSkillDegreeEffect = 18;
               break;
            case 5:
               iSkillDegreeEffect = 20;
               break;
            case 6:
               iSkillDegreeEffect = 22;
               break;
            case 7:
               iSkillDegreeEffect = 25;
               break;
            case 8:
               iSkillDegreeEffect = 30;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function GetBaseAttackAddend(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 2.1;
               break;
            case 1:
               iStarDegreeEffect = 2.3;
               break;
            case 2:
               iStarDegreeEffect = 2.6;
               break;
            case 3:
               iStarDegreeEffect = 3;
               break;
            case 4:
               iStarDegreeEffect = 3.4;
               break;
            case 5:
               iStarDegreeEffect = 3.8;
               break;
            case 6:
               iStarDegreeEffect = 4.4;
               break;
            case 7:
               iStarDegreeEffect = 5.5;
               break;
            case 8:
               iStarDegreeEffect = 6.8;
               break;
            case 9:
               iStarDegreeEffect = 9.3;
               break;
            case 10:
               iStarDegreeEffect = 11.8;
               break;
            case 11:
               iStarDegreeEffect = 14.6;
               break;
            case 12:
               iStarDegreeEffect = 17.4;
               break;
            case 13:
               iStarDegreeEffect = 20.2;
               break;
            case 14:
               iStarDegreeEffect = 23.7;
               break;
            case 15:
               iStarDegreeEffect = 27.3;
               break;
            case 16:
               iStarDegreeEffect = 30.7;
               break;
            case 17:
               iStarDegreeEffect = 35;
               break;
            case 18:
               iStarDegreeEffect = 45;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function GetSecondAttackAddend(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 3.8;
               break;
            case 1:
               iStarDegreeEffect = 4.2;
               break;
            case 2:
               iStarDegreeEffect = 4.7;
               break;
            case 3:
               iStarDegreeEffect = 5.4;
               break;
            case 4:
               iStarDegreeEffect = 6.1;
               break;
            case 5:
               iStarDegreeEffect = 6.8;
               break;
            case 6:
               iStarDegreeEffect = 7.9;
               break;
            case 7:
               iStarDegreeEffect = 10;
               break;
            case 8:
               iStarDegreeEffect = 12.1;
               break;
            case 9:
               iStarDegreeEffect = 16.7;
               break;
            case 10:
               iStarDegreeEffect = 21.3;
               break;
            case 11:
               iStarDegreeEffect = 26.3;
               break;
            case 12:
               iStarDegreeEffect = 31.3;
               break;
            case 13:
               iStarDegreeEffect = 36.4;
               break;
            case 14:
               iStarDegreeEffect = 42.7;
               break;
            case 15:
               iStarDegreeEffect = 49;
               break;
            case 16:
               iStarDegreeEffect = 55.3;
               break;
            case 17:
               iStarDegreeEffect = 65;
               break;
            case 18:
               iStarDegreeEffect = 80;
         }
         return iStarDegreeEffect * 10;
      }
   }
}

