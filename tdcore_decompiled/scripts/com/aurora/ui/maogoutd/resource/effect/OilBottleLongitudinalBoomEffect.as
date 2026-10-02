package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class OilBottleLongitudinalBoomEffect
   {
      
      private var m_stTiemr:Timer;
      
      protected var a_1422:Vector.<a_4139>;
      
      protected var a_1423:int = 0;
      
      public function OilBottleLongitudinalBoomEffect()
      {
         super();
         this.m_stTiemr = new Timer(50);
      }
      
      public static function a_3926() : OilBottleLongitudinalBoomEffect
      {
         return PoolManager.getInstance().CheckOutOne(OilBottleLongitudinalBoomEffect) as OilBottleLongitudinalBoomEffect;
      }
      
      public function a_1797(iOilBattleXPosIndex:int, iOilBattleYPosIndex:int, stContainer:Sprite) : Boolean
      {
         var i:int = 0;
         if(iOilBattleXPosIndex < 0 || iOilBattleXPosIndex >= BattleFieldView.a_1011 || iOilBattleYPosIndex < 0 || iOilBattleYPosIndex >= BattleFieldView.a_1012)
         {
            return false;
         }
         this.a_1422 = new Vector.<a_4139>(BattleFieldView.a_1012);
         for(i = 0; i < BattleFieldView.a_1012; i++)
         {
            this.a_1422[i] = a_4139.a_3926();
            this.a_1422[i].a_1797(Math.abs(iOilBattleXPosIndex - i));
            this.a_1422[i].x = a_3491.a_1080 * iOilBattleXPosIndex;
            this.a_1422[i].y = a_3491.a_1080 * i;
            stContainer.addChild(this.a_1422[i]);
            this.a_1422[i].visible = false;
         }
         this.a_1423 = 0;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.start();
         return true;
      }
      
      protected function a_3940() : Boolean
      {
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         for(var i:int = 0; i < BattleFieldView.a_1012; i++)
         {
            if(Boolean(this.a_1422) && Boolean(this.a_1422[i]))
            {
               this.a_1422[i].a_3940();
               this.a_1422[i] = null;
            }
         }
         this.a_1422 = null;
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      private function a_4003(a_4730:Event) : void
      {
         for(var i:int = 0; i < BattleFieldView.a_1012; i++)
         {
            this.a_1422[i].a_4140(this.a_1423);
         }
         if(this.a_1423 > 18)
         {
            this.a_3940();
         }
         ++this.a_1423;
      }
   }
}

