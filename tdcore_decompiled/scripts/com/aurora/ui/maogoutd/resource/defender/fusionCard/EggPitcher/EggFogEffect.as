package com.aurora.ui.maogoutd.resource.defender.fusionCard.EggPitcher
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class EggFogEffect extends a_4108
   {
      
      private var hurtCount:int;
      
      private var stOriginalFieldGrid:a_3491;
      
      public function EggFogEffect()
      {
         super();
         m_iYDisplayCenterPos = -89;
         a_1279 = -99;
         alpha = 0.75;
      }
      
      public static function a_3926() : EggFogEffect
      {
         return PoolManager.getInstance().CheckOutOne(EggFogEffect) as EggFogEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return EggFogEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.SetAnimation(0);
         play();
         return true;
      }
      
      public function InitData(fieldGrid:a_3491, hurt:int) : void
      {
         this.stOriginalFieldGrid = fieldGrid;
         this.hurtCount = hurt;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == 2 || a_1273 == 9 || a_1273 == a_1274)
         {
            this.HurtGrid();
         }
         if(a_1273 == a_1274)
         {
            a_3940();
         }
      }
      
      private function HurtGrid() : void
      {
         var stFieldGrid:a_3491 = null;
         var j:int = 0;
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         for(var i:int = this.stOriginalFieldGrid.m_iXGridNo - 1; i <= this.stOriginalFieldGrid.m_iXGridNo + 1; i++)
         {
            for(j = this.stOriginalFieldGrid.m_iYGridNo - 1; j <= this.stOriginalFieldGrid.m_iYGridNo + 1; j++)
            {
               stFieldGrid = this.stOriginalFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,j);
               if(null != stFieldGrid)
               {
                  arrMouveIntruder = stFieldGrid.a_1511.slice();
                  for each(stMouseIntruder in arrMouveIntruder)
                  {
                     if(!stMouseIntruder.isCannotSeeByFighter && (0 == stMouseIntruder.iSpaceState || 2 == stMouseIntruder.iSpaceState))
                     {
                        stMouseIntruder.a_4209(this.hurtCount);
                     }
                  }
               }
            }
         }
      }
      
      public function SetAnimation(frame:int) : void
      {
         if(a_1275 != frame)
         {
            a_1275 = frame;
            gotoAndStop((a_1276[frame] as FrameLabel).frame);
         }
      }
   }
}

