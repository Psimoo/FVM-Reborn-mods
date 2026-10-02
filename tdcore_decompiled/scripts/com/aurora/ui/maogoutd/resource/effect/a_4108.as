package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.EffectManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class a_4108 extends a_3909
   {
      
      public var m_MoveState:Boolean;
      
      public function a_4108()
      {
         super();
      }
      
      public function a_1797(isReversed:Boolean) : Boolean
      {
         a_1283 = isReversed;
         visible = true;
         gotoAndStop(1);
         this.stop();
         return true;
      }
      
      public function play() : void
      {
         EffectManager.getInstance().Add(this);
      }
      
      public function stop() : void
      {
         EffectManager.getInstance().Remove(this);
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         this.stop();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      public function Tick(a_4730:Event) : void
      {
         this.a_4109(a_4730);
      }
      
      protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
      
      public function SpecialSkillCallBack(... args) : void
      {
      }
      
      public function SetReversed(isReversed:Boolean) : void
      {
         if(a_1283 == isReversed)
         {
            return;
         }
         a_1283 = isReversed;
         gotoAndStop(a_1273);
      }
      
      public function PlayAnimation(startIndex:int) : void
      {
         if(a_1275 != startIndex)
         {
            a_1275 = startIndex;
            gotoAndStop((a_1276[startIndex] as FrameLabel).frame);
         }
      }
      
      public function ShowPlayAnimation(startIndex:int, loopIndex:int) : void
      {
         if(a_1275 != loopIndex)
         {
            a_1275 = loopIndex;
            gotoAndStop((a_1276[startIndex] as FrameLabel).frame);
         }
      }
   }
}

