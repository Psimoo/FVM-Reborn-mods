package com.aurora.ui.maogoutd.resource.defender.HorseYear.maka
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.EffectManager;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class MakaSecondDefense extends a_3976
   {
      
      private var m_stTiemr:Timer;
      
      private var stBoomEffect:BaseGameEffect;
      
      public function MakaSecondDefense()
      {
         super();
         a_1337 = -7;
         a_1338 = 13;
         a_1095 = 50;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : MakaSecondDefense
      {
         return PoolManager.getInstance().CheckOutOne(MakaSecondDefense) as MakaSecondDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return MakaSecondDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.play();
         if(m_bServerIssued)
         {
            this.stBoomEffect = EffectManager.getInstance().CheckOutEffect(MakaUp3Movie);
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.stBoomEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,stFieldGrid);
            if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.stBoomEffect,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
            }
            this.stBoomEffect.SetAnimationOnce2Loop(0,1);
            this.stBoomEffect.x = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            this.stBoomEffect.y = (stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
         }
         return super.a_1797(stFieldGrid);
      }
      
      override public function a_3940() : Boolean
      {
         if(this.stBoomEffect != null)
         {
            this.stBoomEffect.SetAnimation(2,true);
         }
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         return super.a_3940();
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
         if(a_1273 == 11)
         {
            this.WakeUpCardsInRange();
         }
         if(a_1273 == a_1274)
         {
            if(this.parent)
            {
               this.parent.removeChild(this);
            }
            this.a_3940();
            return;
         }
      }
      
      private function WakeUpCardsInRange() : void
      {
         MakaDefence.WakeUpCardsInRange(a_1334,5,7,m_iSkillDegree,true);
      }
      
      override protected function a_3964() : int
      {
         return MakaDefence.a_3964(a_1094);
      }
   }
}

