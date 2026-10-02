package com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldTimeChronos
{
   import a_4728.a_1778;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.FieldGridUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class GoldTimeChronosFirstTransDefense extends a_3976
   {
      
      private var m_coolDownCard:Array = new Array();
      
      private var m_stTiemr:Timer;
      
      private var m_BottomEffect:a_4108;
      
      private var m_coolTimes:int;
      
      private var m_SkillTick:int;
      
      private var m_AliveTime:int;
      
      private var m_BoomTime:int;
      
      private var m_Range:int;
      
      private var m_initTime:int;
      
      private var m_lastGotoAndStopFrame:int;
      
      public function GoldTimeChronosFirstTransDefense()
      {
         a_1271 = true;
         super();
         a_1338 = -30;
         a_1337 = 0;
         a_1095 = GoldTimeChronosDefence.DEFENSE_PRICE;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : GoldTimeChronosFirstTransDefense
      {
         return PoolManager.getInstance().CheckOutOne(GoldTimeChronosFirstTransDefense) as GoldTimeChronosFirstTransDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldTimeChronosFirstTransDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = GoldTimeChronosDefence.MAX_LIFE_VALUE;
         if(m_bServerIssued)
         {
            if(!this.m_stTiemr.hasEventListener(TimerEvent.TIMER))
            {
               this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
            }
            this.m_coolTimes = this.m_SkillTick = 0;
            this.m_BoomTime = 6;
            this.visible = false;
            this.m_initTime = this.m_BoomTime + GoldTimeChronosDefence.a_3966(m_iSkillDegree);
            this.m_AliveTime = -1;
            this.m_Range = 2;
            this.play();
            if(stFieldGrid)
            {
               stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(this);
            }
            this.AddBoomEffect();
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return GoldTimeChronosDefence.a_3964(a_1094);
      }
      
      public function play() : void
      {
         this.m_stTiemr.start();
      }
      
      public function stop() : void
      {
         this.m_stTiemr.stop();
      }
      
      override public function a_3940() : Boolean
      {
         var stVector:Array = null;
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         if(m_bServerIssued && stFieldGrid != null)
         {
            stVector = stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray;
            if(-1 != stVector.indexOf(this))
            {
               stVector.splice(stVector.indexOf(this),1);
            }
         }
         if(this.m_BottomEffect)
         {
            if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this.m_BottomEffect);
            }
            this.m_BottomEffect.a_3940();
            this.m_BottomEffect = null;
         }
         return super.a_3940();
      }
      
      override public function gotoAndStop(frame:Object, scene:String = null) : void
      {
         this.m_lastGotoAndStopFrame = frame as int;
         super.gotoAndStop(frame,scene);
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(a_1278 != null && a_1273 != this.m_lastGotoAndStopFrame)
         {
            this.gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         else
         {
            if(a_1273 == a_1274)
            {
               this.ResetSkillTick();
               return;
            }
            nextFrame();
         }
         if(a_1336)
         {
            a_1336.a_3957(iCurrentTime);
         }
         if(m_stFrozenCardEffect)
         {
            m_stFrozenCardEffect.a_3957(iCurrentTime);
         }
         if(m_stShiHuaEffect)
         {
            m_stShiHuaEffect.a_3957(iCurrentTime);
         }
      }
      
      private function a_4003(a_4730:Event) : void
      {
         if(this.m_AliveTime == -1)
         {
            this.m_AliveTime = this.m_initTime;
         }
         this.a_3957(1);
         if(a_1273 == 25)
         {
            this.CardCoolDown();
            if(this.m_coolTimes < 100)
            {
               ++this.m_coolTimes;
            }
         }
         if(this.m_BoomTime > 0)
         {
            --this.m_BoomTime;
            if(this.m_BoomTime == 0)
            {
               this.AddSnakeBottomEffect();
               this.StartSkill();
            }
         }
         if(this.m_SkillTick > 0)
         {
            --this.m_SkillTick;
            if(this.m_SkillTick == 0)
            {
               this.StartSkill();
            }
         }
         if(this.m_AliveTime > 0)
         {
            --this.m_AliveTime;
            if(this.m_AliveTime == 0)
            {
               a_3969(this.iLifeValue);
               return;
            }
         }
      }
      
      private function ResetSkillTick() : void
      {
         if(a_1275 != 0)
         {
            this.visible = false;
            a_1275 = 0;
            this.gotoAndStop((a_1276[0] as FrameLabel).frame);
            this.m_SkillTick = 51;
         }
      }
      
      private function StartSkill() : void
      {
         if(a_1275 != 1)
         {
            this.visible = true;
            a_1275 = 1;
            this.gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
      }
      
      private function AddSnakeBottomEffect() : void
      {
         if(Boolean(a_1334) && this.m_BottomEffect == null)
         {
            this.m_BottomEffect = GoldTimeChronosBaseBottomEffect.a_3926();
            this.m_BottomEffect.a_1797(false);
            this.m_BottomEffect.x = (a_1334.m_iXGridNo + 0.5) * a_3491.a_1080;
            this.m_BottomEffect.y = (a_1334.m_iYGridNo + 0.5) * a_3491.a_1081;
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this.m_BottomEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,a_1334);
            if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_BottomEffect,a_1334.m_iXGridNo,a_1334.m_iYGridNo);
            }
            this.m_BottomEffect.play();
         }
      }
      
      public function CardCoolDown() : void
      {
         var xIndex:int = 0;
         var tempFieldGrid:a_3491 = null;
         var stAurDataEvent:a_1778 = null;
         while(this.m_coolDownCard.length > 0)
         {
            this.m_coolDownCard.pop();
         }
         var xStart:int = Math.max(a_1334.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               tempFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(tempFieldGrid != null)
               {
                  FieldGridUtil.PushCoolDownDefenseTypeIDs(tempFieldGrid,this.m_coolDownCard,1);
               }
            }
         }
         if(a_1334.m_stCurrentBattbleFieldView.isOwnBattleField && Boolean(root))
         {
            stAurDataEvent = new a_1778("GameCardCoolDown");
            stAurDataEvent.dataObject = [4294967290,this.m_coolDownCard,0.5];
            root.dispatchEvent(stAurDataEvent);
         }
      }
      
      private function AddBoomEffect() : void
      {
         var effect:GoldTimeChronosBaseBoomEffect = null;
         if(stFieldGrid)
         {
            effect = GoldTimeChronosBaseBoomEffect.a_3926();
            effect.a_1797(false);
            effect.x = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            effect.y = (stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081 + 25;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_TOP_TYPE,stFieldGrid);
            effect.play();
            this.a_4210();
         }
      }
      
      public function a_4210() : void
      {
         var xIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var xStart:int = Math.max(a_1334.m_iXGridNo - this.m_Range,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + this.m_Range,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - this.m_Range,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + this.m_Range,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               arrMoveIntruder = stFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  stMoveIntruder.a_4210();
               }
            }
         }
      }
   }
}

