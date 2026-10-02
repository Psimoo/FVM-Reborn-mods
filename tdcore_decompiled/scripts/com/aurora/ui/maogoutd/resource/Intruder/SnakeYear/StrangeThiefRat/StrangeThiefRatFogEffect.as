package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.StrangeThiefRat
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class StrangeThiefRatFogEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      public function StrangeThiefRatFogEffect()
      {
         super();
         a_1279 = -49.5;
         m_iYDisplayCenterPos = -48.5;
      }
      
      public static function a_3926() : StrangeThiefRatFogEffect
      {
         return PoolManager.getInstance().CheckOutOne(StrangeThiefRatFogEffect) as StrangeThiefRatFogEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return StrangeThiefRatFogEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.m_iStartTime = 0;
         a_1275 = 1;
         gotoAndStop((a_1276[0] as FrameLabel).frame);
         if(this.stOriginalFieldGrid)
         {
            this.stOriginalFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(this);
         }
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         ++this.m_iStartTime;
         if(this.m_iStartTime == 95)
         {
            a_1275 = 2;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
         }
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         else if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
      
      override public function a_3940() : Boolean
      {
         var stVector:Array = null;
         super.a_3940();
         if(this.stOriginalFieldGrid)
         {
            stVector = this.stOriginalFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray;
            if(-1 != stVector.indexOf(this))
            {
               stVector.splice(stVector.indexOf(this),1);
            }
         }
         return true;
      }
   }
}

