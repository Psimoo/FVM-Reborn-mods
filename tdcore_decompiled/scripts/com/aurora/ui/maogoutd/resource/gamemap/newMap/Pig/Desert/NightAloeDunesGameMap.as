package com.aurora.ui.maogoutd.resource.gamemap.newMap.Pig.Desert
{
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class NightAloeDunesGameMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      private var m_arrTornadoShot:Array = [];
      
      public function NightAloeDunesGameMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][6].m_iFieldGridType = 4;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][7].m_iFieldGridType = 4;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[3][6].m_iFieldGridType = 4;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[3][7].m_iFieldGridType = 4;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[4][6].m_iFieldGridType = 4;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[4][7].m_iFieldGridType = 4;
            }
         }
         return true;
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         return true;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stTempFieldGrid:a_3491 = null;
         var stBaseShot:a_4348 = null;
         var arrFireXRang:Array = null;
         this.m_iCurrentTimeIntval = iTimeNum;
         var isChanged:Boolean = false;
         if(iTimeNum % (60 * 20) == 0)
         {
            this.addTornadoShot();
         }
         if(iTimeNum % 2 == 0)
         {
            arrFireXRang = this.GetFireHurtXRangByRow(0);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[0].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && stBaseShot.x > a_3491.a_1080 * 1 && stBaseShot.x < a_3491.a_1080 * 8 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(1);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[1].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && stBaseShot.x > a_3491.a_1080 * 1 && stBaseShot.x < a_3491.a_1080 * 8 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(2);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[2].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && stBaseShot.x > a_3491.a_1080 * 1 && stBaseShot.x < a_3491.a_1080 * 8 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(3);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[3].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && stBaseShot.x > a_3491.a_1080 * 1 && stBaseShot.x < a_3491.a_1080 * 8 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(4);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[4].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && stBaseShot.x > a_3491.a_1080 * 1 && stBaseShot.x < a_3491.a_1080 * 8 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(5);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[5].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && stBaseShot.x > a_3491.a_1080 * 1 && stBaseShot.x < a_3491.a_1080 * 8 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(6);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[6].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && stBaseShot.x > a_3491.a_1080 * 1 && stBaseShot.x < a_3491.a_1080 * 8 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
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
         return [];
      }
      
      protected function IsExistDefenseForGrid(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid.a_3492())
         {
            return true;
         }
         return false;
      }
      
      private function addTornadoShot() : void
      {
         var stStartFieldGrid:a_3491 = null;
         var stLastWaitShot:a_4348 = null;
         var m_iXGridNo:int = BattleFieldView.a_1011 - 1;
         var move_speed:int = a_3491.a_1080 / (1 * 20);
         stStartFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,1);
         if(stStartFieldGrid)
         {
            stLastWaitShot = TornadoShot.a_4344();
            stLastWaitShot.iShotSequenceNum = 0;
            stLastWaitShot.a_1797(1000,move_speed,1000000,stStartFieldGrid.m_iXGridNo * a_3491.a_1080 + 20,stStartFieldGrid.m_iYGridNo * a_3491.a_1081 + 62,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
            this.m_stCurrentBattleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
            this.m_arrTornadoShot.push(stLastWaitShot);
         }
         stStartFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,6);
         if(stStartFieldGrid)
         {
            stLastWaitShot = TornadoShot.a_4344();
            stLastWaitShot.iShotSequenceNum = 0;
            stLastWaitShot.a_1797(1000,move_speed,1000000,stStartFieldGrid.m_iXGridNo * a_3491.a_1080 + 20,stStartFieldGrid.m_iYGridNo * a_3491.a_1081 + 62,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
            this.m_stCurrentBattleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
            this.m_arrTornadoShot.push(stLastWaitShot);
         }
      }
   }
}

