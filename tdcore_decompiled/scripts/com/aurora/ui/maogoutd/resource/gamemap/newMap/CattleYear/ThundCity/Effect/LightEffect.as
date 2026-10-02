package com.aurora.ui.maogoutd.resource.gamemap.newMap.CattleYear.ThundCity.Effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.Desert.TribeChief.DizzinessEffect;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class LightEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iStartTime:int;
      
      public var stTargetFieldGrid:a_3491 = null;
      
      public var stCallBackFunc:Function = null;
      
      public var stSleepTime:int = 0;
      
      private var m_iWaitTime:int;
      
      public function LightEffect()
      {
         super();
         a_1279 = -0.5 * 70 - 6;
         m_iYDisplayCenterPos = -0.5 * 230 - 65;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : LightEffect
      {
         return PoolManager.getInstance().CheckOutOne(LightEffect) as LightEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return LightEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.play();
         this.m_iStartTime = 0;
         return true;
      }
      
      public function get WaitTime() : int
      {
         return this.m_iWaitTime;
      }
      
      public function set WaitTime(iWaitTime:int) : void
      {
         this.m_iWaitTime = iWaitTime;
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      public function play() : void
      {
         this.m_stTiemr.start();
      }
      
      public function stop() : void
      {
         this.m_stTiemr.stop();
      }
      
      private function a_4003(a_4730:Event) : void
      {
         nextFrame();
         trace("m_iCurrentFrame::" + a_1273);
         if(a_1273 == 6)
         {
            this.LightHitFieldGridDefense(this.stTargetFieldGrid);
         }
         if(a_1273 == a_1274)
         {
            if(this.stCallBackFunc != null)
            {
               this.stCallBackFunc(this.stTargetFieldGrid);
            }
            this.a_3940();
         }
      }
      
      protected function LightHitFieldGridDefense(stFieldGrid:a_3491) : Boolean
      {
         var stSleepingEffect:DizzinessEffect = null;
         if(stFieldGrid == null)
         {
            return false;
         }
         if(!stFieldGrid.m_isCanBrokeByLight)
         {
            return false;
         }
         if(null != stFieldGrid.m_stAttackFighter)
         {
            stFieldGrid.m_stAttackFighter.a_3958(this.stSleepTime * 20);
            stSleepingEffect = DizzinessEffect.a_3926();
            stSleepingEffect.a_1797(false);
            stSleepingEffect.a_3958 = this.stSleepTime;
            stSleepingEffect.x = stFieldGrid.m_stAttackFighter.x + stFieldGrid.m_stAttackFighter.width * 0.4 - 30;
            stSleepingEffect.y = stFieldGrid.m_stAttackFighter.y - 10;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stSleepingEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stFieldGrid);
         }
         else if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         return true;
      }
   }
}

