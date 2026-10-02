package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.FallenEden
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class FallenEdenAppleShadowEffect extends a_4108
   {
      
      public var stFieldGrid:a_3491;
      
      public function FallenEdenAppleShadowEffect()
      {
         super();
      }
      
      public static function a_3926() : FallenEdenAppleShadowEffect
      {
         return PoolManager.getInstance().CheckOutOne(FallenEdenAppleShadowEffect) as FallenEdenAppleShadowEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return FallenEdenAppleShadowEffectMovie;
      }
      
      override public function a_1797(isReseaved:Boolean) : Boolean
      {
         super.a_1797(isReseaved);
         PlayAnimation(0);
         a_1279 = -45;
         m_iYDisplayCenterPos = -29;
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == a_1274)
         {
            stop();
            this.CreateApple();
         }
      }
      
      private function CreateApple() : void
      {
         var apple:WBRedApple2MoveIntruder = WBRedApple2MoveIntruder.a_3926() as WBRedApple2MoveIntruder;
         apple.a_1797(0,-1);
         apple.shadow = this;
         apple.m_stMoveIntruderTypeID = 8388608;
         apple.x = a_3491.a_1080 * (this.stFieldGrid.m_iXGridNo + 0.5);
         this.stFieldGrid.m_stCurrentBattbleFieldView.a_3459(apple,this.stFieldGrid);
         this.stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(apple,BattleLayerDefine.INTRUDER_LAND_TYPE,this.stFieldGrid);
         apple.y = -100;
         apple.targetPosY = a_3491.a_1081 * (this.stFieldGrid.m_iYGridNo + 0.5);
      }
   }
}

