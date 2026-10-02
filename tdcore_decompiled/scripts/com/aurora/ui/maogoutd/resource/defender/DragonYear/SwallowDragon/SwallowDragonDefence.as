package com.aurora.ui.maogoutd.resource.defender.DragonYear.SwallowDragon
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.iface.IBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class SwallowDragonDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 175;
      
      internal static const m_MouseArr:Array = new Array(8388649,8392745,8389221,8388631,8388749,8388750,8392727,8388624,8388647,8388870,8388725,8388741,8388977,8388993,8389114,8389218,8389314,8393073,8393089,8393111);
      
      public function SwallowDragonDefence()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 38;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 38;
               break;
            case 1:
               iStarDegreeEffect = 37;
               break;
            case 2:
               iStarDegreeEffect = 36;
               break;
            case 3:
               iStarDegreeEffect = 35;
               break;
            case 4:
               iStarDegreeEffect = 33;
               break;
            case 5:
               iStarDegreeEffect = 31;
               break;
            case 6:
               iStarDegreeEffect = 29;
               break;
            case 7:
               iStarDegreeEffect = 27;
               break;
            case 8:
               iStarDegreeEffect = 25;
               break;
            case 9:
               iStarDegreeEffect = 23;
               break;
            case 10:
               iStarDegreeEffect = 21;
               break;
            case 11:
               iStarDegreeEffect = 19;
               break;
            case 12:
               iStarDegreeEffect = 17;
               break;
            case 13:
               iStarDegreeEffect = 14;
               break;
            case 14:
               iStarDegreeEffect = 11;
               break;
            case 15:
               iStarDegreeEffect = 8;
               break;
            case 16:
               iStarDegreeEffect = 5;
         }
         return 20 * iStarDegreeEffect;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 35;
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
               iSkillDegreeEffect = 19;
               break;
            case 6:
               iSkillDegreeEffect = 15;
               break;
            case 7:
               iSkillDegreeEffect = 11;
               break;
            case 8:
               iSkillDegreeEffect = 7;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function CanTriggerChangeYSkill(stFieldGrid:a_3491, m_Range:int, m_Xoffset:*) : Boolean
      {
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var tpFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var stTargetFieldGrid:a_3491 = null;
         var CanTriggerChange:Boolean = false;
         if(stFieldGrid != null)
         {
            xStart = Math.max(stFieldGrid.m_iXGridNo + m_Xoffset - m_Range,0);
            xEnd = Math.min(stFieldGrid.m_iXGridNo + m_Xoffset + m_Range,BattleFieldView.a_1011 - 1);
            yStart = Math.max(stFieldGrid.m_iYGridNo - m_Range,0);
            yEnd = Math.min(stFieldGrid.m_iYGridNo + m_Range,BattleFieldView.a_1012 - 1);
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  tpFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
                  arrMoveIntruder = tpFieldGrid.a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stMoveIntruder.m_stCurrentFieldGrid.m_iXGridNo - 1,stFieldGrid.m_iYGridNo);
                     if(stTargetFieldGrid != null && !stMoveIntruder.m_ChageMouseYLocked && stMoveIntruder.isFearCatHead && 0 == stMoveIntruder.iSpaceState && !(stMoveIntruder as IBossMoveIntruder))
                     {
                        if(!(m_MouseArr.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1 || stMoveIntruder.isCannotSeeByInsurance || stMoveIntruder.isGoHeadNotEatDefense || stMoveIntruder.tagCom.HasTag(401)))
                        {
                           if(stMoveIntruder.m_stCurrentFieldGrid.m_isNeedTray == stTargetFieldGrid.m_isNeedTray && stTargetFieldGrid != stMoveIntruder.m_stCurrentFieldGrid)
                           {
                              stMoveIntruder.m_ChageMouseYLocked = true;
                              CanTriggerChange = true;
                           }
                        }
                     }
                  }
               }
            }
         }
         return CanTriggerChange;
      }
   }
}

