package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class HamburgerFogEffect extends a_4108
   {
      
      private var stOriginalFieldGrid:a_3491;
      
      private var m_iTick:int = 0;
      
      public function HamburgerFogEffect()
      {
         super();
         a_1279 = -55;
         m_iYDisplayCenterPos = -120;
         alpha = 0.6;
      }
      
      public static function a_3926() : HamburgerFogEffect
      {
         return PoolManager.getInstance().CheckOutOne(HamburgerFogEffect) as HamburgerFogEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return HamburgerFogEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.SetAnimation(0);
         play();
         return true;
      }
      
      public function InitData(fieldGrid:a_3491) : void
      {
         this.stOriginalFieldGrid = fieldGrid;
         this.m_iTick = 0;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         ++this.m_iTick;
         if(this.m_iTick == 5 || this.m_iTick == 15 || this.m_iTick == 25 || this.m_iTick == 35 || this.m_iTick == 45)
         {
            this.HurtGrid();
         }
         if(this.m_iTick == 50)
         {
            this.SetAnimation(1);
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
         for(var i:int = this.stOriginalFieldGrid.m_iXGridNo - 2; i <= this.stOriginalFieldGrid.m_iXGridNo + 2; i++)
         {
            for(j = this.stOriginalFieldGrid.m_iYGridNo - 2; j <= this.stOriginalFieldGrid.m_iYGridNo + 2; j++)
            {
               stFieldGrid = this.stOriginalFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,j);
               if(null != stFieldGrid)
               {
                  arrMouveIntruder = stFieldGrid.a_1511.slice();
                  for each(stMouseIntruder in arrMouveIntruder)
                  {
                     if(!stMouseIntruder.isCannotSeeByFighter && (0 == stMouseIntruder.iSpaceState || 2 == stMouseIntruder.iSpaceState))
                     {
                        stMouseIntruder.a_4209(30);
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

