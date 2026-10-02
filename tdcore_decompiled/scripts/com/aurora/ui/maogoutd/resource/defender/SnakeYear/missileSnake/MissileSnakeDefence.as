package com.aurora.ui.maogoutd.resource.defender.SnakeYear.missileSnake
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class MissileSnakeDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 400;
      
      internal static const m_MouseArr:Array = new Array(8388649,8392745,8389221,8388631,8388749,8388750,8392727);
      
      public function MissileSnakeDefence()
      {
         super();
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
               iSkillDegreeEffect = 35;
               break;
            case 1:
               iSkillDegreeEffect = 32;
               break;
            case 2:
               iSkillDegreeEffect = 29;
               break;
            case 3:
               iSkillDegreeEffect = 26;
               break;
            case 4:
               iSkillDegreeEffect = 23;
               break;
            case 5:
               iSkillDegreeEffect = 20;
               break;
            case 6:
               iSkillDegreeEffect = 17;
               break;
            case 7:
               iSkillDegreeEffect = 14;
               break;
            case 8:
               iSkillDegreeEffect = 7;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 34;
               break;
            case 1:
               iStarDegreeEffect = 33;
               break;
            case 2:
               iStarDegreeEffect = 32;
               break;
            case 3:
               iStarDegreeEffect = 31;
               break;
            case 4:
               iStarDegreeEffect = 29;
               break;
            case 5:
               iStarDegreeEffect = 27;
               break;
            case 6:
               iStarDegreeEffect = 25;
               break;
            case 7:
               iStarDegreeEffect = 23;
               break;
            case 8:
               iStarDegreeEffect = 21;
               break;
            case 9:
               iStarDegreeEffect = 19;
               break;
            case 10:
               iStarDegreeEffect = 17;
               break;
            case 11:
               iStarDegreeEffect = 14;
               break;
            case 12:
               iStarDegreeEffect = 12;
               break;
            case 13:
               iStarDegreeEffect = 9;
               break;
            case 14:
               iStarDegreeEffect = 7;
               break;
            case 15:
               iStarDegreeEffect = 4;
               break;
            case 16:
               iStarDegreeEffect = 2;
         }
         return 20 * iStarDegreeEffect;
      }
      
      internal static function GetFieldIntruderNumForAheadDirection(stFieldGrid:a_3491) : int
      {
         var stTargetFieldGrid:a_3491 = null;
         var stMoveIntruder:a_4206 = null;
         var yStart:int = 0;
         var yEnd:int = 0;
         var yIndex:int = 0;
         var iTotalIntruderNum:int = 0;
         var i:int = 0;
         if(stFieldGrid)
         {
            yStart = Math.max(stFieldGrid.m_iYGridNo - 1,0);
            yEnd = Math.min(stFieldGrid.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
            for(i = 0; i < BattleFieldView.a_1011; i++)
            {
               for(yIndex = yStart; yIndex <= yEnd; yIndex++)
               {
                  stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,yIndex);
                  if(stTargetFieldGrid != null)
                  {
                     for each(stMoveIntruder in stTargetFieldGrid.a_1511)
                     {
                        if(m_MouseArr.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) == -1)
                        {
                           if(!stMoveIntruder.isCannotSeeByFighter && 0 == stMoveIntruder.iSpaceState)
                           {
                              iTotalIntruderNum++;
                           }
                        }
                     }
                  }
               }
            }
         }
         return iTotalIntruderNum;
      }
   }
}

