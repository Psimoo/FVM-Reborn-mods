package com.aurora.ui.maogoutd.resource.defender.PigYear.GuiHuaJiu
{
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   
   public class GuiHuaJiuDrunkBuffEffect extends BaseGameEffect
   {
      
      public function GuiHuaJiuDrunkBuffEffect()
      {
         super();
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            gotoAndStop(1);
         }
      }
      
      override public function a_3940() : Boolean
      {
         return super.a_3940();
      }
   }
}

