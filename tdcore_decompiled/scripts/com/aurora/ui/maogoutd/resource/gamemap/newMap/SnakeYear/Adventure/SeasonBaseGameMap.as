package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.Adventure
{
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleRandomUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   
   public class SeasonBaseGameMap extends BaseGameMap
   {
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      protected var iPathBegin:int = 0;
      
      protected var iPathEnd:int = 0;
      
      protected var lBallPath:Array = new Array();
      
      protected var _battleView:BattleFieldView;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      protected var m_iRayIndex:int = 0;
      
      protected var m_lGrid1:Array = new Array();
      
      protected var m_lGrid2:Array = new Array();
      
      protected var m_iCreateTick:int = 100;
      
      protected var m_iCreateCount:int = 0;
      
      protected var m_TotalObstaclePos:Array = new Array();
      
      protected var m_rayArray:Array = new Array();
      
      protected var m_ringBallArray:Array = new Array();
      
      public function SeasonBaseGameMap()
      {
         super();
         m_stMapInfoData.m_iBattleModType = 0;
         m_stMapInfoData.m_iWeatherType = 0;
      }
      
      public function RemoveRay(laser:LaserEffect) : void
      {
         var index:int = this.m_rayArray.indexOf(laser);
         if(index != -1)
         {
            this.m_rayArray[index] = null;
         }
         else
         {
            trace("回收失败!");
         }
      }
      
      protected function shuffleArray(arr:Array) : Array
      {
         return BattleRandomUtil.ShuffleArray(arr,this.m_stRandomSeed);
      }
      
      public function RealeaseBall(effect:PhotosphereEffect) : void
      {
         var index:int = this.m_ringBallArray.indexOf(effect);
         if(index != -1)
         {
            this.m_ringBallArray[index] = null;
         }
         else
         {
            trace("回收失败!");
         }
      }
      
      public function CreateBall(fieldGrid:a_3491) : void
      {
         var obs:PhotosphereEffect = null;
         obs = PhotosphereEffect.a_3926();
         obs.a_1797(false);
         this._battleView.AddToBattleView(obs,BattleLayerDefine.INTRUDER_LAND_TYPE,fieldGrid);
         obs.x = a_3491.a_1080 * fieldGrid.m_iXGridNo - 9;
         obs.y = a_3491.a_1081 * fieldGrid.m_iYGridNo;
         obs.InitData(fieldGrid,this);
         this._battleView.m_arrEffectArray.push(obs);
         this.lBallPath.push([fieldGrid,obs]);
         this.m_ringBallArray.push(obs);
      }
      
      public function ActiveBall(index:int, effect:ShadowShuttleEffect, state:int, ray:LaserEffect, rayIndex:int) : LaserEffect
      {
         var laserEffect:LaserEffect = null;
         var ball:PhotosphereEffect = this.m_ringBallArray[index];
         if(ball != null)
         {
            if(state == 0)
            {
               laserEffect = LaserEffect.a_3926();
               laserEffect.m_stMap = this;
               laserEffect.a_1797(ball.m_targetGrid,ball,effect);
               this._battleView.m_arrEffectArray.push(laserEffect);
               this.m_rayArray.push(laserEffect);
            }
            else if(state == 1)
            {
               laserEffect = LaserEffect.a_3926();
               laserEffect.m_stMap = this;
               laserEffect.a_1797(ball.m_targetGrid,ball,effect);
               this._battleView.m_arrEffectArray.push(laserEffect);
               this.m_rayArray.push(laserEffect);
               ray.EndRay(ball);
            }
            else
            {
               ray.EndRay(ball);
            }
            this.m_ringBallArray[index] = null;
            return laserEffect;
         }
         return null;
      }
      
      public function CreateRay(ball:PhotosphereEffect, shadow:ShadowShuttleEffect, state:int) : void
      {
      }
      
      public function AbsorbBall(index:int, rayIndex:int) : Boolean
      {
         var ball:PhotosphereEffect = null;
         var grid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         ball = this.m_ringBallArray[index];
         if(ball != null)
         {
            grid = ball.m_targetGrid;
            if(rayIndex < 3)
            {
               stBaseMoveIntruder = a_4255.getInstance().a_4256(8389131);
               stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389131;
            }
            else
            {
               stBaseMoveIntruder = a_4255.getInstance().a_4256(8389132);
               stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389132;
            }
            stBaseMoveIntruder.a_1797((1 << 16) + grid.m_iYGridNo,-1);
            stBaseMoveIntruder.x = grid.m_iXGridNo * a_3491.a_1080;
            stBaseMoveIntruder.y = grid.m_iYGridNo * a_3491.a_1081;
            this._battleView.a_3459(stBaseMoveIntruder,grid,true,BattleLayerDefine.INTRUDER_LAND_TYPE);
            stBaseMoveIntruder.SpecialSkillCallBack();
            ball.ReleaseBall();
            this.m_ringBallArray[index] = null;
            return true;
         }
         return false;
      }
      
      public function BoomBall(index:int, rayIndex:int) : Boolean
      {
         var ball:PhotosphereEffect = this.m_ringBallArray[index];
         if(ball != null)
         {
            ball.BoomBall();
            this.m_ringBallArray[index] = null;
            return true;
         }
         return false;
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var i:int = 0;
         var j:int = 0;
         var enterRoom:Object = null;
         var grid:a_3491 = null;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            i = 0;
            j = 0;
            this.m_iCreateCount = 0;
            this.m_iCreateTick = 20 * 5;
            enterRoom = a_2161.e.getEnterRoom();
            this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_iRayIndex = 0;
               this._battleView = stCurrentBattleFieldView;
               this.lBallPath.length = 0;
               this.m_ringBallArray.length = 0;
               this.m_rayArray.length = 0;
               for(j = 0; j < this.m_TotalObstaclePos.length; j++)
               {
                  grid = this._battleView.a_3438(this.m_TotalObstaclePos[j][0],this.m_TotalObstaclePos[j][1]);
                  if(grid != null)
                  {
                     grid.m_isNeedTray = true;
                  }
               }
            }
         }
         return true;
      }
      
      public function CreateShadow3() : void
      {
         var fieldGrid:a_3491 = null;
         var adMoveIntruder:ShadowShuttleEffect = null;
         var grid:a_3491 = null;
         var array:Array = new Array();
         this.m_ringBallArray.length -= this.lBallPath.length;
         this.iPathBegin = this.m_ringBallArray.length;
         for(var k:int = 0; k < this.lBallPath.length; k++)
         {
            grid = this.lBallPath[k][0];
            array.push([grid.m_iXGridNo,grid.m_iYGridNo]);
            this.m_ringBallArray.push(this.lBallPath[k][1]);
         }
         this.iPathEnd = this.m_ringBallArray.length;
         fieldGrid = this._battleView.a_3438(this.m_stRandomSeed.nextInt(3) + 3,3);
         adMoveIntruder = ShadowShuttleEffect.a_3926();
         if(adMoveIntruder)
         {
            adMoveIntruder.a_1797((1 << 16) + fieldGrid.m_iYGridNo + 150,-1);
            adMoveIntruder.InitData(this.iPathBegin,this.iPathEnd,this,array,4,this.m_iRayIndex);
            ++this.m_iRayIndex;
            adMoveIntruder.m_stMoveIntruderTypeID = 2147483653;
            if(fieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               fieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(adMoveIntruder,fieldGrid.m_iXGridNo,fieldGrid.m_iYGridNo);
            }
            fieldGrid.m_stCurrentBattbleFieldView.a_3459(adMoveIntruder,fieldGrid,false,BattleLayerDefine.EFFECTS_TOP_TYPE);
            adMoveIntruder.x = (fieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            adMoveIntruder.y = (fieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
         }
      }
      
      public function CreateShadow() : void
      {
         var fieldGrid:a_3491 = null;
         var adMoveIntruder:ShadowShuttleEffect = null;
         var j:int = 0;
         var k:int = 0;
         var grid:a_3491 = null;
         var array:Array = new Array();
         this.m_ringBallArray.length -= this.lBallPath.length;
         this.iPathBegin = this.m_ringBallArray.length;
         for(var i:int = 0; i < BattleFieldView.a_1011; i++)
         {
            for(j = 0; j < BattleFieldView.a_1012; j++)
            {
               for(k = 0; k < this.lBallPath.length; k++)
               {
                  grid = this.lBallPath[k][0];
                  if(grid.m_iXGridNo == i && grid.m_iYGridNo == j)
                  {
                     array.push([i,j]);
                     this.m_ringBallArray.push(this.lBallPath[k][1]);
                     break;
                  }
               }
            }
         }
         this.iPathEnd = this.m_ringBallArray.length;
         fieldGrid = this._battleView.a_3438(1,1);
         adMoveIntruder = ShadowShuttleEffect.a_3926();
         if(adMoveIntruder)
         {
            adMoveIntruder.a_1797((1 << 16) + fieldGrid.m_iYGridNo + 150,-1);
            adMoveIntruder.InitData(this.iPathBegin,this.iPathEnd,this,array,2,this.m_iRayIndex);
            ++this.m_iRayIndex;
            adMoveIntruder.m_stMoveIntruderTypeID = 2147483653;
            if(fieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               fieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(adMoveIntruder,fieldGrid.m_iXGridNo,fieldGrid.m_iYGridNo);
            }
            fieldGrid.m_stCurrentBattbleFieldView.a_3459(adMoveIntruder,fieldGrid,false,BattleLayerDefine.EFFECTS_TOP_TYPE);
            adMoveIntruder.x = (fieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            adMoveIntruder.y = (fieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
         }
      }
      
      public function CreateShadow2() : void
      {
         var fieldGrid:a_3491 = null;
         var adMoveIntruder:ShadowShuttleEffect = null;
         var dis:Number = NaN;
         var index:int = 0;
         var i:int = 0;
         var grid:a_3491 = null;
         var dis1:Number = NaN;
         var iNoX:int = 6 + this.m_stRandomSeed.nextInt(2);
         var iNoY:int = 3 + this.m_stRandomSeed.nextInt(3);
         var array:Array = new Array();
         var iStartX:int = iNoX;
         var iStartY:int = iNoY;
         this.m_ringBallArray.length -= this.lBallPath.length;
         this.iPathBegin = this.m_ringBallArray.length;
         while(this.lBallPath.length > 0)
         {
            dis = 9999;
            for(index = 0; i < this.lBallPath.length; )
            {
               grid = this.lBallPath[i][0];
               dis1 = Math.abs(Math.abs(iStartX * iStartX + iStartY * iStartY) - Math.abs(grid.m_iXGridNo * grid.m_iXGridNo + grid.m_iYGridNo * grid.m_iYGridNo));
               if(dis1 < dis)
               {
                  dis = dis1;
                  index = i;
               }
               i++;
            }
            array.push([this.lBallPath[index][0].m_iXGridNo,this.lBallPath[index][0].m_iYGridNo]);
            this.m_ringBallArray.push(this.lBallPath[index][1]);
            this.lBallPath.splice(index);
         }
         this.iPathEnd = this.m_ringBallArray.length;
         fieldGrid = this._battleView.a_3438(iNoX,iNoY);
         adMoveIntruder = ShadowShuttleEffect.a_3926();
         if(adMoveIntruder)
         {
            adMoveIntruder.a_1797((1 << 16) + fieldGrid.m_iYGridNo + 150,-1);
            adMoveIntruder.InitData(this.iPathBegin,this.iPathEnd,this,array,3,this.m_iRayIndex);
            ++this.m_iRayIndex;
            adMoveIntruder.m_stMoveIntruderTypeID = 2147483653;
            if(fieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               fieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(adMoveIntruder,fieldGrid.m_iXGridNo,fieldGrid.m_iYGridNo);
            }
            fieldGrid.m_stCurrentBattbleFieldView.a_3459(adMoveIntruder,fieldGrid,false,BattleLayerDefine.EFFECTS_TOP_TYPE);
            adMoveIntruder.x = (fieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            adMoveIntruder.y = (fieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
         }
      }
      
      protected function CreateBestGridArray(lArray:Array) : Array
      {
         var grid1:a_3491 = null;
         var lGrid1:Array = new Array();
         var lGrid2:Array = new Array();
         var lGrid3:Array = new Array();
         var lGrid4:Array = new Array();
         var i:int = 0;
         for(i = 0; i < lArray.length; i++)
         {
            grid1 = this._battleView.a_3438(lArray[i][1],lArray[i][0]);
            if(grid1 != null)
            {
               if(grid1.m_stFlowerDefense != null)
               {
                  if(grid1.m_stFlowerDefense.iEnergyTypeID == 3)
                  {
                     lGrid1.push(grid1);
                  }
                  else if(grid1.m_stFlowerDefense.iEnergyTypeID == 1)
                  {
                     lGrid2.push(grid1);
                  }
                  else
                  {
                     lGrid3.push(grid1);
                  }
               }
               else
               {
                  lGrid3.push(grid1);
               }
            }
         }
         if(lGrid1.length >= 2)
         {
            lGrid1 = this.shuffleArray(lGrid1);
            i = 0;
            while(i < lGrid1.length && lGrid4.length < 2)
            {
               lGrid4.push(lGrid1[i]);
               i++;
            }
         }
         else if(lGrid2.length >= 2)
         {
            lGrid2 = this.shuffleArray(lGrid2);
            i = 0;
            while(i < lGrid2.length && lGrid4.length < 2)
            {
               lGrid4.push(lGrid2[i]);
               i++;
            }
         }
         else
         {
            lGrid3 = this.shuffleArray(lGrid3);
            i = 0;
            while(i < lGrid3.length && lGrid4.length < 2)
            {
               lGrid4.push(lGrid3[i]);
               i++;
            }
         }
         return this.shuffleArray(lGrid4);
      }
      
      protected function CreateBestGrid(lArray:Array) : a_3491
      {
         var grid1:a_3491 = null;
         var grid2:a_3491 = null;
         var grid3:a_3491 = null;
         var lGrid:Array = new Array();
         var i:int = 0;
         for(i = 0; i < lArray.length; i++)
         {
            grid1 = this._battleView.a_3438(lArray[i][1],lArray[i][0]);
            if(Boolean(grid1 != null) && Boolean(grid1.m_stFlowerDefense) && grid1.m_stFlowerDefense.iEnergyTypeID == 3)
            {
               lGrid.push(grid1);
            }
         }
         if(lGrid.length == 0)
         {
            for(i = 0; i < lArray.length; i++)
            {
               grid2 = this._battleView.a_3438(lArray[i][1],lArray[i][0]);
               if(Boolean(grid2 != null) && Boolean(grid2.m_stFlowerDefense) && grid2.m_stFlowerDefense.iEnergyTypeID == 1)
               {
                  lGrid.push(grid2);
               }
            }
         }
         if(lGrid.length == 0)
         {
            for(i = 0; i < lArray.length; i++)
            {
               grid3 = this._battleView.a_3438(lArray[i][1],lArray[i][0]);
               if(grid3 != null)
               {
                  lGrid.push(grid3);
               }
            }
         }
         if(lGrid.length > 0)
         {
            return lGrid[this.m_stRandomSeed.nextInt(lGrid.length)];
         }
         return null;
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         return true;
      }
   }
}

