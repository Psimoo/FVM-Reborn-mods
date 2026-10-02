package com.aurora.ui.maogoutd.resource.defender.TigerYear.FireflyLantern
{
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.DefensePlaceHelper;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.EffectManager;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_4012;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import com.aurora.ui.maogoutd.role.a_4463;
   
   public class FireflyLanternCopyCardSkill
   {
      
      public static const REVIVAL_OFFSETS:Array = [[0,0],[0,-1],[0,1],[1,0],[1,-1],[-1,1],[-1,0],[-1,-1],[-1,1]];
      
      public function FireflyLanternCopyCardSkill()
      {
         super();
      }
      
      public static function CopyCardSkill(cardID:int, placeTimes:int, grid:a_3491) : void
      {
         var stBaseDefense:a_3962 = null;
         var iX:int = 0;
         var iY:int = 0;
         var stCurFieldGrid:a_3491 = null;
         var addResult:Boolean = false;
         var stInitialFieldGrid:a_3491 = null;
         var placeCount:int = 0;
         var role:a_4463 = null;
         var spreadDefense:a_3962 = null;
         var spreadDone:int = 0;
         var si:int = 0;
         var stSpreadField:a_3491 = null;
         var stSpreadInit:a_3491 = null;
         var spreadOrder:Array = null;
         if(grid == null || cardID == -1 || placeTimes <= 0)
         {
            return;
         }
         var battleFieldView:BattleFieldView = grid.m_stCurrentBattbleFieldView;
         if(!battleFieldView)
         {
            return;
         }
         var iLen:int = int(REVIVAL_OFFSETS.length);
         var times:int = 0;
         var occupiedGrids:Array = [];
         for(var i:int = 0; i < iLen; i++)
         {
            if(times >= placeTimes)
            {
               break;
            }
            iX = grid.m_iXGridNo + REVIVAL_OFFSETS[i][0];
            iY = grid.m_iYGridNo + REVIVAL_OFFSETS[i][1];
            stCurFieldGrid = battleFieldView.a_3438(iX,iY);
            if(!(stCurFieldGrid == null || occupiedGrids.indexOf(stCurFieldGrid) != -1))
            {
               stBaseDefense = a_4012.getInstance().a_4013(cardID) as a_3962;
               if(stBaseDefense != null)
               {
                  stBaseDefense.iDefenseTypeID = cardID;
                  stBaseDefense.m_iPlaceTimeIntervals = battleFieldView.iTimeIntervalNum;
                  stBaseDefense.m_iDefenseGlobalID = battleFieldView.a_2180();
                  addResult = battleFieldView.a_3441(stBaseDefense,stCurFieldGrid.m_iXGridNo,stCurFieldGrid.m_iYGridNo);
                  if(addResult)
                  {
                     stInitialFieldGrid = battleFieldView.a_3438(stCurFieldGrid.m_iXGridNo,stCurFieldGrid.m_iYGridNo);
                     a_3962.a_1088.a_2059(stBaseDefense.m_iDefenseGlobalID,stBaseDefense.a_3512(),stInitialFieldGrid.m_iInitialXGridNo,stInitialFieldGrid.m_iInitialYGridNo,0,2,30);
                     AddBornEffect(stCurFieldGrid);
                     occupiedGrids.push(stCurFieldGrid);
                     placeCount = DefensePlaceHelper.getInstance().getPlaceSkillCountByID(cardID);
                     if(placeCount > 0)
                     {
                        spreadDefense = a_4012.getInstance().a_4013(cardID) as a_3962;
                        if(spreadDefense)
                        {
                           spreadDefense.iDefenseTypeID = cardID;
                           spreadDone = 0;
                           spreadOrder = DefensePlaceHelper.SPREAD_OFFSET_ORDER;
                           si = 0;
                           while(si < spreadOrder.length && spreadDone < placeCount)
                           {
                              stSpreadField = battleFieldView.a_3438(grid.m_iXGridNo + spreadOrder[si][0],grid.m_iYGridNo + spreadOrder[si][1]);
                              if(!(!stSpreadField || occupiedGrids.indexOf(stSpreadField) != -1))
                              {
                                 if(stSpreadField.CheckAddDefense(spreadDefense))
                                 {
                                    stSpreadInit = battleFieldView.a_3438(stSpreadField.m_iXGridNo,stSpreadField.m_iYGridNo);
                                    a_3962.a_1088.a_2059(battleFieldView.a_2180(),cardID,stSpreadInit.m_iInitialXGridNo,stSpreadInit.m_iInitialYGridNo,0,2,30);
                                    AddBornEffect(stSpreadField);
                                    occupiedGrids.push(stSpreadField);
                                    spreadDone++;
                                 }
                              }
                              si++;
                           }
                           spreadDefense.a_3940();
                        }
                     }
                     role = a_2161.e.GetCurrentRole() as a_4463;
                     role = a_2161.e.GetCurrentRole() as a_4463;
                     if(Boolean(role) && role.m_iGamePoint > 10)
                     {
                        stBaseDefense.a_3940();
                     }
                     times++;
                  }
                  else
                  {
                     stBaseDefense.a_3940();
                  }
               }
            }
         }
      }
      
      private static function AddBornEffect(gride:a_3491) : void
      {
         var effect:BaseGameEffect = null;
         if(gride)
         {
            effect = EffectManager.getInstance().CheckOutEffect(FireflyLanternCopyEffectMovie);
            effect.x = (gride.m_iXGridNo + 0.5) * a_3491.a_1080;
            effect.y = (gride.m_iYGridNo + 0.5) * a_3491.a_1081;
            effect.SetAnimation(0,true);
            gride.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_TOP_TYPE,gride);
         }
      }
   }
}

