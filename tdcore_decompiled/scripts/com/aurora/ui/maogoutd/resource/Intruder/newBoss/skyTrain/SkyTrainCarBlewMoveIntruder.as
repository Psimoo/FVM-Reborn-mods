package com.aurora.ui.maogoutd.resource.Intruder.newBoss.skyTrain
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class SkyTrainCarBlewMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 2100;
      
      private static const BOOM_TICK:int = 5;
      
      private var m_bIsPalying:Boolean;
      
      private var m_bIsBoom:Boolean;
      
      private var m_iBoomTick:int;
      
      public function SkyTrainCarBlewMoveIntruder()
      {
         super();
         a_1272 = 0;
         a_1279 = -this.width * 0.5;
         a_1467 = 0.5 * this.height - 0.5 * a_3491.a_1081;
      }
      
      public static function a_3926() : SkyTrainCarBlewMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(SkyTrainCarBlewMoveIntruder) as SkyTrainCarBlewMoveIntruder;
      }
      
      override public function get width() : Number
      {
         return 124;
      }
      
      override public function get height() : Number
      {
         return 98;
      }
      
      override protected function getBindMovie() : Class
      {
         return SkyTrainCarBlewMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1339 = MAX_LIFE;
         this.m_bIsPalying = true;
         this.m_bIsBoom = false;
         this.GotoAndStopFrame(0);
         return true;
      }
      
      private function GotoAndStopFrame(iFrame:uint) : void
      {
         if(iFrame != a_1275)
         {
            a_1275 = iFrame;
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            a_3419();
         }
      }
      
      private function LifeIsZeroHandle() : void
      {
         if(this.m_bIsBoom)
         {
            a_3940();
         }
         else
         {
            this.GotoAndStopFrame(3);
         }
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
      }
      
      override public function a_4210() : Boolean
      {
         this.a_3969(900);
         return true;
      }
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         return false;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(0 >= a_1339)
         {
            this.LifeIsZeroHandle();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(!this.m_bIsBoom)
         {
            super.a_3969(iRduceLifeValue);
            return this.ResetMovieStatus();
         }
         return false;
      }
      
      override public function a_4140(iCurrentTime:int) : void
      {
         if(!this.m_bIsPalying)
         {
            return;
         }
         nextFrame();
         if(a_1273 == a_1274 || a_1278 != null)
         {
            if(a_1339 <= 0)
            {
               a_3940();
            }
            else if(this.m_bIsBoom)
            {
               this.m_bIsBoom = false;
               a_3940();
            }
            else
            {
               this.GotoAndStopFrame(a_1275 + 1);
            }
         }
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(this.m_bIsBoom == false && 2 == a_1275)
         {
            this.m_bIsBoom = true;
            this.m_iBoomTick = BOOM_TICK;
         }
         else if(this.m_bIsBoom && this.m_iBoomTick > 0)
         {
            --this.m_iBoomTick;
            if(0 == this.m_iBoomTick)
            {
               this.PlayBoomSkill();
            }
         }
         return true;
      }
      
      private function PlayBoomSkill() : void
      {
         var iYGrid:int = 0;
         var stFieldGrid:a_3491 = null;
         var iXStart:int = Math.max(m_stCurrentFieldGrid.m_iXGridNo - 1,0);
         var iXEnd:int = Math.min(m_stCurrentFieldGrid.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var iYStart:int = Math.max(m_stCurrentFieldGrid.m_iYGridNo - 1,0);
         var iYEnd:int = Math.min(m_stCurrentFieldGrid.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         for(var iXGrid:int = iXStart; iXGrid <= iXEnd; iXGrid++)
         {
            for(iYGrid = iYStart; iYGrid <= iYEnd; iYGrid++)
            {
               stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGrid,iYGrid);
               this.a_3502(stFieldGrid);
            }
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491, isCleanTray:Boolean = false) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
   }
}

