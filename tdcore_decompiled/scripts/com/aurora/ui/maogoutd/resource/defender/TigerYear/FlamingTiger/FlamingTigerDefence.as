package com.aurora.ui.maogoutd.resource.defender.TigerYear.FlamingTiger
{
   import a_4718.b_183;
   
   public class FlamingTigerDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 85;
      
      public function FlamingTigerDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 55;
               break;
            case 1:
               iSkillDegreeEffect = 52;
               break;
            case 2:
               iSkillDegreeEffect = 49;
               break;
            case 3:
               iSkillDegreeEffect = 49;
               break;
            case 4:
               iSkillDegreeEffect = 43;
               break;
            case 5:
               iSkillDegreeEffect = 40;
               break;
            case 6:
               iSkillDegreeEffect = 37;
               break;
            case 7:
               iSkillDegreeEffect = 34;
               break;
            case 8:
               iSkillDegreeEffect = 30;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 12;
               break;
            case 1:
               iStarDegreeEffect = 13;
               break;
            case 2:
               iStarDegreeEffect = 14;
               break;
            case 3:
               iStarDegreeEffect = 15;
               break;
            case 4:
               iStarDegreeEffect = 16;
               break;
            case 5:
               iStarDegreeEffect = 17;
               break;
            case 6:
               iStarDegreeEffect = 18;
               break;
            case 7:
               iStarDegreeEffect = 19;
               break;
            case 8:
               iStarDegreeEffect = 20;
               break;
            case 9:
               iStarDegreeEffect = 25;
               break;
            case 10:
               iStarDegreeEffect = 30;
               break;
            case 11:
               iStarDegreeEffect = 35;
               break;
            case 12:
               iStarDegreeEffect = 45;
               break;
            case 13:
               iStarDegreeEffect = 55;
               break;
            case 14:
               iStarDegreeEffect = 65;
               break;
            case 15:
               iStarDegreeEffect = 75;
               break;
            case 16:
               iStarDegreeEffect = 85;
         }
         return iStarDegreeEffect / 100;
      }
      
      internal static function GetProduceEnergyTime(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 25;
               break;
            case 1:
               iStarDegreeEffect = 24;
               break;
            case 2:
               iStarDegreeEffect = 23;
               break;
            case 3:
               iStarDegreeEffect = 22;
               break;
            case 4:
               iStarDegreeEffect = 21;
               break;
            case 5:
               iStarDegreeEffect = 20;
               break;
            case 6:
               iStarDegreeEffect = 19;
               break;
            case 7:
               iStarDegreeEffect = 18;
               break;
            case 8:
               iStarDegreeEffect = 17;
               break;
            case 9:
               iStarDegreeEffect = 16;
               break;
            case 10:
               iStarDegreeEffect = 15;
               break;
            case 11:
               iStarDegreeEffect = 14;
               break;
            case 12:
               iStarDegreeEffect = 13;
               break;
            case 13:
               iStarDegreeEffect = 12;
               break;
            case 14:
               iStarDegreeEffect = 11;
               break;
            case 15:
               iStarDegreeEffect = 10;
               break;
            case 16:
               iStarDegreeEffect = 9;
         }
         return iStarDegreeEffect * 20;
      }
   }
}

