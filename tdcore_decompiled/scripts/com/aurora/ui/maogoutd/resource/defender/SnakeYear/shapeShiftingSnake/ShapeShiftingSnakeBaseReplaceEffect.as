package com.aurora.ui.maogoutd.resource.defender.SnakeYear.shapeShiftingSnake
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class ShapeShiftingSnakeBaseReplaceEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      public function ShapeShiftingSnakeBaseReplaceEffect()
      {
         super();
         a_1279 = -51;
         m_iYDisplayCenterPos = -17;
      }
      
      public static function a_3926() : ShapeShiftingSnakeBaseReplaceEffect
      {
         return PoolManager.getInstance().CheckOutOne(ShapeShiftingSnakeBaseReplaceEffect) as ShapeShiftingSnakeBaseReplaceEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return ShapeShiftingSnakeBaseReplaceEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.m_iStartTime = 0;
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         if(this.stOriginalFieldGrid != null && Boolean(this.stOriginalFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap()))
         {
            this.stOriginalFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this);
         }
         return true;
      }
   }
}

