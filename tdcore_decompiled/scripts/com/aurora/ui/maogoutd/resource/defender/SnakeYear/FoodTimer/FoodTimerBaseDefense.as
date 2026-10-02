package com.aurora.ui.maogoutd.resource.defender.SnakeYear.FoodTimer
{
   import a_4728.a_1778;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.FieldGridUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class FoodTimerBaseDefense extends a_3976
   {
      
      private var m_coolDownCard:Array = new Array();
      
      private var m_stTiemr:Timer;
      
      private var m_BottomEffect:a_4108;
      
      private var m_coolTimes:int;
      
      private var m_State:int;
      
      private var m_SkillTick:int;
      
      private var m_ReleaseTick:int;
      
      private var m_AliveTime:int;
      
      private var m_initTime:int;
      
      private var m_lastGotoAndStopFrame:int;
      
      public function FoodTimerBaseDefense()
      {
         a_1271 = true;
         super();
         a_1338 = -30;
         a_1337 = 0;
         a_1095 = FoodTimerDefence.DEFENSE_PRICE;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : FoodTimerBaseDefense
      {
         return PoolManager.getInstance().CheckOutOne(FoodTimerBaseDefense) as FoodTimerBaseDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return FoodTimerBaseDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = FoodTimerDefence.MAX_LIFE_VALUE;
         if(m_bServerIssued)
         {
            if(!this.m_stTiemr.hasEventListener(TimerEvent.TIMER))
            {
               this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
            }
            this.m_State = this.m_coolTimes = this.m_SkillTick = this.m_ReleaseTick = 0;
            this.m_initTime = FoodTimerDefence.a_3966(m_iSkillDegree);
            this.m_AliveTime = -1;
            this.play();
            if(stFieldGrid)
            {
               stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(this);
            }
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return FoodTimerDefence.a_3964(a_1094);
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
               this.gotoAndStop(1);
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
            this.AddSnakeBottomEffect();
         }
         this.a_3957(1);
         if(this.m_AliveTime > 0)
         {
            --this.m_AliveTime;
            if(this.m_AliveTime == 4)
            {
               this.m_ReleaseTick = 4;
               trace("卡片即将死亡播放特效死亡时间" + (this.m_initTime - this.m_AliveTime).toString());
               if(this.m_BottomEffect)
               {
                  this.m_BottomEffect.ShowPlayAnimation(2,2);
               }
            }
            if(this.m_AliveTime == 0)
            {
               a_3969(this.iLifeValue);
               trace("卡片技持续时间" + (this.m_initTime - this.m_AliveTime).toString());
               return;
            }
         }
         if(a_1273 == a_1274 && this.visible)
         {
            trace("卡片技能释放第" + (this.m_coolTimes + 1).toString() + "次技能时间：" + (this.m_initTime - this.m_AliveTime).toString());
            this.CardCoolDown(0);
            if(this.m_coolTimes < 3)
            {
               ++this.m_coolTimes;
               this.visible = false;
               this.AddSnakeBottomEffect();
               this.m_SkillTick = 50;
            }
            return;
         }
         if(this.m_SkillTick > 0)
         {
            --this.m_SkillTick;
            if(this.m_SkillTick == 0)
            {
               this.gotoAndStop(1);
               this.visible = true;
               return;
            }
         }
      }
      
      private function AddSnakeBottomEffect() : void
      {
         if(Boolean(a_1334) && this.m_BottomEffect == null)
         {
            this.m_BottomEffect = FoodTimerBaseBottomEffect.a_3926();
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
         this.m_BottomEffect.ShowPlayAnimation(0,1);
      }
      
      public function CardCoolDown(m_Range:int) : void
      {
         var xIndex:int = 0;
         var tempFieldGrid:a_3491 = null;
         var stAurDataEvent:a_1778 = null;
         while(this.m_coolDownCard.length > 0)
         {
            this.m_coolDownCard.pop();
         }
         var xStart:int = Math.max(a_1334.m_iXGridNo - m_Range,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + m_Range,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 0,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 0,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               tempFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(tempFieldGrid != null)
               {
                  FieldGridUtil.PushCoolDownDefenseTypeIDs(tempFieldGrid,this.m_coolDownCard,0);
               }
            }
         }
         if(a_1334.m_stCurrentBattbleFieldView.isOwnBattleField && Boolean(root))
         {
            stAurDataEvent = new a_1778("GameCardCoolDown");
            stAurDataEvent.dataObject = [4294967290,this.m_coolDownCard,0.7];
            root.dispatchEvent(stAurDataEvent);
         }
      }
   }
}

