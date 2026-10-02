package com.aurora.ui.maogoutd.resource.defender.DragonYear.GoldChaos
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.iface.IBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class GoldChaosDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 205;
      
      private static const m_BaseCanEatTypeIds:Array = [134224481,134224482,8389008,8389647];
      
      private static const m_SecondTransCanEatTypeIds:Array = [8389013];
      
      private static const m_FinalTransCanEatTypeIds:Array = [8389649];
      
      private static const m_GostMouseLookup:Object = buildTypeIdLookup(BattleFieldView.m_GostMouse);
      
      private static const m_UnPopularMouseLookup:Object = buildTypeIdLookup(BattleFieldView.m_UnPopularMouse);
      
      private static const m_BaseCanEatLookup:Object = buildTypeIdLookup(m_BaseCanEatTypeIds);
      
      private static const m_SecondTransCanEatLookup:Object = buildTypeIdLookup(m_BaseCanEatTypeIds.concat(m_SecondTransCanEatTypeIds));
      
      private static const m_FinalTransCanEatLookup:Object = buildTypeIdLookup(m_BaseCanEatTypeIds.concat(m_SecondTransCanEatTypeIds).concat(m_FinalTransCanEatTypeIds));
      
      public function GoldChaosDefence()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 35;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 35;
               break;
            case 1:
               iStarDegreeEffect = 34;
               break;
            case 2:
               iStarDegreeEffect = 33;
               break;
            case 3:
               iStarDegreeEffect = 32;
               break;
            case 4:
               iStarDegreeEffect = 31;
               break;
            case 5:
               iStarDegreeEffect = 30;
               break;
            case 6:
               iStarDegreeEffect = 28;
               break;
            case 7:
               iStarDegreeEffect = 26;
               break;
            case 8:
               iStarDegreeEffect = 24;
               break;
            case 9:
               iStarDegreeEffect = 22;
               break;
            case 10:
               iStarDegreeEffect = 20;
               break;
            case 11:
               iStarDegreeEffect = 18;
               break;
            case 12:
               iStarDegreeEffect = 16;
               break;
            case 13:
               iStarDegreeEffect = 13;
               break;
            case 14:
               iStarDegreeEffect = 10;
               break;
            case 15:
               iStarDegreeEffect = 7;
               break;
            case 16:
               iStarDegreeEffect = 4;
               break;
            case 17:
               iStarDegreeEffect = 3;
               break;
            case 18:
               iStarDegreeEffect = 2;
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
      
      internal static function CanTriggerChangeYSkill(stFieldGrid:a_3491, stXoffset:int, endXoffset:int, stYoffset:int, endYoffset:int, transType:int = 0) : Boolean
      {
         var xIndex:int = 0;
         var tpFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(stFieldGrid == null)
         {
            return false;
         }
         var stTargetFieldGrid:a_3491 = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo + 1,stFieldGrid.m_iYGridNo);
         if(stTargetFieldGrid == null)
         {
            stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         }
         var xStart:int = Math.max(stFieldGrid.m_iXGridNo + stXoffset,0);
         var xEnd:int = Math.min(stFieldGrid.m_iXGridNo + endXoffset,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(stFieldGrid.m_iYGridNo + stYoffset,0);
         var yEnd:int = Math.min(stFieldGrid.m_iYGridNo + endYoffset,BattleFieldView.a_1012 - 1);
         loop0:
         for(var yIndex:int = yStart; yIndex <= yEnd; )
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
               tpFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(tpFieldGrid != null)
               {
                  arrMoveIntruder = tpFieldGrid.a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     if(isValidMoveIntruder(stMoveIntruder,stTargetFieldGrid,transType))
                     {
                        break loop1;
                     }
                  }
               }
               xIndex++;
            }
            return true;
         }
         return false;
      }
      
      internal static function isValidMoveIntruder(stMoveIntruder:a_4206, stTargetFieldGrid:a_3491 = null, transType:int = 0) : Boolean
      {
         if(!stMoveIntruder || stMoveIntruder.m_ChageMouseYLocked)
         {
            return false;
         }
         if(stMoveIntruder as IBossMoveIntruder)
         {
            return false;
         }
         var isSpecialElite:Boolean = transType == 3 && (stMoveIntruder.m_stMoveIntruderTypeID == 8389649 || stMoveIntruder.tagCom.HasTag(40011));
         if(stMoveIntruder.tagCom.HasTag(401) && !isSpecialElite)
         {
            return false;
         }
         if(transType < 2)
         {
            if(isBaseTierBlocked(stMoveIntruder))
            {
               return false;
            }
         }
         if(!stMoveIntruder.isFearCatHead && !canEatDieNotFearCatHead(stMoveIntruder,transType))
         {
            return false;
         }
         if(stMoveIntruder.isCannotSeeByInsurance && stMoveIntruder.iSpaceState != 3 && stMoveIntruder.iSpaceState != 1)
         {
            return false;
         }
         if(stTargetFieldGrid == null)
         {
            return true;
         }
         return stMoveIntruder.m_stCurrentFieldGrid.m_isNeedTray == stTargetFieldGrid.m_isNeedTray && stTargetFieldGrid != stMoveIntruder.m_stCurrentFieldGrid;
      }
      
      private static function isBaseTierBlocked(stMoveIntruder:a_4206) : Boolean
      {
         var typeId:int = stMoveIntruder.m_stMoveIntruderTypeID;
         return stMoveIntruder.iSpaceState == 1 || Boolean(m_GostMouseLookup[typeId]) || Boolean(m_UnPopularMouseLookup[typeId]);
      }
      
      private static function canEatDieNotFearCatHead(stMoveIntruder:a_4206, transType:int) : Boolean
      {
         var typeId:int = stMoveIntruder.m_stMoveIntruderTypeID;
         if(m_GostMouseLookup[typeId])
         {
            return true;
         }
         if(m_UnPopularMouseLookup[typeId])
         {
            return true;
         }
         if(stMoveIntruder.iSpaceState == 1)
         {
            return true;
         }
         if(transType < 2)
         {
            return m_BaseCanEatLookup[typeId];
         }
         if(transType < 3)
         {
            return m_SecondTransCanEatLookup[typeId];
         }
         return Boolean(m_FinalTransCanEatLookup[typeId]) || stMoveIntruder.tagCom.HasTag(40011);
      }
      
      private static function buildTypeIdLookup(typeIds:Array) : Object
      {
         var lookup:Object = {};
         for(var i:int = 0; i < typeIds.length; i++)
         {
            lookup[typeIds[i]] = true;
         }
         return lookup;
      }
   }
}

