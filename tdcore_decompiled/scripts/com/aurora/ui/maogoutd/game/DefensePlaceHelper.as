package com.aurora.ui.maogoutd.game
{
   import a_4752.GlobalVariables;
   import a_4754.a_2161;
   import com.aurora.protocol.game.maogoutd.CEntityStateChange;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_3971;
   import com.aurora.ui.maogoutd.resource.defender.a_3975;
   import com.aurora.ui.maogoutd.resource.defender.a_4012;
   import com.aurora.ui.maogoutd.resource.defender.defenderSet.IDefenderSet;
   import com.aurora.ui.maogoutd.role.a_4463;
   import flash.utils.Dictionary;
   
   public class DefensePlaceHelper
   {
      
      private static var _instance:DefensePlaceHelper;
      
      private static var m_AreadyPlacedic:Dictionary = new Dictionary();
      
      public static var SPREAD_OFFSET_ORDER:Array = [[0,0],[0,-1],[0,1],[1,0],[-1,0],[-1,-1],[-1,1],[1,-1],[1,1],[-2,0],[2,0],[0,-2],[0,2],[-2,-1],[-2,1],[2,-1],[2,1],[-1,-2],[-1,2],[1,-2],[1,2],[-2,-2],[-2,2],[2,-2],[2,2]];
      
      public var m_FinalBrahmaTriggerGrid:a_3491;
      
      public var m_LastPlaceFinalBrahmaGrid:a_3491;
      
      public var m_PlaceTriggerdic:Dictionary = new Dictionary();
      
      public var m_FinalBrahmaSkillDic:Dictionary = new Dictionary();
      
      public function DefensePlaceHelper()
      {
         super();
         if(_instance)
         {
            throw new Error("DefenseSpreadPlacer is singleton");
         }
      }
      
      public static function getInstance() : DefensePlaceHelper
      {
         if(!_instance)
         {
            _instance = new DefensePlaceHelper();
         }
         return _instance;
      }
      
      public function getPlaceSkillCountByID(cardID:int) : int
      {
         switch(cardID)
         {
            case 287572013:
            case 292552863:
            case 292552975:
               return 2;
            default:
               return 0;
         }
      }
      
      public function getPlaceCountByPlaceID(cardID:int, step:int) : int
      {
         if(step == 2)
         {
            return cardID == 288950029 ? 1 : 0;
         }
         switch(cardID)
         {
            case 288950079:
            case 287572013:
            case 292552863:
            case 288950029:
               return 2;
            default:
               return 0;
         }
      }
      
      public function FinalBrahmaTrigger() : void
      {
         var key:String = null;
         var stGride:a_3491 = null;
         this.m_FinalBrahmaTriggerGrid = null;
         for(key in this.m_PlaceTriggerdic)
         {
            stGride = this.m_PlaceTriggerdic[key];
            if(stGride)
            {
               delete stGride.m_dicCannotAddCard["finalBrahmaPlace"];
               if(stGride.m_stFinalBrahmaDefense)
               {
                  stGride.m_stFinalBrahmaDefense.SpecialSkillCallBack(1);
               }
            }
         }
         this.m_PlaceTriggerdic = new Dictionary();
      }
      
      public function PostFinalBrahmaStateChange(stMyBattleFieldView:BattleFieldView) : void
      {
         var key:String = null;
         var stGride:a_3491 = null;
         var stEnemyVanish:CEntityStateChange = null;
         var iPlaceTimeNum:int = 0;
         if(!stMyBattleFieldView)
         {
            return;
         }
         this.m_FinalBrahmaSkillDic = new Dictionary();
         for(key in this.m_PlaceTriggerdic)
         {
            stGride = this.m_PlaceTriggerdic[key];
            if(stGride)
            {
               if(stGride.m_stFinalBrahmaDefense)
               {
                  stEnemyVanish = new CEntityStateChange();
                  stEnemyVanish.m_iGlobalID = stGride.m_stFinalBrahmaDefense.m_iDefenseGlobalID;
                  stEnemyVanish.m_iType = 1;
                  stEnemyVanish.m_iTypeID = stGride.m_iInitialXGridNo;
                  stEnemyVanish.key = stGride.m_iInitialYGridNo;
                  stEnemyVanish.value = stGride.m_stFinalBrahmaDefense.a_3512();
                  iPlaceTimeNum = stMyBattleFieldView.iTimeIntervalNum;
                  a_3962.a_1088.PostEntityStateChange(iPlaceTimeNum,stMyBattleFieldView.m_byTeamNo,[stEnemyVanish]);
               }
            }
         }
         this.FinalBrahmaTrigger();
      }
      
      public function getChekcDefense(cardID:int) : a_3962
      {
         var stBaseDefense:a_3962 = null;
         var copyID:int = -1;
         if(cardID == 288950029)
         {
            copyID = GlobalVariables.getInstance().m_iLastDefender;
         }
         stBaseDefense = a_4012.getInstance().a_4013(copyID) as a_3962;
         if(!stBaseDefense)
         {
            stBaseDefense = a_4012.getInstance().a_4013(cardID) as a_3962;
         }
         return stBaseDefense;
      }
      
      public function ReplaceDefenseAndPost(stBaseDefense:a_3962, newStarDegree:int, durationTick:int = -1) : a_3962
      {
         if(stBaseDefense == null || stBaseDefense.stFieldGrid == null)
         {
            return null;
         }
         var stFieldGrid:a_3491 = stBaseDefense.stFieldGrid;
         var stBattleFieldView:BattleFieldView = stFieldGrid.m_stCurrentBattbleFieldView;
         if(stBattleFieldView == null)
         {
            return null;
         }
         var stNewDefense:a_3962 = a_4012.getInstance().a_4013(stBaseDefense.a_3512()) as a_3962;
         if(stNewDefense == null)
         {
            return null;
         }
         var originalStar:int = stBaseDefense.m_iRealStarDegree;
         var totalTick:int = durationTick >= 0 ? durationTick << 8 | originalStar : originalStar;
         var origSeatID:int = stBaseDefense.m_iOrigSeatID;
         stNewDefense.iDefenseTypeID = stBaseDefense.a_3512();
         stNewDefense.a_1094 = newStarDegree;
         stNewDefense.m_iSkillDegree = stBaseDefense.m_iSkillDegree;
         if(!stBaseDefense.tagCom.HasTag(30039))
         {
            stBaseDefense.a_3940();
         }
         stNewDefense.m_iPlaceTimeIntervals = stBattleFieldView.iTimeIntervalNum;
         stNewDefense.m_iDefenseGlobalID = stBattleFieldView.a_2180();
         var stInitialFieldGrid:a_3491 = stBattleFieldView.a_3438(stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         if(stInitialFieldGrid == null)
         {
            stNewDefense.a_3940();
            return null;
         }
         a_3962.a_1088.a_2059(stNewDefense.m_iDefenseGlobalID,stNewDefense.a_3512(),stInitialFieldGrid.m_iInitialXGridNo,stInitialFieldGrid.m_iInitialYGridNo,0,1,newStarDegree,0,totalTick,origSeatID);
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         role = a_2161.e.GetCurrentRole() as a_4463;
         if(Boolean(role) && role.m_iGamePoint > 10)
         {
            stNewDefense.a_3940();
         }
         return stNewDefense;
      }
      
      public function TryAddCardCopy(grid:a_3491, cardID:int, iOrigSeatID:int, placeOffsets:Array, skillTimes:int, sucessCallPack:Function) : void
      {
         var pos:String = null;
         var placeX:int = 0;
         var placeY:int = 0;
         var stCurField:a_3491 = null;
         var iCnt:int = 0;
         var j:int = 0;
         var stTargetField:a_3491 = null;
         if(!grid || cardID == -1 || skillTimes <= 0)
         {
            return;
         }
         if(!placeOffsets || placeOffsets.length == 0)
         {
            return;
         }
         var battleFieldView:BattleFieldView = grid.m_stCurrentBattbleFieldView;
         if(!battleFieldView)
         {
            return;
         }
         var stBaseDefense:a_3962 = a_4012.getInstance().a_4013(cardID) as a_3962;
         if(!stBaseDefense)
         {
            return;
         }
         stBaseDefense.iDefenseTypeID = cardID;
         m_AreadyPlacedic = new Dictionary();
         var addResult:Boolean = false;
         var times:int = 0;
         var i:int = 0;
         while(i < placeOffsets.length && times < skillTimes)
         {
            placeX = grid.m_iInitialXGridNo + placeOffsets[i][0];
            placeY = grid.m_iInitialYGridNo + placeOffsets[i][1];
            pos = placeX + "_" + placeY;
            if(!m_AreadyPlacedic[pos])
            {
               stCurField = battleFieldView.GetInitialFieldGrid(placeX,placeY);
               if(stCurField)
               {
                  addResult = this.CheckPlaceRuleAndCalcAddDefense(stBaseDefense,stCurField,true);
                  if(addResult)
                  {
                     addResult = stCurField.CheckAddDefense(stBaseDefense);
                     if(addResult)
                     {
                        times++;
                        m_AreadyPlacedic[pos] = true;
                        if(sucessCallPack != null)
                        {
                           sucessCallPack(stCurField,stBaseDefense,iOrigSeatID,true);
                        }
                        if(stBaseDefense.a_3512() == 287572013 || stBaseDefense.a_3512() == 292552863 || stBaseDefense.a_3512() == 292552975)
                        {
                           iCnt = 0;
                           j = 0;
                           while(j < SPREAD_OFFSET_ORDER.length && iCnt < 2)
                           {
                              placeX = stCurField.m_iInitialXGridNo + SPREAD_OFFSET_ORDER[j][0];
                              placeY = stCurField.m_iInitialYGridNo + SPREAD_OFFSET_ORDER[j][1];
                              pos = placeX + "_" + placeY;
                              if(!m_AreadyPlacedic[pos])
                              {
                                 stTargetField = battleFieldView.GetInitialFieldGrid(placeX,placeY);
                                 if(stTargetField)
                                 {
                                    addResult = this.CheckPlaceRuleAndCalcAddDefense(stBaseDefense,stTargetField,true);
                                    if(addResult)
                                    {
                                       addResult = stTargetField.CheckAddDefense(stBaseDefense);
                                       if(addResult)
                                       {
                                          m_AreadyPlacedic[pos] = true;
                                          if(sucessCallPack != null)
                                          {
                                             sucessCallPack(stTargetField,stBaseDefense,false);
                                          }
                                          iCnt++;
                                       }
                                    }
                                 }
                              }
                              j++;
                           }
                        }
                     }
                  }
               }
            }
            i++;
         }
         stBaseDefense.a_3940();
      }
      
      public function CheckPlaceRuleAndCalcAddDefense(stDefense:a_3962, stFieldGrid:a_3491, isReduce:Boolean) : Boolean
      {
         var stResult:Boolean = false;
         if(!stDefense || !stFieldGrid)
         {
            return false;
         }
         if(stFieldGrid.m_stAttackFighter is IDefenderSet && (stFieldGrid.m_stAttackFighter as IDefenderSet).IsUpgradeID(stDefense.a_3512()))
         {
            if(!(stFieldGrid.m_stAttackFighter as IDefenderSet).IsFull())
            {
               return true;
            }
            return false;
         }
         if((stDefense.iUpgradeID & 0xFF0000) > 0)
         {
            return this.TryConsumeUpgradeDefenseForPlace(stDefense,stFieldGrid,isReduce);
         }
         if(this.IsDefenseOccupiedForPlace(stDefense,stFieldGrid))
         {
            return false;
         }
         return true;
      }
      
      private function TryConsumeUpgradeDefenseForPlace(stDefense:a_3962, stFieldGrid:a_3491, isReduce:Boolean) : Boolean
      {
         if(!stDefense || !stFieldGrid)
         {
            return false;
         }
         var stCoveredDefense:a_3962 = stFieldGrid.getIUpgradeDefense();
         if(stDefense is a_3975 && null != stFieldGrid.m_stProtector && stFieldGrid.m_stProtector.iUpgradeID == (stDefense.iUpgradeID & 0xFFFF))
         {
            if(isReduce)
            {
               stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
            }
            return true;
         }
         if(stDefense is a_3953 && null != stFieldGrid.m_stAttackFighter && stFieldGrid.m_stAttackFighter.iUpgradeID == (stDefense.iUpgradeID & 0xFFFF))
         {
            if(isReduce)
            {
               stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
            }
            return true;
         }
         if(stDefense is a_3960 && null != stFieldGrid.m_stBoomDefense && stFieldGrid.m_stBoomDefense.iUpgradeID == (stDefense.iUpgradeID & 0xFFFF))
         {
            if(isReduce)
            {
               stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
            }
            return true;
         }
         if(stDefense is a_3971 && null != stFieldGrid.m_stFlowerDefense && stFieldGrid.m_stFlowerDefense.iUpgradeID == (stDefense.iUpgradeID & 0xFFFF))
         {
            if(isReduce)
            {
               stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
            }
            return true;
         }
         if(stDefense is a_3959 && null != stFieldGrid.m_stBaseAuxiliaryFighter && stFieldGrid.m_stBaseAuxiliaryFighter.iUpgradeID == (stDefense.iUpgradeID & 0xFFFF))
         {
            if(isReduce)
            {
               stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
            }
            return true;
         }
         if(Boolean(stCoveredDefense) && stDefense.iUpgradeArray.indexOf(stCoveredDefense.a_3512()) != -1)
         {
            if(isReduce)
            {
               stCoveredDefense.a_3969(stCoveredDefense.iLifeValue);
            }
            return true;
         }
         return false;
      }
      
      private function IsDefenseOccupiedForPlace(stDefense:a_3962, stFieldGrid:a_3491) : Boolean
      {
         return stDefense is a_3975 && null != stFieldGrid.m_stProtector || stDefense is a_3953 && !this.CanPlaceAttackDefense(stDefense,stFieldGrid) || stDefense is a_3960 && (null != stFieldGrid.m_stBoomDefense || null != stFieldGrid.m_stAttackFighter) || stDefense is a_3971 && (null != stFieldGrid.m_stFlowerDefense || null != stFieldGrid.m_stAttackFighter);
      }
      
      public function CanPlaceAttackDefense(baseDefense:a_3962, stFieldGrid:a_3491) : Boolean
      {
         var attackFighter:a_3953 = baseDefense as a_3953;
         if(!attackFighter || !stFieldGrid)
         {
            return false;
         }
         if(attackFighter.secondExtraSlotType == 1 || attackFighter.secondExtraSlotType == 2)
         {
            return null == stFieldGrid.m_stHoneyTrapBaseDefense;
         }
         return null == stFieldGrid.m_stAttackFighter && null == stFieldGrid.m_stFlowerDefense && null == stFieldGrid.m_stBaseAuxiliaryFighter && null == stFieldGrid.m_stBoomDefense;
      }
   }
}

