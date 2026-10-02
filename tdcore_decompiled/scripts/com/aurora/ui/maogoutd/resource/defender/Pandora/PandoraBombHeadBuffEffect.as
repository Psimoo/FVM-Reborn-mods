package com.aurora.ui.maogoutd.resource.defender.Pandora
{
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   
   public class PandoraBombHeadBuffEffect extends BaseGameEffect
   {
      
      private static const MAX_HURT_PER_TICK:int = 1000000;
      
      private var holderMouse:a_4206;
      
      public var power:Number;
      
      private var m_iStartTime:int;
      
      public function PandoraBombHeadBuffEffect()
      {
         super();
      }
      
      public function InitData(mouse:a_4206, iHurtPower:int) : void
      {
         this.holderMouse = mouse;
         this.power = iHurtPower;
         this.m_iStartTime = -1;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         super.a_4109(a_4730);
         ++this.m_iStartTime;
         if(this.m_iStartTime % 10 == 0)
         {
            this.UpdateBuff();
         }
      }
      
      public function UpdateBuff() : void
      {
         if(!this.holderMouse || this.holderMouse.iLifeValue <= 0)
         {
            return;
         }
         var totalPower:int = int(this.holderMouse.iInitialLifeValue * 0.03 + this.power);
         if(totalPower > MAX_HURT_PER_TICK)
         {
            totalPower = MAX_HURT_PER_TICK;
         }
         this.holderMouse.a_3969(totalPower);
      }
      
      override public function a_3940() : Boolean
      {
         this.holderMouse = null;
         this.power = 0;
         super.a_3940();
         return true;
      }
   }
}

