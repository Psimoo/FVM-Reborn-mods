package com.aurora.ui.maogoutd.resource.defender.SnakeYear.SnakeWine.Effect.Up
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class UpGradeGoldEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var m_Level:int;
      
      public var m_stTargetField:a_3491;
      
      public function UpGradeGoldEffect()
      {
         super();
         a_1279 = -65;
         m_iYDisplayCenterPos = -145;
      }
      
      public static function a_3926() : UpGradeGoldEffect
      {
         return PoolManager.getInstance().CheckOutOne(UpGradeGoldEffect) as UpGradeGoldEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return UpGradeGoldEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         gotoAndStop((a_1276[this.m_Level - 1] as FrameLabel).frame);
         this.m_iStartTime = 0;
         this.addShield(this.m_stTargetField);
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == 17 || a_1273 == 34 || a_1273 == 52)
         {
            this.a_3940();
         }
      }
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null && Boolean(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap()))
         {
            stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this);
         }
         return true;
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         this.ClearShield(this.m_stTargetField);
         this.m_stTargetField = null;
         return true;
      }
   }
}

