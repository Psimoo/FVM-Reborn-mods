package com.aurora.ui.maogoutd.resource.gamemap.newMap.RabbitYear.SummerHolidays
{
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4128;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.RabbitYear.NightHumanFaceCookiesMoveIntruder;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.wave.a_4450;
   import com.aurora.ui.maogoutd.resource.wave.a_4454;
   
   public class BeerAdvancedCampNightMoTaGameMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_iAppearedTime:int;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var BarrierArray:Array = new Array([1,8],[5,8]);
      
      private var m_OutArray:Array = new Array();
      
      private var m_FirstBornArray:Array = new Array([1,0],[1,1],[5,0],[5,1]);
      
      public function BeerAdvancedCampNightMoTaGameMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 1;
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var i:int = 0;
         var k:int = 0;
         var enterRoom:Object = null;
         var iYIndex:int = 0;
         var iXIndex:int = 0;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               a_4128.a_1413 = true;
               stCurrentBattleFieldView.m_stLargeFogEffect.a_1797();
               stCurrentBattleFieldView.a_3462(7);
               for(i = 0; i < BattleFieldView.a_1011; i++)
               {
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[0][i].m_isNeedTray = true;
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[6][i].m_isNeedTray = true;
               }
               for(k = 0; k < this.BarrierArray.length; k++)
               {
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[this.BarrierArray[k][0]][this.BarrierArray[k][1]].m_iFieldGridType = 1;
               }
               this.m_iAppearedTime = 0;
               enterRoom = a_2161.e.getEnterRoom();
               this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
               while(this.m_OutArray.length > 0)
               {
                  this.m_OutArray.pop();
               }
               for(iYIndex = 1; iYIndex < BattleFieldView.a_1012 - 1; iYIndex++)
               {
                  for(iXIndex = 0; iXIndex < BattleFieldView.a_1011; iXIndex++)
                  {
                     if(!(iYIndex == 1 && iXIndex == 0 || iYIndex == 1 && iXIndex == 1 || iYIndex == 5 && iXIndex == 0 || iYIndex == 5 && iXIndex == 0 || iYIndex == 1 && iXIndex == 8 || iYIndex == 5 && iXIndex == 8))
                     {
                        this.m_OutArray.push([iYIndex,iXIndex]);
                     }
                  }
               }
            }
         }
         return true;
      }
      
      override public function a_4175() : a_4450
      {
         return a_4454.a_3926();
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var i:int = 0;
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var stBaseShot:a_4348 = null;
         var arrFireXRang:Array = null;
         if(this.m_iAppearedTime == 0)
         {
            this.m_iAppearedTime = iTimeNum;
         }
         this.m_iCurrentTimeIntval = iTimeNum - this.m_iAppearedTime;
         if(this.m_iCurrentTimeIntval == 15 * 20)
         {
            this.addHumanFaceMouse(this.m_FirstBornArray);
         }
         if(iTimeNum % 10 == 0)
         {
            for(i = 0; i < this.BarrierArray.length; i++)
            {
               m_iXGridNo = int(this.BarrierArray[i][1]);
               m_iYGridNo = int(this.BarrierArray[i][0]);
               stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               if(stTargetFieldGrid != null && stTargetFieldGrid.ClimbIsEmpty())
               {
                  stTargetFieldGrid.InitClimb();
               }
            }
         }
         if(iTimeNum % 2 == 0)
         {
            arrFireXRang = this.GetFireHurtXRangByRow(0);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[0].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(1);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[1].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(2);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[2].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(3);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[3].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(4);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[4].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(5);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[5].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(6);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[6].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
         }
      }
      
      protected function IsShotInXRang(numXShotPos:Number, arrXRang:Array) : Boolean
      {
         var arrXTempRang:Array = null;
         for each(arrXTempRang in arrXRang)
         {
            if(numXShotPos > arrXTempRang[0] && numXShotPos < arrXTempRang[1])
            {
               return true;
            }
         }
         return false;
      }
      
      protected function GetFireHurtXRangByRow(iYIndexNum:int) : Array
      {
         var arrXFireRange:Array = [];
         if(1 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[1][8]))
            {
               arrXFireRange.push([a_3491.a_1080 * 8,a_3491.a_1080 * 9]);
            }
         }
         else if(5 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[5][8]))
            {
               arrXFireRange.push([a_3491.a_1080 * 8,a_3491.a_1080 * 9]);
            }
         }
         return arrXFireRange;
      }
      
      protected function IsExistDefenseForGrid(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid.a_3492())
         {
            return true;
         }
         return false;
      }
      
      private function addHumanFaceMouse(bornPosition:Array = null) : void
      {
         var j:int;
         var i:int;
         var index:int = 0;
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         var k:int = 0;
         var n:int = 0;
         var count:int = 0;
         if(bornPosition != null && bornPosition.length > 0)
         {
            for(k = 0; k < bornPosition.length; k++)
            {
               m_iXGridNo = int(bornPosition[k][1]);
               m_iYGridNo = int(bornPosition[k][0]);
               stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               if(stTargetFieldGrid != null && !(stTargetFieldGrid.m_stMouseObstacle is NightHumanFaceCookiesMoveIntruder) && !(stTargetFieldGrid.m_stAttackFighter is a_3924))
               {
                  stBaseMoveIntruder = NightHumanFaceCookiesMoveIntruder.a_3926();
                  if(stBaseMoveIntruder)
                  {
                     (stBaseMoveIntruder as NightHumanFaceCookiesMoveIntruder).FULL_HP = 400000;
                     (stBaseMoveIntruder as NightHumanFaceCookiesMoveIntruder).SkillPickInterval = 13;
                     (stBaseMoveIntruder as NightHumanFaceCookiesMoveIntruder).callBackFun = this.addHumanFaceMouse;
                     stBaseMoveIntruder.a_1797((1 << 16) + stTargetFieldGrid.m_iYGridNo,-1);
                     stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
                     stBaseMoveIntruder.x = (stTargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
                     stBaseMoveIntruder.y = (stTargetFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
                     stTargetFieldGrid.m_stMouseObstacle = stBaseMoveIntruder;
                     stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stTargetFieldGrid,false,BattleLayerDefine.OBSTACL_TYPE);
                  }
               }
            }
            return;
         }
         for(j = 0; j < this.m_OutArray.length; j++)
         {
            m_iXGridNo = int(this.m_OutArray[j][1]);
            m_iYGridNo = int(this.m_OutArray[j][0]);
            stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
            if(stTargetFieldGrid != null && stTargetFieldGrid.m_stMouseObstacle is NightHumanFaceCookiesMoveIntruder)
            {
               count++;
            }
         }
         if(count >= 16 || count == this.m_OutArray.length)
         {
            return;
         }
         for(i = 0; i < 1; i++)
         {
            n = 0;
            try
            {
               while(true)
               {
                  n++;
                  if(n > 50)
                  {
                     break;
                  }
                  index = int(this.m_stRandomSeed.nextInt(this.m_OutArray.length));
                  m_iXGridNo = int(this.m_OutArray[index][1]);
                  m_iYGridNo = int(this.m_OutArray[index][0]);
                  stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
                  if(stTargetFieldGrid == null || stTargetFieldGrid.m_stMouseObstacle is NightHumanFaceCookiesMoveIntruder || stTargetFieldGrid.m_stAttackFighter is a_3924)
                  {
                     continue;
                  }
                  if(n != 51)
                  {
                     stBaseMoveIntruder = NightHumanFaceCookiesMoveIntruder.a_3926();
                     if(stBaseMoveIntruder)
                     {
                        (stBaseMoveIntruder as NightHumanFaceCookiesMoveIntruder).FULL_HP = 400000;
                        (stBaseMoveIntruder as NightHumanFaceCookiesMoveIntruder).SkillPickInterval = 13;
                        (stBaseMoveIntruder as NightHumanFaceCookiesMoveIntruder).callBackFun = this.addHumanFaceMouse;
                        stBaseMoveIntruder.a_1797((1 << 16) + stTargetFieldGrid.m_iYGridNo,-1);
                        stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
                        stBaseMoveIntruder.x = (stTargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
                        stBaseMoveIntruder.y = (stTargetFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
                        stTargetFieldGrid.m_stMouseObstacle = stBaseMoveIntruder;
                        stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stTargetFieldGrid,false,BattleLayerDefine.OBSTACL_TYPE);
                     }
                  }
               }
               §§goto(addr03ae);
            }
            catch(error:Error)
            {
               trace("没有格子出现人面曲奇");
            }
         }
      }
   }
}

