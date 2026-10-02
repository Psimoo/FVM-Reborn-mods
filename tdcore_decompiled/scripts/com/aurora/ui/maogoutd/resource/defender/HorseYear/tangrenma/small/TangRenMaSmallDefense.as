package com.aurora.ui.maogoutd.resource.defender.HorseYear.tangrenma.small
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class TangRenMaSmallDefense
   {
      
      internal static const DEFENSE_PRICE:int = 0;
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 6;
      
      internal static const DURATION_FRAMES:int = 25 * 20;
      
      internal static const ROW_RANGE_SMALL:int = 1;
      
      internal static const SPLASH_RATIO_FIRST:int = 50;
      
      public function TangRenMaSmallDefense()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 0;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 2.5;
               break;
            case 1:
               iSkillDegreeEffect = 2.45;
               break;
            case 2:
               iSkillDegreeEffect = 2.4;
               break;
            case 3:
               iSkillDegreeEffect = 2.35;
               break;
            case 4:
               iSkillDegreeEffect = 2.3;
               break;
            case 5:
               iSkillDegreeEffect = 2.2;
               break;
            case 6:
               iSkillDegreeEffect = 2.1;
               break;
            case 7:
               iSkillDegreeEffect = 2;
               break;
            case 8:
               iSkillDegreeEffect = 1.75;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var starDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               starDegreeEffect = 12;
               break;
            case 1:
               starDegreeEffect = 15;
               break;
            case 2:
               starDegreeEffect = 18;
               break;
            case 3:
               starDegreeEffect = 21;
               break;
            case 4:
               starDegreeEffect = 24;
               break;
            case 5:
               starDegreeEffect = 27;
               break;
            case 6:
               starDegreeEffect = 31;
               break;
            case 7:
               starDegreeEffect = 35;
               break;
            case 8:
               starDegreeEffect = 45;
               break;
            case 9:
               starDegreeEffect = 55;
               break;
            case 10:
               starDegreeEffect = 65;
               break;
            case 11:
               starDegreeEffect = 75;
               break;
            case 12:
               starDegreeEffect = 85;
               break;
            case 13:
               starDegreeEffect = 95;
               break;
            case 14:
               starDegreeEffect = 115;
               break;
            case 15:
               starDegreeEffect = 135;
               break;
            default:
               starDegreeEffect = 155;
         }
         return int(starDegreeEffect * 10);
      }
      
      internal static function GetNearestIntruderInFrontRows(stFieldGrid:a_3491, rowRange:int) : a_4206
      {
         var yi:int = 0;
         var grid:a_3491 = null;
         var intruder:a_4206 = null;
         var ix:Number = NaN;
         var iy:Number = NaN;
         var dist:Number = NaN;
         if(!stFieldGrid || !stFieldGrid.m_stCurrentBattbleFieldView)
         {
            return null;
         }
         var view:BattleFieldView = stFieldGrid.m_stCurrentBattbleFieldView;
         var defX:int = stFieldGrid.m_iXGridNo;
         var defY:int = stFieldGrid.m_iYGridNo;
         var defCenterX:Number = defX * a_3491.a_1080 + 0.5 * a_3491.a_1080;
         var defCenterY:Number = defY * a_3491.a_1081 + 0.5 * a_3491.a_1081;
         var isReversed:Boolean = view.iIntruderMoveDirection > 0;
         var xStart:int = isReversed ? 0 : defX;
         var xEnd:int = isReversed ? defX : int(BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(0,defY - rowRange);
         var yEnd:int = Math.min(BattleFieldView.a_1012 - 1,defY + rowRange);
         var nearest:a_4206 = null;
         var minDist:Number = Number.MAX_VALUE;
         for(var xi:int = xStart; xi <= xEnd; xi++)
         {
            for(yi = yStart; yi <= yEnd; yi++)
            {
               grid = view.a_3438(xi,yi);
               if(grid)
               {
                  for each(intruder in grid.a_1511)
                  {
                     if(canTargetIntruderWaterLand(intruder))
                     {
                        ix = intruder.x + (intruder.stDisplayBitmap ? intruder.stDisplayBitmap.x : 0) + (intruder.width >> 1);
                        iy = intruder.y + (intruder.stDisplayBitmap ? intruder.stDisplayBitmap.y : 0) + (intruder.height >> 1);
                        dist = (ix - defCenterX) * (ix - defCenterX) + (iy - defCenterY) * (iy - defCenterY);
                        if(dist < minDist)
                        {
                           minDist = dist;
                           nearest = intruder;
                        }
                     }
                  }
               }
            }
         }
         return nearest;
      }
      
      private static function canTargetIntruderWaterLand(intruder:a_4206) : Boolean
      {
         if(!intruder || intruder.iLifeValue <= 0 || !intruder.m_stCurrentFieldGrid || !intruder.parent || !intruder.visible)
         {
            return false;
         }
         if(intruder.iSpaceState == 1 || intruder.iSpaceState == 3)
         {
            return false;
         }
         return true;
      }
   }
}

