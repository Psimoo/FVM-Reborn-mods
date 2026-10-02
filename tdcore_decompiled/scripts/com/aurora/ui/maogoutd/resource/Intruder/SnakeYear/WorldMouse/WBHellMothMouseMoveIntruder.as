package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class WBHellMothMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 100;
      
      private static const ONE_GRID_SPEED:int = 2;
      
      private var isSkillDied:Boolean = false;
      
      private var isBornDad:Boolean = false;
      
      private var stTargetFieldGrid:a_3491;
      
      public function WBHellMothMouseMoveIntruder()
      {
         super();
         m_iYDisplayCenterPos = 25;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBHellMothMouseMoveIntruder) as WBHellMothMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBHellMothMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         this.isSkillDied = false;
         a_1481 = false;
         a_1464 = true;
         a_1463 = true;
         a_1465 = 1;
         this.isBornDad = false;
         this.SetAnimation2(0);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         a_3969(iLifeValue);
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            if(this.isSkillDied)
            {
               this.SetAnimation2(6);
            }
            else
            {
               this.SetAnimation2(1);
            }
            play();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         SetGameMapModePicnicPosition(numOrigXPos);
         if(x <= 0)
         {
            this.stTargetFieldGrid = m_stCurrentFieldGrid;
            this.isSkillDied = true;
            a_3969(iLifeValue);
         }
         return true;
      }
      
      override public function a_4140(iCurrentTime:int) : void
      {
         super.a_4140(iCurrentTime);
         if(this.isBornDad == false)
         {
            if(a_1273 == 17)
            {
               this.isBornDad = true;
               this.stTargetFieldGrid = m_stCurrentFieldGrid;
               this.AddMouse1();
               a_3940();
               return;
            }
            if(a_1273 == 86)
            {
               this.isBornDad = true;
               this.AddMouse2();
               a_3940();
               return;
            }
         }
      }
      
      public function AddMouse1() : void
      {
         var stBaseMoveIntruder:a_4206 = null;
         if(this.stTargetFieldGrid == null)
         {
            return;
         }
         stBaseMoveIntruder = WBHellMoth1MouseMoveIntruder.a_3926();
         if(stBaseMoveIntruder)
         {
            stBaseMoveIntruder.a_1797((1 << 16) + this.stTargetFieldGrid.m_iYGridNo + 60,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 134234321;
            stBaseMoveIntruder.x = x;
            this.stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,this.stTargetFieldGrid,true,BattleLayerDefine.INTRUDER_LAND_TYPE);
         }
      }
      
      public function AddMouse2() : void
      {
         if(this.stTargetFieldGrid == null)
         {
            return;
         }
         var stBaseMoveIntruder:a_4206 = WBHellMoth2MouseMoveIntruder.a_3926();
         if(stBaseMoveIntruder)
         {
            stBaseMoveIntruder.a_1797((1 << 16) + this.stTargetFieldGrid.m_iYGridNo + 60,1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 134234322;
            this.stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,this.stTargetFieldGrid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
            stBaseMoveIntruder.x = 60;
         }
      }
      
      override public function a_4212() : Boolean
      {
         if(m_stCurrentFieldGrid)
         {
            a_3969(900);
         }
         else
         {
            a_1339 = 0;
            a_3940();
         }
         return true;
      }
      
      public function SetAnimation2(animIdx:int) : void
      {
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop2(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
   }
}

