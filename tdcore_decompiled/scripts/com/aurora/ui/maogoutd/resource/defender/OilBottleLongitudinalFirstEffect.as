package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4139;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class OilBottleLongitudinalFirstEffect
   {
      
      private var m_stTiemr:Timer;
      
      protected var a_1422:Vector.<a_4139>;
      
      protected var a_1423:int = 0;
      
      public function OilBottleLongitudinalFirstEffect()
      {
         super();
         this.m_stTiemr = new Timer(50);
      }
      
      public static function a_3926() : OilBottleLongitudinalFirstEffect
      {
         return PoolManager.getInstance().CheckOutOne(OilBottleLongitudinalFirstEffect) as OilBottleLongitudinalFirstEffect;
      }
      
      public function a_1797(iOilBattleXPosIndex:int, iOilBattleYPosIndex:int, stContainer:a_3491) : Boolean
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
            this.a_1422[i].y = a_3491.a_1081 * i;
            stContainer.m_stCurrentBattbleFieldView.AddToBattleView(this.a_1422[i],BattleLayerDefine.EFFECTS_BASE_TYPE,stContainer);
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

