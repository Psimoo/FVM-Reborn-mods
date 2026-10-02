package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class WBHellMoth1MouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 50000;
      
      private static const MAX_INJURED_LIFE:int = 20000;
      
      private static const ONE_GRID_SPEED:int = 0;
      
      private var isSkilled:Boolean = false;
      
      private var isBornDad:Boolean = false;
      
      private var stTargetFieldGrid:a_3491;
      
      private var tick:int = 0;
      
      public function WBHellMoth1MouseMoveIntruder()
      {
         super();
         m_iYDisplayCenterPos = 25;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBHellMoth1MouseMoveIntruder) as WBHellMoth1MouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBHellMoth1MouseMoveIntruderMovie;
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
         a_1481 = false;
         a_1464 = true;
         BoomIsReduceLife = true;
         a_1465 = 0;
         this.isSkilled = false;
         this.isBornDad = false;
         this.tick = 0;
         this.SetAnimation(2,1);
         if(a_1283)
         {
            a_1463 = true;
         }
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            this.SetAnimation(2,1);
         }
         else
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            if(this.isSkilled)
            {
               this.SetAnimation(5);
            }
            else
            {
               this.SetAnimation(4);
            }
            play();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         ++this.tick;
         if(this.tick == 150)
         {
            this.stTargetFieldGrid = m_stCurrentFieldGrid;
            this.isSkilled = true;
            a_3969(iLifeValue);
         }
         SetGameMapModePicnicPosition(numOrigXPos);
         return true;
      }
      
      override public function a_4140(iCurrentTime:int) : void
      {
         super.a_4140(iCurrentTime);
         if(a_1273 == 53)
         {
            a_3940();
            return;
         }
         if(this.isBornDad == false)
         {
            if(a_1273 == 69)
            {
               this.isBornDad = true;
               this.AddMouse2();
               a_3940();
               return;
            }
         }
      }
      
      public function AddMouse2() : void
      {
         var stBaseMoveIntruder:a_4206 = null;
         if(this.stTargetFieldGrid == null)
         {
            return;
         }
         stBaseMoveIntruder = WBHellMoth2MouseMoveIntruder.a_3926();
         if(stBaseMoveIntruder)
         {
            stBaseMoveIntruder.a_1797((1 << 16) + this.stTargetFieldGrid.m_iYGridNo + 60,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 134234322;
            stBaseMoveIntruder.x = x;
            this.stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,this.stTargetFieldGrid,false,BattleLayerDefine.INTRUDER_SKY_TYPE);
         }
      }
      
      public function InDamage() : Boolean
      {
         return a_1339 > 0 && a_1339 < MAX_INJURED_LIFE;
      }
      
      public function SetAnimation(animIdx:int, addIdx:int = 0) : void
      {
         if(this.InDamage())
         {
            animIdx += addIdx;
         }
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int, addIdx:int = 0) : void
      {
         if(this.InDamage())
         {
            onceAnimIdx += addIdx;
            loopAnimIdx += addIdx;
         }
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      public function SetAnimationOnce2Loop2(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
   }
}

