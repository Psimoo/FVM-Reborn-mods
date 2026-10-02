package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.FallenEden
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Arrogant.WBRedAppleMoveIntruder;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class FallenEdenAppleFireEffect extends a_4108
   {
      
      public var stFieldGrid:a_3491;
      
      private var leaveTime:int = 50;
      
      public function FallenEdenAppleFireEffect()
      {
         super();
      }
      
      public static function a_3926() : FallenEdenAppleFireEffect
      {
         return PoolManager.getInstance().CheckOutOne(FallenEdenAppleFireEffect) as FallenEdenAppleFireEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return FallenEdenAppleFireEffectMovie;
      }
      
      override public function a_1797(isReseaved:Boolean) : Boolean
      {
         super.a_1797(isReseaved);
         PlayAnimation(0);
         this.leaveTime = 50;
         a_1279 = -40;
         m_iYDisplayCenterPos = -40;
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         --this.leaveTime;
         if(this.leaveTime == 0)
         {
            PlayAnimation(1);
         }
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == a_1274)
         {
            this.CreateApple();
            a_3940();
         }
      }
      
      private function CreateApple() : void
      {
         var apple:WBRedAppleMoveIntruder = null;
         if(!BattleDestroyUtil.DestroyOneGrid(this.stFieldGrid))
         {
            return;
         }
         apple = WBRedAppleMoveIntruder.a_3926() as WBRedAppleMoveIntruder;
         apple.a_1797(0,-1);
         apple.addShield(this.stFieldGrid);
         apple.m_stMoveIntruderTypeID = 8388608;
         apple.x = a_3491.a_1080 * (this.stFieldGrid.m_iXGridNo + 0.5);
         apple.y = a_3491.a_1081 * (this.stFieldGrid.m_iYGridNo + 0.5);
         this.stFieldGrid.m_stCurrentBattbleFieldView.a_3459(apple,this.stFieldGrid);
         this.stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(apple,BattleLayerDefine.INTRUDER_LAND_TYPE,this.stFieldGrid);
      }
   }
}

