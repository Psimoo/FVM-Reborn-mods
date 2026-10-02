package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear
{
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.wave.a_4450;
   import com.aurora.ui.maogoutd.resource.wave.a_4454;
   
   public class NightCoconutCloudRestaurantFirstGameMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_iAppearedTime:int;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_OutArray:Array = new Array([0,2],[1,2],[2,4],[3,4],[4,4],[5,6],[6,6]);
      
      public function NightCoconutCloudRestaurantFirstGameMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var i:int = 0;
         var enterRoom:Object = null;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               for(i = 0; i < BattleFieldView.a_1012; i++)
               {
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[i][2].m_iFieldGridType = 6;
               }
               this.m_iAppearedTime = 0;
               enterRoom = a_2161.e.getEnterRoom();
               this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
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
         if(this.m_iAppearedTime == 0)
         {
            this.m_iAppearedTime = iTimeNum;
         }
         this.m_iCurrentTimeIntval = iTimeNum - this.m_iAppearedTime;
         if(this.m_iCurrentTimeIntval != 0)
         {
            if(this.m_iCurrentTimeIntval % (90 * 20) == 0)
            {
               this.addBigCoconutMouse();
            }
         }
      }
      
      private function addBigCoconutMouse() : void
      {
         var index:int = 0;
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         var n:int = 0;
         m_iXGridNo = 8;
         m_iYGridNo = this.m_stRandomSeed.nextInt(3) + 2;
         stTargetFieldGrid = this.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
         if(stTargetFieldGrid != null)
         {
            stBaseMoveIntruder = BigCoconutMouseMoveIntruder.a_3926();
            if(stBaseMoveIntruder)
            {
               (stBaseMoveIntruder as BigCoconutMouseMoveIntruder).FULL_HP = 10000;
               stBaseMoveIntruder.a_1797((1 << 16) + stTargetFieldGrid.m_iYGridNo,-1);
               stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
               stBaseMoveIntruder.x = (stTargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
               stBaseMoveIntruder.y = (stTargetFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
               stTargetFieldGrid.m_stMouseObstacle = stBaseMoveIntruder;
               stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stTargetFieldGrid,false,BattleLayerDefine.OBSTACL_TYPE);
            }
         }
      }
   }
}

