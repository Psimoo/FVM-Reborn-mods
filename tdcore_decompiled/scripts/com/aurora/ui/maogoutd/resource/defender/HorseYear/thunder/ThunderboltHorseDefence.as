package com.aurora.ui.maogoutd.resource.defender.HorseYear.thunder
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class ThunderboltHorseDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 200;
      
      public function ThunderboltHorseDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 3.2;
               break;
            case 1:
               iSkillDegreeEffect = 3.1;
               break;
            case 2:
               iSkillDegreeEffect = 3;
               break;
            case 3:
               iSkillDegreeEffect = 2.9;
               break;
            case 4:
               iSkillDegreeEffect = 2.8;
               break;
            case 5:
               iSkillDegreeEffect = 2.6;
               break;
            case 6:
               iSkillDegreeEffect = 2.4;
               break;
            case 7:
               iSkillDegreeEffect = 2.1;
               break;
            case 8:
               iSkillDegreeEffect = 1.6;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
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
               iStarDegreeEffect = 11;
               break;
            case 4:
               iStarDegreeEffect = 14;
               break;
            case 5:
               iStarDegreeEffect = 17;
               break;
            case 6:
               iStarDegreeEffect = 20;
               break;
            case 7:
               iStarDegreeEffect = 24;
               break;
            case 8:
               iStarDegreeEffect = 28;
               break;
            case 9:
               iStarDegreeEffect = 33;
               break;
            case 10:
               iStarDegreeEffect = 38;
               break;
            case 11:
               iStarDegreeEffect = 44;
               break;
            case 12:
               iStarDegreeEffect = 51;
               break;
            case 13:
               iStarDegreeEffect = 59;
               break;
            case 14:
               iStarDegreeEffect = 68;
               break;
            case 15:
               iStarDegreeEffect = 78;
               break;
            case 16:
               iStarDegreeEffect = 90;
         }
         return iStarDegreeEffect;
      }
      
      public static function GetTheFarthestIntruder(gride:a_3491, orgX:Number) : a_4206
      {
         var farthest:a_4206 = null;
         var intruder:a_4206 = null;
         if(!gride)
         {
            return null;
         }
         var intruders:Array = gride.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
         for each(intruder in intruders)
         {
            if(!(intruder.isCannotSeeByFighter || intruder.iLifeValue <= 0))
            {
               if(!(intruder.iSpaceState != 0 && intruder.iSpaceState != 3))
               {
                  if(!farthest)
                  {
                     farthest = intruder;
                  }
                  else if(Math.abs(intruder.x - orgX) > Math.abs(farthest.x - orgX))
                  {
                     farthest = intruder;
                  }
               }
            }
         }
         return farthest;
      }
   }
}

