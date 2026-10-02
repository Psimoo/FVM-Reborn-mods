package com.aurora.ui.maogoutd.resource.defender.HorseYear.luban
{
   import a_4752.a_2036;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   
   public class LuBanUpBuffEffect extends BaseGameEffect
   {
      
      public function LuBanUpBuffEffect()
      {
         super();
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         super.a_4109(a_4730);
         this.UpdateBuff();
      }
      
      public function UpdateBuff() : void
      {
         var count:int = a_2036.getInstance().tagCom.GetSum(LuBanDefence.LUABAN_FINAL_TAG);
         if(count < 8)
         {
            SetAnimation(0);
         }
         else
         {
            SetAnimation(1);
         }
      }
   }
}

