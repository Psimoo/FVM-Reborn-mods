package com.aurora.ui.maogoutd.resource.defender.HorseYear.marbleSoda
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class MarbleSodaDefense
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 18;
      
      internal static const DEFENSE_PRICE:int = 220;
      
      internal static const BOUNCE_COUNT_BASE:int = 3;
      
      public function MarbleSodaDefense()
      {
         super();
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
               iSkillDegreeEffect = 2;
               break;
            case 1:
               iSkillDegreeEffect = 1.95;
               break;
            case 2:
               iSkillDegreeEffect = 1.9;
               break;
            case 3:
               iSkillDegreeEffect = 1.85;
               break;
            case 4:
               iSkillDegreeEffect = 1.8;
               break;
            case 5:
               iSkillDegreeEffect = 1.7;
               break;
            case 6:
               iSkillDegreeEffect = 1.6;
               break;
            case 7:
               iSkillDegreeEffect = 1.5;
               break;
            case 8:
               iSkillDegreeEffect = 1.3;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 1.5;
               break;
            case 1:
               iStarDegreeEffect = 2;
               break;
            case 2:
               iStarDegreeEffect = 2.5;
               break;
            case 3:
               iStarDegreeEffect = 3;
               break;
            case 4:
               iStarDegreeEffect = 3.5;
               break;
            case 5:
               iStarDegreeEffect = 4;
               break;
            case 6:
               iStarDegreeEffect = 4.5;
               break;
            case 7:
               iStarDegreeEffect = 5;
               break;
            case 8:
               iStarDegreeEffect = 5.5;
               break;
            case 9:
               iStarDegreeEffect = 6;
               break;
            case 10:
               iStarDegreeEffect = 8;
               break;
            case 11:
               iStarDegreeEffect = 12;
               break;
            case 12:
               iStarDegreeEffect = 16;
               break;
            case 13:
               iStarDegreeEffect = 20;
               break;
            case 14:
               iStarDegreeEffect = 24;
               break;
            case 15:
               iStarDegreeEffect = 28;
               break;
            case 16:
               iStarDegreeEffect = 32;
         }
         return 10 * iStarDegreeEffect;
      }
      
      internal static function canTargetIntruder(intruder:a_4206) : Boolean
      {
         if(!intruder || intruder.iLifeValue <= 0 || !intruder.m_stCurrentFieldGrid || !intruder.parent || !intruder.visible || intruder.isCannotSeeByFighter)
         {
            return false;
         }
         if(intruder.iSpaceState == 1 || intruder.iSpaceState == 3)
         {
            return false;
         }
         return true;
      }
      
      internal static function HasTargetInView(stFieldGrid:a_3491, range:int = 1) : Boolean
      {
         var xi:int = 0;
         var grid:a_3491 = null;
         var intruder:a_4206 = null;
         if(!stFieldGrid || !stFieldGrid.m_stCurrentBattbleFieldView)
         {
            return false;
         }
         var view:BattleFieldView = stFieldGrid.m_stCurrentBattbleFieldView;
         var defX:int = stFieldGrid.m_iXGridNo;
         var isReversed:Boolean = view.iIntruderMoveDirection > 0;
         var xStart:int = isReversed ? 0 : defX;
         var xEnd:int = isReversed ? defX : int(BattleFieldView.a_1011 - 1);
         var rowRange:int = Math.max(0,range);
         var yStart:int = Math.max(0,stFieldGrid.m_iYGridNo - rowRange);
         var yEnd:int = Math.min(BattleFieldView.a_1012 - 1,stFieldGrid.m_iYGridNo + rowRange);
         loop0:
         for(var yi:int = yStart; yi <= yEnd; )
         {
            xi = xStart;
            loop1:
            while(true)
            {
               if(xi > xEnd)
               {
                  yi++;
                  continue loop0;
               }
               grid = view.a_3438(xi,yi);
               if(grid)
               {
                  for each(intruder in grid.a_1511)
                  {
                     if(canTargetIntruder(intruder))
                     {
                        break loop1;
                     }
                  }
               }
               xi++;
            }
            return true;
         }
         return false;
      }
      
      internal static function BuildIntruderKey(intruder:a_4206) : String
      {
         if(!intruder)
         {
            return "";
         }
         return String(intruder.globalMoveFighterID);
      }
      
      internal static function PickBounceTarget(centerIntruder:a_4206, centerX:Number = NaN, centerY:Number = NaN, excluded:Object = null, range:int = 1) : a_4206
      {
         var cx:Number = NaN;
         var cy:Number = NaN;
         var dy:int = 0;
         var gx:int = 0;
         var gy:int = 0;
         var grid:a_3491 = null;
         var intruder:a_4206 = null;
         var key:String = null;
         var tx:Number = NaN;
         var ty:Number = NaN;
         var dd:Number = NaN;
         if(!centerIntruder || !centerIntruder.m_stCurrentFieldGrid)
         {
            return null;
         }
         var centerGrid:a_3491 = centerIntruder.m_stCurrentFieldGrid;
         if(!centerGrid || !centerGrid.m_stCurrentBattbleFieldView)
         {
            return null;
         }
         var view:BattleFieldView = centerGrid.m_stCurrentBattbleFieldView;
         if(isNaN(centerX) || isNaN(centerY))
         {
            cx = centerIntruder.x;
            cy = centerIntruder.y;
         }
         else
         {
            cx = centerX;
            cy = centerY;
         }
         var best:a_4206 = null;
         var bestDist:Number = Number.MAX_VALUE;
         var r:int = Math.max(0,range);
         for(var dx:int = -r; dx <= r; dx++)
         {
            for(dy = -r; dy <= r; dy++)
            {
               gx = centerGrid.m_iXGridNo + dx;
               gy = centerGrid.m_iYGridNo + dy;
               if(!(gx < 0 || gx >= BattleFieldView.a_1011 || gy < 0 || gy >= BattleFieldView.a_1012))
               {
                  grid = view.a_3438(gx,gy);
                  if(grid)
                  {
                     for each(intruder in grid.a_1511)
                     {
                        key = BuildIntruderKey(intruder);
                        if(!(intruder == centerIntruder || !canTargetIntruder(intruder) || Boolean(excluded) && Boolean(excluded[key])))
                        {
                           tx = intruder.x;
                           ty = intruder.y;
                           dd = (tx - cx) * (tx - cx) + (ty - cy) * (ty - cy);
                           if(dd < bestDist)
                           {
                              bestDist = dd;
                              best = intruder;
                           }
                        }
                     }
                  }
               }
            }
         }
         return best;
      }
   }
}

