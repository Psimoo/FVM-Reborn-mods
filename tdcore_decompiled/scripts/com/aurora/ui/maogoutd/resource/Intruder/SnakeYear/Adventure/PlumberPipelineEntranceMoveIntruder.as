package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Adventure
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class PlumberPipelineEntranceMoveIntruder extends a_4206
   {
      
      private var m_iStartTimeNum:int;
      
      public var m_iOldGridType:int = -1;
      
      protected var m_stPipelineOutletMoveIntruder:PlumberPipelineOutletMoveIntruder;
      
      private var m_iCreateTick:int = 30;
      
      private var m_stBOSS:PlumberDongJunBossMoveIntruder;
      
      public function PlumberPipelineEntranceMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(PlumberPipelineEntranceMoveIntruder) as PlumberPipelineEntranceMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return PlumberPipelineEntranceMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 120;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 1000000;
         a_1279 = -width * 0;
         a_1272 = 0;
         a_1462 = true;
         a_1463 = true;
         m_isRemovedFromBattaleField = true;
         this.m_iStartTimeNum = 0;
         this.m_iOldGridType = 0;
         this.m_iCreateTick = 30;
         this.SetAnimationOnce2Loop2(0,1);
         return true;
      }
      
      public function InitBOSS(boss:PlumberDongJunBossMoveIntruder) : void
      {
         this.m_stBOSS = boss;
      }
      
      override protected function a_3940() : Boolean
      {
         if(Boolean(m_stCurrentFieldGrid) && 2 == m_stCurrentFieldGrid.m_iFieldGridType)
         {
            m_stCurrentFieldGrid.m_iFieldGridType = this.m_iOldGridType;
         }
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            this.a_3940();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         return true;
      }
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
      
      private function CreateOutter() : void
      {
         var stPlumberPipelineOutletMoveIntruder:PlumberPipelineOutletMoveIntruder = null;
         var stFieldGridVector:Array = null;
         var arrFieldGridYNo:Array = null;
         var iTargetYNo:int = 0;
         var stCurTargetFieldGrid:a_3491 = null;
         var iYIndexKey:int = 0;
         stPlumberPipelineOutletMoveIntruder = PlumberPipelineOutletMoveIntruder.a_3926() as PlumberPipelineOutletMoveIntruder;
         this.m_stPipelineOutletMoveIntruder = stPlumberPipelineOutletMoveIntruder;
         if(stPlumberPipelineOutletMoveIntruder)
         {
            stFieldGridVector = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
            arrFieldGridYNo = [];
            if(m_stCurrentFieldGrid)
            {
               for(iYIndexKey = 0; iYIndexKey < BattleFieldView.a_1012; iYIndexKey++)
               {
                  if((stFieldGridVector[iYIndexKey][0] as a_3491).m_isNeedTray == m_stCurrentFieldGrid.m_isNeedTray)
                  {
                     arrFieldGridYNo.push(iYIndexKey);
                  }
               }
            }
            iTargetYNo = 0;
            if(arrFieldGridYNo.length == 0)
            {
               iTargetYNo = 0;
            }
            else
            {
               iTargetYNo = int(arrFieldGridYNo[this.m_stBOSS.m_stRandomSeed.nextInt(arrFieldGridYNo.length)]);
            }
            stCurTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[iTargetYNo][4 + this.m_stBOSS.m_stRandomSeed.nextInt(BattleFieldView.a_1011 - 6)];
            stPlumberPipelineOutletMoveIntruder.a_1797(0,-1);
            stPlumberPipelineOutletMoveIntruder.iGlobalMoveFighterID = this.m_stBOSS.a_4265();
            stPlumberPipelineOutletMoveIntruder.m_stMoveIntruderTypeID = 8388608;
            stPlumberPipelineOutletMoveIntruder.x = a_3491.a_1080 * stCurTargetFieldGrid.m_iXGridNo + (a_3491.a_1080 - stPlumberPipelineOutletMoveIntruder.width);
            stPlumberPipelineOutletMoveIntruder.y = a_3491.a_1081 * stCurTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - stPlumberPipelineOutletMoveIntruder.height);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stPlumberPipelineOutletMoveIntruder,stCurTargetFieldGrid);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stPlumberPipelineOutletMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stCurTargetFieldGrid);
            stPlumberPipelineOutletMoveIntruder.m_stPipelineEntranceMoveIntruder = this;
            stPlumberPipelineOutletMoveIntruder.m_iOldGridType = stCurTargetFieldGrid.m_iFieldGridType;
            stCurTargetFieldGrid.m_iFieldGridType = 2;
            ClearFieldGridDefenseCard(stCurTargetFieldGrid,true);
            stPlumberPipelineOutletMoveIntruder.a_3969(-900);
         }
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var arrBaseMoveIntruderVector:Array = null;
         var stMoveIntruder:a_4206 = null;
         var bIsOwnBoss:Boolean = false;
         if(!a_1460)
         {
            a_1460 = true;
            this.m_iStartTimeNum = iCurrentTime;
         }
         if(this.m_iCreateTick > 0)
         {
            --this.m_iCreateTick;
            if(this.m_iCreateTick == 0)
            {
               this.CreateOutter();
            }
         }
         if(this.m_iCreateTick == 0 && (this.m_stPipelineOutletMoveIntruder == null || this.m_stPipelineOutletMoveIntruder.iLifeValue <= 0))
         {
            this.a_3940();
            return true;
         }
         var stPipelineOutletMoveIntruder:PlumberPipelineOutletMoveIntruder = this.m_stPipelineOutletMoveIntruder;
         if(Boolean(m_stCurrentFieldGrid) && Boolean(stPipelineOutletMoveIntruder) && Boolean(stPipelineOutletMoveIntruder.m_stCurrentFieldGrid))
         {
            arrBaseMoveIntruderVector = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
            for each(stMoveIntruder in m_stCurrentFieldGrid.a_1511.slice())
            {
               bIsOwnBoss = Boolean(8388637 == stMoveIntruder.m_stMoveIntruderTypeID || 8388689 == stMoveIntruder.m_stMoveIntruderTypeID || (8392757 == stMoveIntruder.m_stMoveIntruderTypeID || 8389889 == stMoveIntruder.m_stMoveIntruderTypeID));
               if(stMoveIntruder.iLifeValue <= 10000 && stMoveIntruder.iSpaceState == 0 && !bIsOwnBoss && stMoveIntruder.x < a_3491.a_1080 * (BattleFieldView.a_1011 - 0.6))
               {
                  m_stCurrentFieldGrid.a_3457(stMoveIntruder);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(stMoveIntruder);
                  if(-1 != arrBaseMoveIntruderVector.indexOf(stMoveIntruder))
                  {
                     arrBaseMoveIntruderVector.splice(arrBaseMoveIntruderVector.indexOf(stMoveIntruder),1);
                  }
                  if(stPipelineOutletMoveIntruder)
                  {
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stMoveIntruder,stPipelineOutletMoveIntruder.m_stCurrentFieldGrid,false);
                     stMoveIntruder.x = a_3491.a_1080 * (stPipelineOutletMoveIntruder.m_stCurrentFieldGrid.m_iXGridNo - 0.8);
                  }
               }
            }
         }
         return true;
      }
      
      public function SetAnimationOnce2Loop2(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
   }
}

