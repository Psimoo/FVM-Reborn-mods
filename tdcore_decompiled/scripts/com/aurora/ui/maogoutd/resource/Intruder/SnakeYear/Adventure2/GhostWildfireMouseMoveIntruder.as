package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Adventure2
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class GhostWildfireMouseMoveIntruder extends a_4206
   {
      
      private var m_iStartTimeNum:int;
      
      private var m_numTargetYPos:Number;
      
      private var m_iGoTargetFieldTime:int;
      
      public var m_iGhostMouseMoveIntruderGlobalID:uint;
      
      protected var m_stPosFieldGrid:a_3491;
      
      public function GhostWildfireMouseMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(GhostWildfireMouseMoveIntruder) as GhostWildfireMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return GhostWildfireMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 120;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 300000;
         a_1279 = -width * 0;
         a_1272 = 0;
         a_1463 = true;
         this.m_iGhostMouseMoveIntruderGlobalID = 0;
         this.m_iGoTargetFieldTime = 0;
         gotoAndStop(1);
         a_1275 = 1;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         if(Boolean(m_stCurrentFieldGrid) && 2 == m_stCurrentFieldGrid.m_iFieldGridType)
         {
            m_stCurrentFieldGrid.m_iFieldGridType = 0;
         }
         if(Boolean(this.m_stPosFieldGrid) && 2 == this.m_stPosFieldGrid.m_iFieldGridType)
         {
            this.m_stPosFieldGrid.m_iFieldGridType = 0;
         }
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 300)
         {
         }
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         a_3419();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         m_stCurrentFieldGrid.a_3457(this);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         super.a_4210();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            this.m_iStartTimeNum = iCurrentTime;
            a_1460 = true;
            this.m_stPosFieldGrid = m_stCurrentFieldGrid;
            this.m_numTargetYPos = y;
         }
         if(this.m_iGoTargetFieldTime > 0)
         {
            --this.m_iGoTargetFieldTime;
            if(0 == this.m_iGoTargetFieldTime)
            {
               this.Change2Mouse2();
            }
         }
         if(iCurrentTime - this.m_iStartTimeNum > 120 && a_1275 != 2)
         {
            this.Change2Mouse();
         }
         return true;
      }
      
      private function Change2Mouse2() : void
      {
         var stGhostMouseMoveIntruder:GhostMouseMoveIntruder = null;
         visible = false;
         SetCannotSeeByFighter(true);
         stGhostMouseMoveIntruder = GhostMouseMoveIntruder.a_3926() as GhostMouseMoveIntruder;
         if(stGhostMouseMoveIntruder)
         {
            stGhostMouseMoveIntruder.a_1797(0,-1);
            stGhostMouseMoveIntruder.iGlobalMoveFighterID = this.m_iGhostMouseMoveIntruderGlobalID;
            stGhostMouseMoveIntruder.m_stMoveIntruderTypeID = 8388608;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stGhostMouseMoveIntruder,m_stCurrentFieldGrid);
            stGhostMouseMoveIntruder.x = x + 25;
            stGhostMouseMoveIntruder.y = y - 20;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stGhostMouseMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,m_stCurrentFieldGrid);
            stGhostMouseMoveIntruder.iDIYLife = 2000;
         }
         this.a_3969(a_1339);
      }
      
      public function Change2Mouse() : void
      {
         a_1275 = 2;
         gotoAndStop((a_1276[2] as FrameLabel).frame);
         this.m_iGoTargetFieldTime = 18;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
      }
      
      public function GoTargetFieldGrid() : void
      {
         this.m_iGoTargetFieldTime = 38;
      }
   }
}

