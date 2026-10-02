package com.aurora.ui.maogoutd.resource.defender.HorseYear.HoneyTrap
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class HoneyTrapDefense
   {
      
      internal static const DEFENSE_PRICE:int = 300;
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const ADD_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 6;
      
      public function HoneyTrapDefense()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 150;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 5;
               break;
            case 1:
               iSkillDegreeEffect = 4.7;
               break;
            case 2:
               iSkillDegreeEffect = 4.4;
               break;
            case 3:
               iSkillDegreeEffect = 4.1;
               break;
            case 4:
               iSkillDegreeEffect = 3.6;
               break;
            case 5:
               iSkillDegreeEffect = 3.1;
               break;
            case 6:
               iSkillDegreeEffect = 2.6;
               break;
            case 7:
               iSkillDegreeEffect = 2.1;
               break;
            case 8:
               iSkillDegreeEffect = 1.5;
         }
         return iSkillDegreeEffect * 20;
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
               iStarDegreeEffect = 14;
               break;
            case 4:
               iStarDegreeEffect = 16;
               break;
            case 5:
               iStarDegreeEffect = 18;
               break;
            case 6:
               iStarDegreeEffect = 20;
               break;
            case 7:
               iStarDegreeEffect = 25;
               break;
            case 8:
               iStarDegreeEffect = 30;
               break;
            case 9:
               iStarDegreeEffect = 35;
               break;
            case 10:
               iStarDegreeEffect = 40;
               break;
            case 11:
               iStarDegreeEffect = 50;
               break;
            case 12:
               iStarDegreeEffect = 60;
               break;
            case 13:
               iStarDegreeEffect = 70;
               break;
            case 14:
               iStarDegreeEffect = 80;
               break;
            case 15:
               iStarDegreeEffect = 90;
               break;
            case 16:
               iStarDegreeEffect = 100;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function GetGlobalTarget(stFieldGrid:a_3491, refX:Number = NaN, refY:Number = NaN) : a_4206
      {
         var view:BattleFieldView;
         var candidates:Array;
         var useDist:Boolean = false;
         var intruder:a_4206 = null;
         if(!stFieldGrid || !stFieldGrid.m_stCurrentBattbleFieldView)
         {
            return null;
         }
         view = stFieldGrid.m_stCurrentBattbleFieldView;
         useDist = !isNaN(refX) && !isNaN(refY);
         candidates = [];
         for each(intruder in view.m_arrBaseMoveIntruderVector)
         {
            if(!(!intruder || intruder.iLifeValue <= 0 || !intruder.m_stCurrentFieldGrid || !intruder.parent || intruder.m_isRemovedFromBattaleField))
            {
               candidates.push(intruder);
            }
         }
         if(candidates.length == 0)
         {
            return null;
         }
         candidates.sort(function(a:a_4206, b:a_4206):int
         {
            if(a.IsBossIntruder && !b.IsBossIntruder)
            {
               return -1;
            }
            if(!a.IsBossIntruder && b.IsBossIntruder)
            {
               return 1;
            }
            var lifeCmp:int = b.iLifeValue - a.iLifeValue;
            if(lifeCmp != 0)
            {
               return lifeCmp;
            }
            if(!useDist)
            {
               return 0;
            }
            var ax:Number = a.x + (a.stDisplayBitmap ? a.stDisplayBitmap.x : 0) + (a.width >> 1);
            var ay:Number = a.y + (a.stDisplayBitmap ? a.stDisplayBitmap.y : 0) + (a.height >> 1);
            var bx:Number = b.x + (b.stDisplayBitmap ? b.stDisplayBitmap.x : 0) + (b.width >> 1);
            var by:Number = b.y + (b.stDisplayBitmap ? b.stDisplayBitmap.y : 0) + (b.height >> 1);
            var da2:Number = (refX - ax) * (refX - ax) + (refY - ay) * (refY - ay);
            var db2:Number = (refX - bx) * (refX - bx) + (refY - by) * (refY - by);
            if(da2 < db2)
            {
               return -1;
            }
            if(da2 > db2)
            {
               return 1;
            }
            return 0;
         });
         return candidates[0] as a_4206;
      }
   }
}

