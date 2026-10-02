package com.aurora.ui.maogoutd.resource.defender.DragonYear.EggStealingDragon
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class EggStealingDragonDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 350;
      
      internal static const m_MouseArr:Array = new Array(8388649,8392745,8389221,8388631,8388749,8388750,8392727);
      
      public function EggStealingDragonDefence()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 2.2;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 2.2;
               break;
            case 1:
               iSkillDegreeEffect = 2.15;
               break;
            case 2:
               iSkillDegreeEffect = 2.1;
               break;
            case 3:
               iSkillDegreeEffect = 2.05;
               break;
            case 4:
               iSkillDegreeEffect = 2;
               break;
            case 5:
               iSkillDegreeEffect = 1.95;
               break;
            case 6:
               iSkillDegreeEffect = 1.9;
               break;
            case 7:
               iSkillDegreeEffect = 1.85;
               break;
            case 8:
               iSkillDegreeEffect = 1.75;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 5;
               break;
            case 1:
               iStarDegreeEffect = 6;
               break;
            case 2:
               iStarDegreeEffect = 7;
               break;
            case 3:
               iStarDegreeEffect = 8;
               break;
            case 4:
               iStarDegreeEffect = 10;
               break;
            case 5:
               iStarDegreeEffect = 12;
               break;
            case 6:
               iStarDegreeEffect = 14;
               break;
            case 7:
               iStarDegreeEffect = 17;
               break;
            case 8:
               iStarDegreeEffect = 20;
               break;
            case 9:
               iStarDegreeEffect = 23;
               break;
            case 10:
               iStarDegreeEffect = 26;
               break;
            case 11:
               iStarDegreeEffect = 29;
               break;
            case 12:
               iStarDegreeEffect = 35;
               break;
            case 13:
               iStarDegreeEffect = 41;
               break;
            case 14:
               iStarDegreeEffect = 51;
               break;
            case 15:
               iStarDegreeEffect = 61;
               break;
            case 16:
               iStarDegreeEffect = 72;
         }
         return 10 * iStarDegreeEffect;
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

