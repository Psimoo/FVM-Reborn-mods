package com.aurora.ui.maogoutd.resource.defender.SnakeYear.WuGuSnake
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class WuGuSnakeDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 275;
      
      public function WuGuSnakeDefence()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 150;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 1.8;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 1.8;
               break;
            case 1:
               iSkillDegreeEffect = 1.75;
               break;
            case 2:
               iSkillDegreeEffect = 1.7;
               break;
            case 3:
               iSkillDegreeEffect = 1.65;
               break;
            case 4:
               iSkillDegreeEffect = 1.6;
               break;
            case 5:
               iSkillDegreeEffect = 1.55;
               break;
            case 6:
               iSkillDegreeEffect = 1.2;
               break;
            case 7:
               iSkillDegreeEffect = 1.45;
               break;
            case 8:
               iSkillDegreeEffect = 1.4;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 3.5;
               break;
            case 1:
               iStarDegreeEffect = 4;
               break;
            case 2:
               iStarDegreeEffect = 4.5;
               break;
            case 3:
               iStarDegreeEffect = 5;
               break;
            case 4:
               iStarDegreeEffect = 5.5;
               break;
            case 5:
               iStarDegreeEffect = 6;
               break;
            case 6:
               iStarDegreeEffect = 7;
               break;
            case 7:
               iStarDegreeEffect = 8;
               break;
            case 8:
               iStarDegreeEffect = 10;
               break;
            case 9:
               iStarDegreeEffect = 13;
               break;
            case 10:
               iStarDegreeEffect = 17;
               break;
            case 11:
               iStarDegreeEffect = 21;
               break;
            case 12:
               iStarDegreeEffect = 25;
               break;
            case 13:
               iStarDegreeEffect = 31;
               break;
            case 14:
               iStarDegreeEffect = 37;
               break;
            case 15:
               iStarDegreeEffect = 43;
               break;
            case 16:
               iStarDegreeEffect = 49;
         }
         return 10 * iStarDegreeEffect;
      }
      
      internal static function GetFieldIntruderNumForAheadDirection(stFieldGrid:a_3491, range:int = 1) : Boolean
      {
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var stFieldGridVector:Array = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(stFieldGrid)
         {
            xStart = Math.max(stFieldGrid.m_iXGridNo - range,0);
            xEnd = Math.min(stFieldGrid.m_iXGridNo + range,BattleFieldView.a_1011 - 1);
            yStart = Math.max(stFieldGrid.m_iYGridNo - range,0);
            yEnd = Math.min(stFieldGrid.m_iYGridNo + range,BattleFieldView.a_1012 - 1);
            stFieldGridVector = stFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
            loop0:
            for(yIndex = yStart; yIndex <= yEnd; )
            {
               xIndex = xStart;
               loop1:
               while(true)
               {
                  if(xIndex > xEnd)
                  {
                     yIndex++;
                     continue loop0;
                  }
                  arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     if(stMoveIntruder.iSpaceState != 0 || !stMoveIntruder.isCannotSeeByFighter)
                     {
                        break loop1;
                     }
                  }
                  xIndex++;
               }
               return true;
            }
         }
         return false;
      }
   }
}

