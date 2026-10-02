package com.aurora.ui.maogoutd.resource.defender.HorseYear.windrider
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class WindRiderHorseDefense
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 6;
      
      internal static const DEFENSE_PRICE:int = 280;
      
      internal static const REDUCE_DEFENSE_PRICE:int = 50;
      
      internal static var m_GeneralKillAirMouseArr:Array = new Array(8388616,8388722,8388759,8388628,8388656,8388760,8389317,8389022);
      
      internal static var m_ExtraAddKillAirMouseArr:Array = new Array(8389137,8389111,8389217,8389413,8389012,8389647,8392712,8392724,8393112);
      
      public function WindRiderHorseDefense()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
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
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 9;
               break;
            case 1:
               iStarDegreeEffect = 10;
               break;
            case 2:
               iStarDegreeEffect = 11;
               break;
            case 3:
               iStarDegreeEffect = 13;
               break;
            case 4:
               iStarDegreeEffect = 15;
               break;
            case 5:
               iStarDegreeEffect = 17;
               break;
            case 6:
               iStarDegreeEffect = 19;
               break;
            case 7:
               iStarDegreeEffect = 21;
               break;
            case 8:
               iStarDegreeEffect = 24;
               break;
            case 9:
               iStarDegreeEffect = 33;
               break;
            case 10:
               iStarDegreeEffect = 45;
               break;
            case 11:
               iStarDegreeEffect = 60;
               break;
            case 12:
               iStarDegreeEffect = 75;
               break;
            case 13:
               iStarDegreeEffect = 90;
               break;
            case 14:
               iStarDegreeEffect = 110;
               break;
            case 15:
               iStarDegreeEffect = 135;
               break;
            case 16:
               iStarDegreeEffect = 160;
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
                        if(stMoveIntruder != null && (0 == stMoveIntruder.iSpaceState || 3 == stMoveIntruder.iSpaceState))
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
      
      internal static function isAirMouse(typeID:int) : Boolean
      {
         return m_GeneralKillAirMouseArr.indexOf(typeID) != -1 || m_ExtraAddKillAirMouseArr.indexOf(typeID) != -1;
      }
      
      internal static function hasFanDefenseInBattleField(fieldGrid:a_3491) : Boolean
      {
         var x:int = 0;
         var targetGrid:a_3491 = null;
         var fanDefense:Boolean = false;
         if(!fieldGrid)
         {
            return false;
         }
         var xStart:int = 0;
         var xEnd:int = BattleFieldView.a_1011 - 1;
         var yStart:int = 0;
         var yEnd:int = BattleFieldView.a_1012 - 1;
         loop0:
         for(var y:int = yStart; y <= yEnd; )
         {
            x = xStart;
            while(true)
            {
               if(x > xEnd)
               {
                  y++;
                  continue loop0;
               }
               targetGrid = fieldGrid.m_stCurrentBattbleFieldView.a_3438(x,y);
               if(targetGrid)
               {
                  fanDefense = targetGrid.tagCom.HasTag(20022);
                  if(fanDefense)
                  {
                     break;
                  }
               }
               x++;
            }
            return true;
         }
         return false;
      }
   }
}

