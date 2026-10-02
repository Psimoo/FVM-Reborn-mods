package com.aurora.ui.maogoutd.resource.defender.SnakeYear.yinyangSnake.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.elementSnake.effect.HurtBuff;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class IntruderBloodEffect extends a_4108
   {
      
      private static var ms_stIntruderBloodEffectVector:Array = [];
      
      private var m_iStartTime:int;
      
      public var stTargetIntruder:a_4206;
      
      private var m_Buffs:Vector.<HurtBuff> = new Vector.<HurtBuff>(0);
      
      private var m_TotalPower:Number = 0;
      
      private var m_iDamageTick:int = 10;
      
      public function IntruderBloodEffect()
      {
         super();
         a_1279 = -26;
         m_iYDisplayCenterPos = -16;
      }
      
      public static function a_3926() : IntruderBloodEffect
      {
         return PoolManager.getInstance().CheckOutOne(IntruderBloodEffect) as IntruderBloodEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return IntruderBloodEffectMovie;
      }
      
      override public function SpecialSkillCallBack(... args) : void
      {
         if(args.length != 3)
         {
            return;
         }
         if(args[0] as a_4206)
         {
            this.stTargetIntruder = args[0] as a_4206;
         }
         this.AddBuff(args[1],args[2]);
      }
      
      override public function a_1797(isReseaved:Boolean) : Boolean
      {
         super.a_1797(isReseaved);
         this.m_iStartTime = -1;
         this.m_TotalPower = 0;
         play();
         return true;
      }
      
      public function AddBuff(duration:int, power:Number) : void
      {
         this.m_Buffs.push(new HurtBuff(duration,power));
         this.m_TotalPower += power;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         var buff:HurtBuff = null;
         ++this.m_iStartTime;
         nextFrame();
         if(a_1273 == a_1274 || a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(this.m_iStartTime % this.m_iDamageTick == 0 && this.stTargetIntruder != null)
         {
            this.a_4352(this.m_TotalPower);
         }
         for(var i:* = int(this.m_Buffs.length - 1); i >= 0; i--)
         {
            buff = this.m_Buffs[i];
            if(--buff.duration <= 0)
            {
               this.m_TotalPower -= buff.power;
               this.m_Buffs[i] = this.m_Buffs[this.m_Buffs.length - 1];
               this.m_Buffs.pop();
            }
         }
         if(this.m_Buffs.length == 0)
         {
            this.a_3940();
            return;
         }
      }
      
      private function a_4352(totalPower:Number) : void
      {
         if(this.stTargetIntruder == null)
         {
            return;
         }
         this.stTargetIntruder.a_3969(totalPower);
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         if(this.stTargetIntruder)
         {
            this.stTargetIntruder.m_stGeneralBloodEffect = null;
            this.stTargetIntruder = null;
         }
         this.m_Buffs.length = 0;
         return true;
      }
   }
}

