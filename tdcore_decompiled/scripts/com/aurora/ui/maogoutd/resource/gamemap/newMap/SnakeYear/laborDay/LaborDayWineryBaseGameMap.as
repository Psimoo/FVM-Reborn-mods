package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.laborDay
{
   import a_4718.b_179;
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.SleepingEffect;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.BaseGameMoveMap;
   
   public class LaborDayWineryBaseGameMap extends BaseGameMoveMap
   {
      
      public static var a_1445:a_4187 = new a_4187();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      protected var m_OutArray:Array = new Array();
      
      protected var m_TotalObstaclePos:Array = new Array();
      
      private var m_notVisBubbleArray:Array = new Array();
      
      private var m_silenceArray:Array = new Array();
      
      public function LaborDayWineryBaseGameMap()
      {
         super();
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
      }
      
      override protected function InitGameMoveMapData() : void
      {
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
      
      private function a_3483(stDataEvent:a_1778) : void
      {
         var iDefenseTypeID:int = int(stDataEvent.dataObject[0]);
         var tempFieldGrid:Object = stDataEvent.dataObject.length >= 3 ? stDataEvent.dataObject[2] : null;
         if(tempFieldGrid == null)
         {
            return;
         }
         var i:int = 0;
         if(iDefenseTypeID == b_179.a_403 || iDefenseTypeID == b_179.enm_HelmetCopperScoop || iDefenseTypeID == b_179.enm_HelmetSilverScoop || iDefenseTypeID == b_179.enm_HelmetGoldenScoop)
         {
            for(i = 0; i < this.m_OutArray.length; i++)
            {
               if(this.m_OutArray[i][0] == tempFieldGrid.m_iYGridNo && this.m_OutArray[i][1] == tempFieldGrid.m_iXGridNo)
               {
                  this.m_OutArray[i][3].OnScoopPlace();
               }
            }
         }
         if(iDefenseTypeID == 286851441)
         {
            for(i = 0; i < this.m_OutArray.length; i++)
            {
               if(this.m_OutArray[i][0] == tempFieldGrid.m_iYGridNo && this.m_OutArray[i][1] == tempFieldGrid.m_iXGridNo)
               {
                  this.m_OutArray[i][3].OnStopperPlace();
               }
            }
         }
      }
      
      public function OnScoopPlace(iNoX:int, iNoY:int) : void
      {
         for(var i:int = 0; i < this.m_OutArray.length; i++)
         {
            if(this.m_OutArray[i][0] == iNoY && this.m_OutArray[i][1] == iNoX)
            {
               this.m_OutArray[i][3].OnScoopPlace();
            }
         }
      }
      
      public function a_3492(iNoX:int, iNoY:int) : int
      {
         if(this.IsClose(iNoX,iNoY))
         {
            return 2;
         }
         if(this.m_stCurrentBattleFieldView.stFieldGridsVector[iNoY][iNoX].a_3492())
         {
            return 1;
         }
         return 0;
      }
      
      private function IsClose(iNoX:int, iNoY:int) : Boolean
      {
         for(var i:int = 0; i < this.m_OutArray.length; i++)
         {
            if(this.m_OutArray[i][0] == iNoY && this.m_OutArray[i][1] == iNoX && Boolean(this.m_OutArray[i][3].IsClose()))
            {
               return true;
            }
         }
         return false;
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var i:int = 0;
         var j:int = 0;
         var silenceArray:Array = null;
         var ob:Object = null;
         var fieldGrid:a_3491 = null;
         var obs:LaborBottleEffect = null;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            i = 0;
            j = 0;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_silenceArray.length = 0;
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               for(i = 0; i < BattleFieldView.a_1012; i++)
               {
                  silenceArray = new Array();
                  for(j = 0; j < BattleFieldView.a_1011; j++)
                  {
                     ob = new Object();
                     ob.effect = null;
                     ob.effect2 = null;
                     ob.selience = false;
                     silenceArray.push(ob);
                  }
                  this.m_silenceArray.push(silenceArray);
               }
               for(j = 0; j < this.m_OutArray.length; j++)
               {
                  fieldGrid = this.m_stCurrentBattleFieldView.stFieldGridsVector[this.m_OutArray[j][0]][this.m_OutArray[j][1]];
                  obs = LaborBottleEffect.a_3926();
                  obs.a_1797(false);
                  fieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(obs,BattleLayerDefine.DEFENSE_ATTACK_FIGHTER_TYPE,fieldGrid);
                  obs.x = a_3491.a_1080 * fieldGrid.m_iXGridNo;
                  obs.y = a_3491.a_1081 * fieldGrid.m_iYGridNo - 40;
                  obs.InitData(fieldGrid,this.m_OutArray[j][2]);
                  this.m_OutArray[j][3] = obs;
                  this.m_notVisBubbleArray.push(this.m_OutArray[j][0] * 100 + this.m_OutArray[j][1]);
               }
               for(j = 0; j < this.m_TotalObstaclePos.length; j++)
               {
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[this.m_TotalObstaclePos[j][0]][this.m_TotalObstaclePos[j][1]].m_iFieldGridType = 4;
                  this.m_notVisBubbleArray.push(this.m_TotalObstaclePos[j][0] * 100 + this.m_TotalObstaclePos[j][1]);
               }
               a_1789.getInstance().addEventListener("DefenseCardCountChange",this.a_3483);
            }
         }
         return true;
      }
      
      private function SetSeilence(iNoX:int, iNoY:int) : void
      {
         this.SetSeilence2(iNoX - 1,iNoY);
         this.SetSeilence2(iNoX + 1,iNoY);
         this.SetSeilence2(iNoX,iNoY - 1);
         this.SetSeilence2(iNoX,iNoY + 1);
      }
      
      private function SetSeilence2(iNewX:int, iNewY:int) : void
      {
         if(iNewX < 0)
         {
            return;
         }
         if(iNewY < 0)
         {
            return;
         }
         if(iNewX >= BattleFieldView.a_1011)
         {
            return;
         }
         if(iNewY >= BattleFieldView.a_1012)
         {
            return;
         }
         this.m_silenceArray[iNewY][iNewX].selience = true;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var i:int = 0;
         var j:int = 0;
         var isSilence:Boolean = false;
         var gird:a_3491 = null;
         var stSleepingEffect:SleepingEffect = null;
         var stBubbleEffect:LaborBubbleEffect = null;
         i = 0;
         j = 0;
         for(i = 0; i < BattleFieldView.a_1012; i++)
         {
            for(j = 0; j < BattleFieldView.a_1011; j++)
            {
               this.m_silenceArray[i][j].selience = false;
            }
         }
         for(j = 0; j < this.m_OutArray.length; j++)
         {
            if(this.m_OutArray[j][3].IsSilence())
            {
               this.SetSeilence(this.m_OutArray[j][1],this.m_OutArray[j][0]);
            }
         }
         for(i = 0; i < BattleFieldView.a_1012; i++)
         {
            for(j = 0; j < BattleFieldView.a_1011; j++)
            {
               isSilence = Boolean(this.m_silenceArray[i][j].selience);
               gird = this.m_stCurrentBattleFieldView.stFieldGridsVector[i][j];
               gird.m_isSilent = isSilence;
               if(isSilence && (gird.m_stAttackFighter != null || gird.m_stFlowerDefense != null))
               {
                  if(this.m_silenceArray[i][j].effect == null)
                  {
                     stSleepingEffect = SleepingEffect.a_3926();
                     stSleepingEffect.a_1797(false);
                     stSleepingEffect.a_3958 = 99999;
                     if(gird.m_stAttackFighter != null)
                     {
                        stSleepingEffect.x = gird.m_stAttackFighter.x + gird.m_stAttackFighter.width * 0.4;
                        stSleepingEffect.y = gird.m_stAttackFighter.y;
                     }
                     else if(gird.m_stFlowerDefense != null)
                     {
                        stSleepingEffect.x = gird.m_stFlowerDefense.x + gird.m_stFlowerDefense.width * 0.4;
                        stSleepingEffect.y = gird.m_stFlowerDefense.y;
                     }
                     gird.m_stCurrentBattbleFieldView.AddToBattleView(stSleepingEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,gird);
                     this.m_silenceArray[i][j].effect = stSleepingEffect;
                  }
               }
               else if(this.m_silenceArray[i][j].effect != null)
               {
                  this.m_silenceArray[i][j].effect.a_3940();
                  this.m_silenceArray[i][j].effect = null;
               }
               if(isSilence && this.m_notVisBubbleArray.indexOf(i * 100 + j) == -1)
               {
                  if(this.m_silenceArray[i][j].effect2 == null)
                  {
                     stBubbleEffect = LaborBubbleEffect.a_3926();
                     stBubbleEffect.a_1797(false);
                     stBubbleEffect.x = a_3491.a_1080 * gird.m_iXGridNo;
                     stBubbleEffect.y = a_3491.a_1081 * gird.m_iYGridNo + 8;
                     gird.m_stCurrentBattbleFieldView.AddToBattleView(stBubbleEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,gird);
                     this.m_silenceArray[i][j].effect2 = stBubbleEffect;
                  }
               }
               else if(this.m_silenceArray[i][j].effect2 != null)
               {
                  this.m_silenceArray[i][j].effect2.PlayRelease();
                  this.m_silenceArray[i][j].effect2 = null;
               }
            }
         }
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         return true;
      }
      
      override public function a_4177() : void
      {
         var j:int = 0;
         a_1789.getInstance().removeEventListener("DefenseCardCountChange",this.a_3483);
         var i:int = 0;
         for(i = 0; i < BattleFieldView.a_1012; i++)
         {
            for(j = 0; j < BattleFieldView.a_1011; j++)
            {
               if(this.m_silenceArray[i][j].effect != null)
               {
                  this.m_silenceArray[i][j].effect.a_3940();
                  this.m_silenceArray[i][j].effect = null;
               }
               if(this.m_silenceArray[i][j].effect2 != null)
               {
                  this.m_silenceArray[i][j].effect2.a_3940();
                  this.m_silenceArray[i][j].effect2 = null;
               }
            }
         }
         for(i = 0; i < this.m_OutArray.length; i++)
         {
            if(this.m_OutArray[i][3] != null)
            {
               this.m_OutArray[i][3].a_3940();
               this.m_OutArray[i][3] = null;
            }
         }
         super.a_4177();
      }
   }
}

