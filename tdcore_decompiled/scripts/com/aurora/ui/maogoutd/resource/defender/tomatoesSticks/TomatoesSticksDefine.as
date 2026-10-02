package com.aurora.ui.maogoutd.resource.defender.tomatoesSticks
{
   import a_4718.b_183;
   
   public class TomatoesSticksDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 19;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 6;
      
      internal static const DEFENSE_PRICE:int = 175;
      
      internal static const FIRSTTRANS_ADDITION:Number = 0.2;
      
      public function TomatoesSticksDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function GetShotTypeID() : int
      {
         return b_183.enm_TomatoesSticks;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         return 60 - iSkillDegree * 4;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 10;
               break;
            case 1:
               iStarDegreeEffect = 11;
               break;
            case 2:
               iStarDegreeEffect = 12;
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
               iStarDegreeEffect = 31;
               break;
            case 10:
               iStarDegreeEffect = 36;
               break;
            case 11:
               iStarDegreeEffect = 41;
               break;
            case 12:
               iStarDegreeEffect = 46;
               break;
            case 13:
               iStarDegreeEffect = 51;
               break;
            case 14:
               iStarDegreeEffect = 56;
               break;
            case 15:
               iStarDegreeEffect = 61;
               break;
            case 16:
               iStarDegreeEffect = 66;
         }
         return iStarDegreeEffect * 10;
      }
   }
}

