package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class AquariusBoomEffect
   {
      
      private var m_stTiemr:Timer;
      
      protected var a_1422:Vector.<a_4139>;
      
      protected var a_1423:int = 0;
      
      public function AquariusBoomEffect()
      {
         super();
         this.m_stTiemr = new Timer(50);
      }
      
      public static function a_3926() : AquariusBoomEffect
      {
         return PoolManager.getInstance().CheckOutOne(AquariusBoomEffect) as AquariusBoomEffect;
      }
      
      public function a_1797(param1:int, param2:int, param3:Sprite, param4:Boolean = false, param5:int = 0) : Boolean
      {
         var _loc_9:int = 0;
         var _loc_10:* = undefined;
         if(param1 < 0 || param1 >= BattleFieldView.a_1011 || param2 < 0 || param2 >= BattleFieldView.a_1012)
         {
            return false;
         }
         var _loc_4:* = param2 - 2 - param5 < 0 ? 0 : param2 - 2 - param5;
         var _loc_5:* = param1 - 2 - param5 < 0 ? 0 : param1 - 2 - param5;
         var _loc_6:* = param2 + 2 + param5 >= BattleFieldView.a_1012 ? BattleFieldView.a_1012 - 1 : param2 + 2 + param5;
         var _loc_7:* = param1 + 2 + param5 >= BattleFieldView.a_1011 ? BattleFieldView.a_1011 - 1 : param1 + 2 + param5;
         if(param4)
         {
            _loc_4 = 0;
            _loc_6 = BattleFieldView.a_1012 - 1;
         }
         var _loc_8:* = _loc_6 + _loc_7 - _loc_4 - _loc_5 + 1;
         this.a_1422 = new Vector.<a_4139>(_loc_8);
         _loc_9 = 0;
         _loc_10 = _loc_4;
         while(_loc_10 <= _loc_6)
         {
            this.a_1422[_loc_9] = a_4139.a_3926();
            this.a_1422[_loc_9].a_1797(Math.abs(param1 - _loc_10));
            this.a_1422[_loc_9].x = a_3491.a_1080 * param1;
            this.a_1422[_loc_9].y = a_3491.a_1080 * _loc_10;
            param3.addChild(this.a_1422[_loc_9]);
            this.a_1422[_loc_9].visible = false;
            _loc_9++;
            _loc_10++;
         }
         var _loc_11:* = _loc_5;
         while(_loc_11 <= _loc_7)
         {
            this.a_1422[_loc_9] = a_4139.a_3926();
            this.a_1422[_loc_9].a_1797(Math.abs(param1 - _loc_11));
            this.a_1422[_loc_9].x = a_3491.a_1080 * _loc_11;
            this.a_1422[_loc_9].y = a_3491.a_1080 * param2;
            param3.addChild(this.a_1422[_loc_9]);
            this.a_1422[_loc_9].visible = false;
            _loc_9++;
            _loc_11++;
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
         var _loc_1:int = 0;
         while(Boolean(this.a_1422) && _loc_1 < this.a_1422.length)
         {
            if(Boolean(this.a_1422) && Boolean(this.a_1422[_loc_1]))
            {
               this.a_1422[_loc_1].a_3940();
               this.a_1422[_loc_1] = null;
            }
            _loc_1++;
         }
         this.a_1422 = null;
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      private function a_4003(a_4730:Event) : void
      {
         var _loc_2:int = 0;
         while(Boolean(this.a_1422) && _loc_2 < this.a_1422.length)
         {
            this.a_1422[_loc_2].a_4140(this.a_1423);
            _loc_2++;
         }
         if(this.a_1423 > 18)
         {
            this.a_3940();
         }
         var _loc_3:AquariusBoomEffect = this;
         var _loc_4:* = this.a_1423 + 1;
         _loc_3.a_1423 = _loc_4;
      }
   }
}

