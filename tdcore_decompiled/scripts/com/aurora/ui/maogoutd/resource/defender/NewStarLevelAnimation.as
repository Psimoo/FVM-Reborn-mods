package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   
   public class NewStarLevelAnimation extends BaseGameEffect
   {
      
      public function NewStarLevelAnimation()
      {
         super();
      }
      
      override public function PlayAnimation(startIndex:int) : void
      {
         gotoAndStop(startIndex);
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         a_1279 = -3;
         m_iYDisplayCenterPos = 1;
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         return true;
      }
   }
}

