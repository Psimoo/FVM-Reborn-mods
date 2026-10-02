package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear
{
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.RabbitYear.TimeMachine.TimeMachineDefence;
   import com.aurora.ui.maogoutd.resource.defender.RabbitYear.TimeMachine.UpGradeEffect;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_4012;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.role.a_4463;
   
   public class TroubleCleanUpBaseGameMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      protected var m_arrBox:Array = new Array([2,3,null],[4,3,null],[0,6,null],[3,6,null],[6,6,null]);
      
      protected var m_arrDirty:Array = new Array([3,3,2,null],[0,5,3,null],[6,5,1,null],[3,7,1,null]);
      
      protected var m_arrRag:Array = new Array([3,2,null]);
      
      public function TroubleCleanUpBaseGameMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 1;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
      
      override public function a_4177() : void
      {
         var j:int = 0;
         for(j = 0; j < this.m_arrDirty.length; j++)
         {
            if(this.m_arrDirty[j][3] != null)
            {
               this.m_arrDirty[j][3].a_3940();
               this.m_arrDirty[j][3] = null;
            }
         }
         for(j = 0; j < this.m_arrBox.length; j++)
         {
            if(this.m_arrBox[j][2] != null)
            {
               this.m_arrBox[j][2].a_3940();
               this.m_arrBox[j][2] = null;
            }
         }
         for(j = 0; j < this.m_arrRag.length; j++)
         {
            if(this.m_arrRag[j][2] != null)
            {
               this.m_arrRag[j][2].a_3940();
               this.m_arrRag[j][2] = null;
            }
         }
         super.a_4177();
      }
      
      public function LevelUpAll() : void
      {
         var yIndex:int = 0;
         var tempFieldGrid:a_3491 = null;
         var stBaseDefense:a_3962 = null;
         var newStarDegree:int = 0;
         for(var xIndex:int = 0; xIndex <= 8; xIndex++)
         {
            for(yIndex = 0; yIndex <= 6; yIndex++)
            {
               tempFieldGrid = this.m_stCurrentBattleFieldView.a_3438(xIndex,yIndex);
               if(tempFieldGrid != null)
               {
                  stBaseDefense = TimeMachineDefence.getUpgradeDefense(tempFieldGrid);
                  if(stBaseDefense != null)
                  {
                     this.AddUpGradeEffect(tempFieldGrid,2);
                     newStarDegree = Math.min(stBaseDefense.a_1094 + 2,16);
                     if(newStarDegree != stBaseDefense.a_1094)
                     {
                        this.InitDefensePosition(stBaseDefense,newStarDegree);
                     }
                  }
               }
            }
         }
      }
      
      private function AddUpGradeEffect(stFieldGrid:a_3491, m_Level:int) : void
      {
         var effect:UpGradeEffect = null;
         if(stFieldGrid)
         {
            effect = UpGradeEffect.a_3926();
            effect.m_Level = Math.abs(m_Level);
            effect.a_1797(false);
            effect.x = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            effect.y = (stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081 + 25;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_TOP_TYPE,stFieldGrid);
            effect.play();
         }
      }
      
      public function InitDefensePosition(stBaseDefense:a_3962, newStarDegree:int) : void
      {
         var stInitialFieldGrid:a_3491 = null;
         var role:a_4463 = null;
         if(stBaseDefense == null || stBaseDefense.stFieldGrid == null)
         {
            return;
         }
         var stFieldGrid:a_3491 = stBaseDefense.stFieldGrid;
         var stNewDefense:a_3962 = a_4012.getInstance().a_4013(stBaseDefense.a_3512()) as a_3962;
         if(stNewDefense == null)
         {
            return;
         }
         stNewDefense.iDefenseTypeID = stBaseDefense.a_3512();
         stNewDefense.a_1094 = newStarDegree;
         stNewDefense.m_iSkillDegree = stBaseDefense.m_iSkillDegree;
         stBaseDefense.a_3940();
         stNewDefense.m_iPlaceTimeIntervals = this.m_stCurrentBattleFieldView.iTimeIntervalNum;
         stNewDefense.m_iDefenseGlobalID = this.m_stCurrentBattleFieldView.a_2180();
         var addResult:Boolean = this.m_stCurrentBattleFieldView.a_3441(stNewDefense,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         if(addResult)
         {
            stInitialFieldGrid = this.m_stCurrentBattleFieldView.a_3438(stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
            a_3962.a_1088.a_2059(stNewDefense.m_iDefenseGlobalID,stNewDefense.a_3512(),stInitialFieldGrid.m_iInitialXGridNo,stInitialFieldGrid.m_iInitialYGridNo,0,1,newStarDegree);
            role = a_2161.e.GetCurrentRole() as a_4463;
            role = a_2161.e.GetCurrentRole() as a_4463;
            if(Boolean(role) && role.m_iGamePoint > 10)
            {
               stNewDefense.a_3940();
            }
         }
         else
         {
            stNewDefense.a_3940();
         }
      }
      
      public function ReduceDirty(iNoX:int, iNoY:int) : void
      {
         for(var j:int = 0; j < this.m_arrDirty.length; j++)
         {
            if(this.m_arrDirty[j][0] == iNoY && this.m_arrDirty[j][1] == iNoX && this.m_arrDirty[j][3] != null && this.m_arrDirty[j][3].m_iHp > 0)
            {
               this.m_arrDirty[j][3].a_3969();
            }
         }
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var j:int = 0;
         var stCurrentBattleFieldView:BattleFieldView = null;
         var dirty:TroubleCleanUpDirty3HPEffect = null;
         var fieldGrid:a_3491 = null;
         var obs:TroubleCleanUpObstacleEffect = null;
         var fieldGrid2:a_3491 = null;
         var rag:TroubleCleanUpRagEffect = null;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               for(j = 0; j < this.m_arrDirty.length; j++)
               {
                  dirty = TroubleCleanUpDirty3HPEffect.a_3926();
                  dirty.a_1797(false,this.m_arrDirty[j][2],this,this.m_stCurrentBattleFieldView.stFieldGridsVector[this.m_arrDirty[j][0]][this.m_arrDirty[j][1]]);
                  this.m_arrDirty[j][3] = dirty;
               }
               for(j = 0; j < this.m_arrBox.length; j++)
               {
                  fieldGrid = this.m_stCurrentBattleFieldView.stFieldGridsVector[this.m_arrBox[j][0]][this.m_arrBox[j][1]];
                  obs = TroubleCleanUpObstacleEffect.a_3926();
                  obs.a_1797(false);
                  fieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(obs,BattleLayerDefine.DEFENSE_ATTACK_FIGHTER_TYPE,fieldGrid);
                  obs.x = a_3491.a_1080 * fieldGrid.m_iXGridNo;
                  obs.y = a_3491.a_1081 * fieldGrid.m_iYGridNo;
                  obs.InitData(this,fieldGrid);
                  this.m_arrBox[j][2] = obs;
               }
               for(j = 0; j < this.m_arrRag.length; j++)
               {
                  fieldGrid2 = this.m_stCurrentBattleFieldView.stFieldGridsVector[this.m_arrRag[j][0]][this.m_arrRag[j][1]];
                  rag = TroubleCleanUpRagEffect.a_3926();
                  rag.a_1797(false);
                  rag.InitData(this,fieldGrid2);
                  this.m_arrRag[j][2] = rag;
               }
            }
         }
         return true;
      }
      
      public function CheckHasBarrier(iNoX:int, iNoY:int) : Boolean
      {
         if(iNoX < 0 || iNoY < 0 || iNoX > 8 || iNoY > 6)
         {
            return true;
         }
         for(var j:int = 0; j < this.m_arrBox.length; j++)
         {
            if(this.m_arrBox[j][0] == iNoY && this.m_arrBox[j][1] == iNoX && this.m_arrBox[j][2] != null)
            {
               return true;
            }
         }
         return false;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var j:int = 0;
         var i:int = 0;
         var bClearAll:Boolean = false;
         var hasDirty:Boolean = false;
         for(j = 0; j < this.m_arrDirty.length; j++)
         {
            if(this.m_arrDirty[j][3] != null && this.m_arrDirty[j][3].m_iHp <= 0)
            {
               this.m_arrDirty[j][3] = null;
            }
            if(this.m_arrDirty[j][3] != null)
            {
               hasDirty = true;
            }
         }
         for(i = 0; i < this.m_arrBox.length; i++)
         {
            if(this.m_arrBox[i][2] != null && (!this.GridHasDirty(this.m_arrBox[i][1] + 1,this.m_arrBox[i][0]) && !this.GridHasDirty(this.m_arrBox[i][1],this.m_arrBox[i][0] + 1) && !this.GridHasDirty(this.m_arrBox[i][1] - 1,this.m_arrBox[i][0]) && !this.GridHasDirty(this.m_arrBox[i][1],this.m_arrBox[i][0] - 1)))
            {
               this.m_arrBox[i][2].OpenBox();
               this.m_arrBox[i][2] = null;
            }
         }
         for(i = 0; i < this.m_arrRag.length; i++)
         {
            if(this.m_arrRag[i][2] != null)
            {
               this.m_arrRag[i][2].TickUpdate();
            }
         }
         if(hasDirty == false)
         {
            bClearAll = false;
            for(i = 0; i < this.m_arrRag.length; i++)
            {
               if(this.m_arrRag[i][2] != null)
               {
                  this.m_arrRag[i][2].RemoveSelf();
                  this.m_arrRag[i][2] = null;
                  bClearAll = true;
               }
            }
            if(bClearAll == true)
            {
               this.LevelUpAll();
            }
         }
      }
      
      public function GridHasDirty(iNoX:int, iNoY:int) : Boolean
      {
         for(var j:int = 0; j < this.m_arrDirty.length; j++)
         {
            if(this.m_arrDirty[j][0] == iNoY && this.m_arrDirty[j][1] == iNoX && this.m_arrDirty[j][3] != null && this.m_arrDirty[j][3].m_iHp > 0)
            {
               return true;
            }
         }
         return false;
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         return true;
      }
   }
}

