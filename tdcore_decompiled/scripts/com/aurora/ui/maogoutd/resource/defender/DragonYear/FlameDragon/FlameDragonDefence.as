package com.aurora.ui.maogoutd.resource.defender.DragonYear.FlameDragon
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class FlameDragonDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 235;
      
      internal static const m_MouseArr:Array = new Array(8388649,8392745,8389221,8388631,8388749,8388750,8392727);
      
      public function FlameDragonDefence()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 1.3;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 1.3;
               break;
            case 1:
               iSkillDegreeEffect = 1.25;
               break;
            case 2:
               iSkillDegreeEffect = 1.2;
               break;
            case 3:
               iSkillDegreeEffect = 1.15;
               break;
            case 4:
               iSkillDegreeEffect = 1.1;
               break;
            case 5:
               iSkillDegreeEffect = 1.05;
               break;
            case 6:
               iSkillDegreeEffect = 1;
               break;
            case 7:
               iSkillDegreeEffect = 0.9;
               break;
            case 8:
               iSkillDegreeEffect = 0.8;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 4.6;
               break;
            case 1:
               iStarDegreeEffect = 5.4;
               break;
            case 2:
               iStarDegreeEffect = 6.2;
               break;
            case 3:
               iStarDegreeEffect = 7;
               break;
            case 4:
               iStarDegreeEffect = 7.8;
               break;
            case 5:
               iStarDegreeEffect = 8.6;
               break;
            case 6:
               iStarDegreeEffect = 9.4;
               break;
            case 7:
               iStarDegreeEffect = 10.9;
               break;
            case 8:
               iStarDegreeEffect = 13;
               break;
            case 9:
               iStarDegreeEffect = 17;
               break;
            case 10:
               iStarDegreeEffect = 23;
               break;
            case 11:
               iStarDegreeEffect = 30;
               break;
            case 12:
               iStarDegreeEffect = 37;
               break;
            case 13:
               iStarDegreeEffect = 45;
               break;
            case 14:
               iStarDegreeEffect = 58;
               break;
            case 15:
               iStarDegreeEffect = 71;
               break;
            case 16:
               iStarDegreeEffect = 83;
         }
         return 10 * iStarDegreeEffect;
      }
      
      internal static function GetFieldIntruderNumForAheadDirection(stFieldGrid:a_3491) : int
      {
         var stTargetFieldGrid:a_3491 = null;
         var stMoveIntruder:a_4206 = null;
         var iTotalIntruderNum:int = 0;
         var i:int = 0;
         if(stFieldGrid)
         {
            for(i = 0; i < BattleFieldView.a_1011; i++)
            {
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo);
               if(stTargetFieldGrid != null)
               {
                  for each(stMoveIntruder in stTargetFieldGrid.a_1511)
                  {
                     if((!stMoveIntruder.isCannotSeeByFighter || m_MouseArr.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1) && 0 == stMoveIntruder.iSpaceState)
                     {
                        iTotalIntruderNum++;
                     }
                  }
               }
            }
         }
         return iTotalIntruderNum;
      }
      
      internal static function a_3430(stFieldGrid:a_3491) : int
      {
         var stTargetFieldGrid:a_3491 = null;
         var stMoveIntruder:a_4206 = null;
         var iTotalIntruderNum:int = 0;
         var i:int = 0;
         if(stFieldGrid)
         {
            for(i = 0; i < BattleFieldView.a_1011; i++)
            {
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo - 1);
               if(stTargetFieldGrid != null)
               {
                  for each(stMoveIntruder in stTargetFieldGrid.a_1511)
                  {
                     if((!stMoveIntruder.isCannotSeeByFighter || m_MouseArr.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1) && 0 == stMoveIntruder.iSpaceState)
                     {
                        iTotalIntruderNum++;
                     }
                  }
               }
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo);
               if(stTargetFieldGrid != null)
               {
                  for each(stMoveIntruder in stTargetFieldGrid.a_1511)
                  {
                     if((!stMoveIntruder.isCannotSeeByFighter || m_MouseArr.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1) && 0 == stMoveIntruder.iSpaceState)
                     {
                        iTotalIntruderNum++;
                     }
                  }
               }
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo + 1);
               if(stTargetFieldGrid != null)
               {
                  for each(stMoveIntruder in stTargetFieldGrid.a_1511)
                  {
                     if((!stMoveIntruder.isCannotSeeByFighter || m_MouseArr.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1) && 0 == stMoveIntruder.iSpaceState)
                     {
                        iTotalIntruderNum++;
                     }
                  }
               }
            }
         }
         return iTotalIntruderNum;
      }
   }
}

