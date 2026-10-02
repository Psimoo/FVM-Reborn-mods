package com.aurora.ui.maogoutd.resource.defender.fusionCard.rockfiretower
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class RockFireTowerPoisonGasEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      public function RockFireTowerPoisonGasEffect()
      {
         super();
         a_1279 = -14;
         m_iYDisplayCenterPos = -45;
      }
      
      public static function a_3926() : RockFireTowerPoisonGasEffect
      {
         return PoolManager.getInstance().CheckOutOne(RockFireTowerPoisonGasEffect) as RockFireTowerPoisonGasEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return RockFireTowerPoisonGasEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.m_iStartTime = 0;
         this.addShield(this.stOriginalFieldGrid);
         a_1275 = 1;
         play();
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
            if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
            }
         }
         return true;
      }
      
      protected function clearShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid)
         {
            if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this);
            }
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         this.clearShield(this.stOriginalFieldGrid);
         this.stOriginalFieldGrid = null;
         return true;
      }
   }
}

