package com.aurora.ui.maogoutd.resource.Intruder.newBoss.MidMoon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class PlumberPipelineEntranceMoveIntruder extends a_4206
   {
      
      private var m_iStartTimeNum:int;
      
      private var m_arrPipelineOutletMoveIntruder:Array = [];
      
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
         this.m_arrPipelineOutletMoveIntruder = [];
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         if(Boolean(m_stCurrentFieldGrid) && 2 == m_stCurrentFieldGrid.m_iFieldGridType)
         {
            m_stCurrentFieldGrid.m_iFieldGridType = 0;
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
         if(iCurrentTime - this.m_iStartTimeNum == 28)
         {
            gotoAndStop((a_1276[1] as FrameLabel).frame);
            stop();
         }
         var stPipelineOutletMoveIntruder:PlumberPipelineOutletMoveIntruder = this.m_arrPipelineOutletMoveIntruder[0] as PlumberPipelineOutletMoveIntruder;
         if(Boolean(m_stCurrentFieldGrid) && Boolean(stPipelineOutletMoveIntruder) && Boolean(stPipelineOutletMoveIntruder.m_stCurrentFieldGrid))
         {
            arrBaseMoveIntruderVector = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
            for each(stMoveIntruder in m_stCurrentFieldGrid.a_1511.slice())
            {
               bIsOwnBoss = Boolean(8388637 == stMoveIntruder.m_stMoveIntruderTypeID || 8388689 == stMoveIntruder.m_stMoveIntruderTypeID || 8392757 == stMoveIntruder.m_stMoveIntruderTypeID);
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
      
      override public function a_4140(iCurrentTime:int) : void
      {
         super.a_4140(iCurrentTime);
         if(a_1273 == a_1274)
         {
            stop();
         }
      }
      
      public function OnPipelineOutletMoveIntruderDie(stPipelineOutletMoveIntruder:a_4206) : void
      {
         if(-1 != this.m_arrPipelineOutletMoveIntruder.indexOf(stPipelineOutletMoveIntruder))
         {
            this.m_arrPipelineOutletMoveIntruder.splice(this.m_arrPipelineOutletMoveIntruder.indexOf(stPipelineOutletMoveIntruder),1);
         }
         if(this.m_arrPipelineOutletMoveIntruder.length == 0)
         {
            this.a_3940();
         }
      }
      
      public function OnAddPipelineOutletMoveIntruder(stPipelineOutletMoveIntruder:a_4206) : *
      {
         if(-1 == this.m_arrPipelineOutletMoveIntruder.indexOf(stPipelineOutletMoveIntruder))
         {
            this.m_arrPipelineOutletMoveIntruder.push(stPipelineOutletMoveIntruder);
         }
      }
   }
}

