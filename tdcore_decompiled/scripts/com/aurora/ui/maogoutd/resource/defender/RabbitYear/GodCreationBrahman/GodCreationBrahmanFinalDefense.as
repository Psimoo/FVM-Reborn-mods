package com.aurora.ui.maogoutd.resource.defender.RabbitYear.GodCreationBrahman
{
   import a_4728.a_1778;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.DefensePlaceHelper;
   import com.aurora.ui.maogoutd.game.Util.BattleVOUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.EffectManager;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class GodCreationBrahmanFinalDefense extends a_3976
   {
      
      private var m_stTiemr:Timer;
      
      private var m_IsTrigger:Boolean;
      
      public function GodCreationBrahmanFinalDefense()
      {
         super();
         a_1095 = GodCreationBrahmanDefine.DEFENSE_PRICE;
         a_1279 = -5;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : GodCreationBrahmanFinalDefense
      {
         return PoolManager.getInstance().CheckOutOne(GodCreationBrahmanFinalDefense) as GodCreationBrahmanFinalDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return GodCreationBrahmanFinalDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.m_IsTrigger = false;
         this.visible = true;
         a_1339 = 1000;
         if(m_bServerIssued)
         {
            if(!this.m_stTiemr.hasEventListener(TimerEvent.TIMER))
            {
               this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
            }
            this.StartFrameTimer();
         }
         return true;
      }
      
      override public function finalizeInitialization() : void
      {
         super.finalizeInitialization();
         if(m_bServerIssued)
         {
            if(stFieldGrid.m_stFinalBrahmaDefense)
            {
               stFieldGrid.m_stFinalBrahmaDefense.a_3940();
            }
            stFieldGrid.m_stFinalBrahmaDefense = this;
            if(m_IsCaclueCoolDown == 0)
            {
               this.CenterBoomSkill();
            }
            if(!m_iBeOtherPlaced && stFieldGrid == DefensePlaceHelper.getInstance().m_FinalBrahmaTriggerGrid)
            {
               this.m_IsTrigger = true;
               DefensePlaceHelper.getInstance().PostFinalBrahmaStateChange(stFieldGrid.m_stCurrentBattbleFieldView);
            }
         }
      }
      
      override protected function a_3964() : int
      {
         return GodCreationBrahmanDefine.a_3964(a_1094);
      }
      
      override public function a_3940() : Boolean
      {
         if(m_bServerIssued)
         {
            this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
            this.StopFrameTimer();
            stFieldGrid.m_stFinalBrahmaDefense = null;
            delete stFieldGrid.m_dicCannotAddCard["finalBrahmaPlace"];
         }
         return super.a_3940();
      }
      
      public function StartFrameTimer() : void
      {
         this.m_stTiemr.start();
      }
      
      public function StopFrameTimer() : void
      {
         this.m_stTiemr.stop();
         this.m_stTiemr.reset();
      }
      
      override public function SpecialSkillCallBack(... args) : void
      {
         if(args[0] == 1)
         {
            if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
      }
      
      private function a_4003(a_4730:Event) : void
      {
         var stAurDataEvent:a_1778 = null;
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == 23)
         {
            if(a_1336)
            {
               a_1336.visible = false;
            }
            if(Boolean(a_1334.m_stCurrentBattbleFieldView.isOwnBattleField && root) && Boolean(!m_iBeOtherPlaced) && this.m_IsTrigger)
            {
               stAurDataEvent = new a_1778("GameCloseCopyCardProcess");
               stAurDataEvent.dataObject = [a_1098,a_1334.m_iInitialXGridNo + "_" + a_1334.m_iInitialYGridNo + "_" + m_iPlaceTimeIntervals];
               root.dispatchEvent(stAurDataEvent);
            }
            this.skillAddCard(1);
         }
         if(a_1273 == a_1274 - 3)
         {
            a_3969(iLifeValue);
         }
      }
      
      private function skillAddCard(skillTimes:int) : void
      {
         if(a_1334 == null)
         {
            return;
         }
         var cardID:int = BattleVOUtil.m_GodCreationFinalCopyCard;
         if(cardID <= 0 || m_iBeOtherPlaced)
         {
            return;
         }
         GodCreationBrahmanPlaceSkill.CopyCardSkill(cardID,skillTimes,a_1334,this.AddBornEffect);
      }
      
      private function AddBornEffect(stFieldGrid:a_3491) : void
      {
         var effect:GodCreationBrahmanFinalBornEffect = null;
         if(stFieldGrid)
         {
            effect = GodCreationBrahmanFinalBornEffect.a_3926();
            effect.a_1797(false);
            effect.x = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            effect.y = (stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_TOP_TYPE,stFieldGrid);
            effect.play();
         }
      }
      
      private function CenterBoomSkill() : void
      {
         var stEffect:GCBFinalBoomEffect = null;
         if(!stFieldGrid)
         {
            return;
         }
         stEffect = EffectManager.getInstance().CheckOutOne(GCBFinalBoomEffect,GCBFinalBoomEffectMovie) as GCBFinalBoomEffect;
         stEffect.SetAnimation(0,true);
         stEffect.InitData(stFieldGrid);
         var numShotXpos:Number = 34;
         if(a_1283)
         {
            numShotXpos = -numShotXpos;
         }
         stEffect.x = this.x + numShotXpos;
         stEffect.y = this.y + 44;
         stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,stFieldGrid);
      }
      
      override protected function a_3965() : int
      {
         return GodCreationBrahmanDefine.a_3965(a_1094);
      }
   }
}

