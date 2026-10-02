package com.aurora.ui.maogoutd.resource.defender.SnakeYear.elementSnake
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class ElementSnakeDefine
   {
      
      internal static const DEFENSE_PRICE:int = 290;
      
      public function ElementSnakeDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 2.5;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 2.5;
               break;
            case 1:
               iSkillDegreeEffect = 2.4;
               break;
            case 2:
               iSkillDegreeEffect = 2.3;
               break;
            case 3:
               iSkillDegreeEffect = 2.2;
               break;
            case 4:
               iSkillDegreeEffect = 2.1;
               break;
            case 5:
               iSkillDegreeEffect = 2;
               break;
            case 6:
               iSkillDegreeEffect = 1.9;
               break;
            case 7:
               iSkillDegreeEffect = 1.8;
               break;
            case 8:
               iSkillDegreeEffect = 1.5;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 12;
               break;
            case 1:
               iStarDegreeEffect = 15;
               break;
            case 2:
               iStarDegreeEffect = 18;
               break;
            case 3:
               iStarDegreeEffect = 21;
               break;
            case 4:
               iStarDegreeEffect = 24;
               break;
            case 5:
               iStarDegreeEffect = 27;
               break;
            case 6:
               iStarDegreeEffect = 30;
               break;
            case 7:
               iStarDegreeEffect = 33;
               break;
            case 8:
               iStarDegreeEffect = 36;
               break;
            case 9:
               iStarDegreeEffect = 46;
               break;
            case 10:
               iStarDegreeEffect = 66;
               break;
            case 11:
               iStarDegreeEffect = 86;
               break;
            case 12:
               iStarDegreeEffect = 116;
               break;
            case 13:
               iStarDegreeEffect = 146;
               break;
            case 14:
               iStarDegreeEffect = 176;
               break;
            case 15:
               iStarDegreeEffect = 220;
               break;
            case 16:
               iStarDegreeEffect = 270;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function GetFieldIntruderNumForAheadDirection(stFieldGrid:a_3491, iYRange:int = 0) : int
      {
         var yStart:int = 0;
         var yEnd:int = 0;
         var i:int = 0;
         var yIndex:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var stMoveIntruder:a_4206 = null;
         var iTotalIntruderNum:int = 0;
         if(stFieldGrid)
         {
            yStart = Math.max(stFieldGrid.m_iYGridNo - iYRange,0);
            yEnd = Math.min(stFieldGrid.m_iYGridNo + iYRange,BattleFieldView.a_1012 - 1);
            loop0:
            for(i = 0; i < BattleFieldView.a_1011; )
            {
               yIndex = yStart;
               loop1:
               while(true)
               {
                  if(yIndex > yEnd)
                  {
                     i++;
                     continue loop0;
                  }
                  stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,yIndex);
                  if(stTargetFieldGrid != null)
                  {
                     for each(stMoveIntruder in stTargetFieldGrid.a_1511)
                     {
                        if(stMoveIntruder != null && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState))
                        {
                           break loop1;
                        }
                     }
                  }
                  yIndex++;
               }
               return 1;
            }
         }
         return iTotalIntruderNum;
      }
   }
}

