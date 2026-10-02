package com.aurora.ui.maogoutd.resource.defender.HorseYear.redWillowSkewer
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class RedWillowSkewerDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 2;
      
      internal static const DEFENSE_PRICE:int = 230;
      
      internal static const FIRST_TRANS_ATTACK_RATE:Number = 1.35;
      
      public function RedWillowSkewerDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 1.5;
               break;
            case 1:
               iSkillDegreeEffect = 1.45;
               break;
            case 2:
               iSkillDegreeEffect = 1.4;
               break;
            case 3:
               iSkillDegreeEffect = 1.35;
               break;
            case 4:
               iSkillDegreeEffect = 1.3;
               break;
            case 5:
               iSkillDegreeEffect = 1.25;
               break;
            case 6:
               iSkillDegreeEffect = 1.2;
               break;
            case 7:
               iSkillDegreeEffect = 1.15;
               break;
            case 8:
               iSkillDegreeEffect = 1;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 6;
               break;
            case 1:
               iStarDegreeEffect = 7;
               break;
            case 2:
               iStarDegreeEffect = 8;
               break;
            case 3:
               iStarDegreeEffect = 10;
               break;
            case 4:
               iStarDegreeEffect = 12;
               break;
            case 5:
               iStarDegreeEffect = 14;
               break;
            case 6:
               iStarDegreeEffect = 17;
               break;
            case 7:
               iStarDegreeEffect = 20;
               break;
            case 8:
               iStarDegreeEffect = 23;
               break;
            case 9:
               iStarDegreeEffect = 28;
               break;
            case 10:
               iStarDegreeEffect = 33;
               break;
            case 11:
               iStarDegreeEffect = 38;
               break;
            case 12:
               iStarDegreeEffect = 48;
               break;
            case 13:
               iStarDegreeEffect = 60;
               break;
            case 14:
               iStarDegreeEffect = 75;
               break;
            case 15:
               iStarDegreeEffect = 90;
               break;
            case 16:
               iStarDegreeEffect = 113;
         }
         return iStarDegreeEffect * 10;
      }
      
      public static function a_3431(gride:a_3491, orgX:Number, orgY:Number) : a_4206
      {
         var nearest:a_4206 = null;
         var intruder:a_4206 = null;
         var dx:Number = NaN;
         var dy:Number = NaN;
         var distSq:Number = NaN;
         if(!gride)
         {
            return null;
         }
         var minDistSq:Number = -1;
         var intruders:Array = gride.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
         for each(intruder in intruders)
         {
            if(!(intruder.iSpaceState == 1 || intruder.iLifeValue <= 0 || !intruder.m_stCurrentFieldGrid))
            {
               if(!(BattleFieldView.m_GostMouse.indexOf(intruder.m_stMoveIntruderTypeID) == -1 && intruder.isCannotSeeByFighter))
               {
                  dx = intruder.x - orgX;
                  dy = intruder.y - orgY;
                  distSq = dx * dx + dy * dy;
                  if(minDistSq < 0 || distSq < minDistSq)
                  {
                     minDistSq = distSq;
                     nearest = intruder;
                  }
               }
            }
         }
         return nearest;
      }
   }
}

