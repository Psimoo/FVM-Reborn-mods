package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.SkyCherryParty.CrispyKite
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class CrispyKiteKillEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      public function CrispyKiteKillEffect()
      {
         super();
         a_1279 = -35;
         m_iYDisplayCenterPos = -22;
      }
      
      public static function a_3926() : CrispyKiteKillEffect
      {
         return PoolManager.getInstance().CheckOutOne(CrispyKiteKillEffect) as CrispyKiteKillEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return CrispyKiteKillEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.m_iStartTime = 0;
         this.addShield(this.stOriginalFieldGrid);
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274 || a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null)
         {
            stFieldGrid.m_stCrispyKiteEffect = this;
            if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
            }
         }
         return true;
      }
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null)
         {
            stFieldGrid.m_stCrispyKiteEffect = null;
            if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().removeChild(this);
            }
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         this.ClearShield(this.stOriginalFieldGrid);
         this.stOriginalFieldGrid = null;
         super.a_3940();
         return true;
      }
   }
}

