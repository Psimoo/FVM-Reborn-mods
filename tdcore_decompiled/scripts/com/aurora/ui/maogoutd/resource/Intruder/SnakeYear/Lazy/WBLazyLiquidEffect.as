package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Lazy
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.AddBloodEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4135;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class WBLazyLiquidEffect extends a_4135
   {
      
      public static var m_lUpBloodArr:Array = [];
      
      public var m_TargetFieldGrid:a_3491;
      
      private var m_iRemainTick:int = 0;
      
      private var m_stTargetGrid:a_3491;
      
      public function WBLazyLiquidEffect()
      {
         super();
         a_1279 = -45;
         m_iYDisplayCenterPos = 10;
      }
      
      public static function a_3926() : WBLazyLiquidEffect
      {
         return PoolManager.getInstance().CheckOutOne(WBLazyLiquidEffect) as WBLazyLiquidEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBLazyLiquidEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         m_iOldFieldGridType = -1;
         timerout = -1;
         a_1283 = isReversed;
         visible = true;
         gotoAndStop(1);
         stop();
         ShowPlayAnimation(0,1);
         return true;
      }
      
      public function InitData(grid:a_3491, remainSeconds:int = 20) : void
      {
         this.m_stTargetGrid = grid;
         this.m_iRemainTick = remainSeconds * 10;
         grid.tagCom.AddTag(140);
         play();
      }
      
      protected function BurnFieldGridMoveIntruder(stFieldGrid:a_3491) : void
      {
         var stBaseMoveIntruder:a_4206 = null;
         var stAddBloodEffect:AddBloodEffect = null;
         if(stFieldGrid == null)
         {
            return;
         }
         for each(stBaseMoveIntruder in stFieldGrid.a_1511)
         {
            stBaseMoveIntruder.a_4208(b_182.a_436,6);
            if(stBaseMoveIntruder.IsBossIntruder == false && m_lUpBloodArr.indexOf(stBaseMoveIntruder.a_1459) == -1)
            {
               stBaseMoveIntruder.a_3969(-30000);
               m_lUpBloodArr.push(stBaseMoveIntruder.a_1459);
               stAddBloodEffect = AddBloodEffect.a_3926();
               stAddBloodEffect.a_1797(false);
               stAddBloodEffect.x = stBaseMoveIntruder.x;
               stAddBloodEffect.y = stBaseMoveIntruder.y;
               this.m_stTargetGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
            }
         }
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         if(this.m_stTargetGrid != null && !this.m_stTargetGrid.tagCom.HasTag(140))
         {
            this.a_3940();
            return;
         }
         if(this.m_iRemainTick > 0)
         {
            --this.m_iRemainTick;
            if(this.m_iRemainTick == 0)
            {
               this.SetAnimation(2);
            }
         }
         this.BurnFieldGridMoveIntruder(this.m_stTargetGrid);
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
      
      public function SetAnimation(animIdx:int) : void
      {
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      override public function a_3940() : Boolean
      {
         if(this.m_stTargetGrid != null)
         {
            this.m_stTargetGrid.tagCom.RemoveTag(140);
            this.m_stTargetGrid.m_stMouseEarthHole = null;
            this.m_stTargetGrid = null;
         }
         super.a_3940();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
   }
}

