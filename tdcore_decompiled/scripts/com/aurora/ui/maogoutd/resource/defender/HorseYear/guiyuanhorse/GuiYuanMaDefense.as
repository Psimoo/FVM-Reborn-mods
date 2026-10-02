package com.aurora.ui.maogoutd.resource.defender.HorseYear.guiyuanhorse
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class GuiYuanMaDefense
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 6;
      
      internal static const DEFENSE_PRICE:int = 375;
      
      internal static const REDUCE_DEFENSE_PRICE:int = 50;
      
      internal static const ROW_RANGE_BASE:int = 1;
      
      internal static const ROW_RANGE_SECOND:int = 2;
      
      internal static const DAZE_HP_RATIO_BASE:int = 70;
      
      internal static const DAZE_HP_RATIO_FIRST:int = 50;
      
      public function GuiYuanMaDefense()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 150;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 2.6;
               break;
            case 1:
               iSkillDegreeEffect = 2.55;
               break;
            case 2:
               iSkillDegreeEffect = 2.5;
               break;
            case 3:
               iSkillDegreeEffect = 2.45;
               break;
            case 4:
               iSkillDegreeEffect = 2.4;
               break;
            case 5:
               iSkillDegreeEffect = 2.35;
               break;
            case 6:
               iSkillDegreeEffect = 2.3;
               break;
            case 7:
               iSkillDegreeEffect = 2.2;
               break;
            case 8:
               iSkillDegreeEffect = 2;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 12;
               break;
            case 1:
               iStarDegreeEffect = 14;
               break;
            case 2:
               iStarDegreeEffect = 16;
               break;
            case 3:
               iStarDegreeEffect = 18;
               break;
            case 4:
               iStarDegreeEffect = 21;
               break;
            case 5:
               iStarDegreeEffect = 24;
               break;
            case 6:
               iStarDegreeEffect = 27;
               break;
            case 7:
               iStarDegreeEffect = 36;
               break;
            case 8:
               iStarDegreeEffect = 45;
               break;
            case 9:
               iStarDegreeEffect = 54;
               break;
            case 10:
               iStarDegreeEffect = 63;
               break;
            case 11:
               iStarDegreeEffect = 73;
               break;
            case 12:
               iStarDegreeEffect = 85;
               break;
            case 13:
               iStarDegreeEffect = 100;
               break;
            case 14:
               iStarDegreeEffect = 115;
               break;
            case 15:
               iStarDegreeEffect = 135;
               break;
            case 16:
               iStarDegreeEffect = 160;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function HasTargetInView(stFieldGrid:a_3491, rowRange:int) : Boolean
      {
         var yi:int = 0;
         var grid:a_3491 = null;
         var intruder:a_4206 = null;
         if(!stFieldGrid || !stFieldGrid.m_stCurrentBattbleFieldView)
         {
            return false;
         }
         var xStart:int = 0;
         var xEnd:int = BattleFieldView.a_1011 - 1;
         var yStart:int = Math.max(stFieldGrid.m_iYGridNo - rowRange,0);
         var yEnd:int = Math.min(stFieldGrid.m_iYGridNo + rowRange,BattleFieldView.a_1012 - 1);
         loop0:
         for(var xi:int = xStart; xi <= xEnd; )
         {
            yi = yStart;
            loop1:
            while(true)
            {
               if(yi > yEnd)
               {
                  xi++;
                  continue loop0;
               }
               grid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(xi,yi);
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
               yi++;
            }
            return true;
         }
         return false;
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
         var nearest:a_4206 = null;
         var nearestSkillTarget:a_4206 = null;
         var minDist:Number = Number.MAX_VALUE;
         var minDistSkill:Number = Number.MAX_VALUE;
         var yStart:int = Math.max(defY - rowRange,0);
         var yEnd:int = Math.min(defY + rowRange,BattleFieldView.a_1012 - 1);
         var xStart:int = defX;
         var xEnd:int = BattleFieldView.a_1011 - 1;
         for(var xi:int = xStart; xi <= xEnd; xi++)
         {
            for(yi = yStart; yi <= yEnd; yi++)
            {
               grid = view.a_3438(xi,yi);
               if(grid)
               {
                  for each(intruder in grid.a_1511)
                  {
                     if(canTargetIntruder(intruder))
                     {
                        ix = intruder.x + (intruder.stDisplayBitmap ? intruder.stDisplayBitmap.x : 0) + (intruder.width >> 1);
                        iy = intruder.y + (intruder.stDisplayBitmap ? intruder.stDisplayBitmap.y : 0) + (intruder.height >> 1);
                        dist = (ix - defCenterX) * (ix - defCenterX) + (iy - defCenterY) * (iy - defCenterY);
                        if(dist < minDist)
                        {
                           minDist = dist;
                           nearest = intruder;
                        }
                        if(!intruder.IsBossIntruder && !(intruder is GuiYuanMaSmallMouse) && dist < minDistSkill)
                        {
                           minDistSkill = dist;
                           nearestSkillTarget = intruder;
                        }
                     }
                  }
               }
            }
         }
         return nearest;
      }
      
      private static function canTargetIntruder(intruder:a_4206) : Boolean
      {
         if(!intruder || intruder.iLifeValue <= 0 || !intruder.m_stCurrentFieldGrid || !intruder.parent)
         {
            return false;
         }
         if(intruder.iSpaceState == 1)
         {
            return false;
         }
         if(!intruder.visible)
         {
            return false;
         }
         return true;
      }
      
      internal static function GetStartGrid(view:BattleFieldView, yGridNo:int) : a_3491
      {
         if(!view)
         {
            return null;
         }
         var startX:int = BattleFieldView.a_1011 - 1;
         return view.a_3438(startX,yGridNo);
      }
   }
}

