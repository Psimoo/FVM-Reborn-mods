package com.aurora.ui.maogoutd.resource.defender.HorseYear.GoldRebirthOsiris
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.EffectManager;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.GoldRebirthOsiris.effect.GoldOsirisFinalRangeEffectMovie;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class GoldRebirthOsirisFinalDefense extends a_3976
   {
      
      private var m_stTimer:Timer;
      
      private var stBottomEffect:BaseGameEffect;
      
      private var m_rangeX:int = 2;
      
      private var m_rangeY:int = 3;
      
      private var m_TickTime:int;
      
      private var m_continueTick:int;
      
      private var m_WuDiType:int = 1;
      
      private var m_WuDiTimes:int;
      
      private var totalTick:int;
      
      public function GoldRebirthOsirisFinalDefense()
      {
         super();
         a_1095 = GoldRebirthOsirisDefence.DEFENSE_PRICE;
         this.m_stTimer = new Timer(100);
         this.m_stTimer.addEventListener(TimerEvent.TIMER,this.a_4003);
      }
      
      public static function a_3926() : GoldRebirthOsirisFinalDefense
      {
         return PoolManager.getInstance().CheckOutOne(GoldRebirthOsirisFinalDefense) as GoldRebirthOsirisFinalDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldRebirthOsirisFinalDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            this.m_stTimer.start();
            this.m_TickTime = GoldRebirthOsirisDefence.a_3966(m_iSkillDegree);
            this.m_continueTick = GoldRebirthOsirisDefence.GetCardSkillFangYuTimes(m_iSkillDegree);
            this.m_WuDiTimes = GoldRebirthOsirisDefence.GetCardSkillWudiTimes(m_iSkillDegree);
            this.totalTick = GoldRebirthOsirisDefence.PackProtectBuffTime(this.m_TickTime,this.m_continueTick,this.m_WuDiType,this.m_WuDiTimes);
         }
         return true;
      }
      
      override public function finalizeInitialization() : void
      {
         super.finalizeInitialization();
         if(m_bServerIssued)
         {
            this.AddBottomRangeEffect();
         }
      }
      
      override protected function a_3964() : int
      {
         return GoldRebirthOsirisDefence.a_3964(a_1094);
      }
      
      private function a_4003(e:TimerEvent) : void
      {
         nextFrame();
         if(a_1273 == 30)
         {
            if(this.stBottomEffect)
            {
               if(Boolean(a_1334) && Boolean(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap()))
               {
                  a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this.stBottomEffect);
               }
               this.stBottomEffect.SetAnimation(2,true);
               this.stBottomEffect = null;
            }
         }
         else if(a_1273 == 33)
         {
            GoldRebirthOsirisDefence.TotalRangeInvincibleBuff(stFieldGrid,this.m_rangeX,this.m_rangeY,this.m_WuDiTimes,this.m_WuDiType,this.m_continueTick,this.m_TickTime);
            if(a_1334.m_stCurrentBattbleFieldView.isOwnBattleField)
            {
               GoldRebirthOsirisDefence.skillAddCard(stFieldGrid,9,this.m_rangeX,this.m_rangeY,3,this.AddRebirthEffect);
            }
         }
         else if(a_1273 == a_1274)
         {
            m_iDieType = 1;
            a_3969(this.iLifeValue);
         }
      }
      
      private function AddRebirthEffect(grid:a_3491, stBaseDefense:a_3962, iOrigSeatID:*) : void
      {
         if(!grid || !stBaseDefense)
         {
            return;
         }
         GoldRebirthOsirisDefence.AddGridRebirthEffect(grid,3,stBaseDefense.a_3512(),iOrigSeatID,this.totalTick,!m_iBeOtherPlaced);
      }
      
      private function AddBottomRangeEffect() : void
      {
         var numShotXpos:Number = NaN;
         if(Boolean(a_1334) && this.stBottomEffect == null)
         {
            this.stBottomEffect = EffectManager.getInstance().CheckOutEffect(GoldOsirisFinalRangeEffectMovie);
            numShotXpos = a_1283 ? -51 : 51;
            this.stBottomEffect.x = this.x + numShotXpos;
            this.stBottomEffect.y = this.y + 73;
            this.stBottomEffect.SetAnimationOnce2Loop(0,1);
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this.stBottomEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,a_1334);
            if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.stBottomEffect,a_1334.m_iXGridNo,a_1334.m_iYGridNo);
            }
         }
      }
      
      override public function a_3940() : Boolean
      {
         if(m_bServerIssued)
         {
            this.m_stTimer.stop();
            if(this.stBottomEffect)
            {
               if(Boolean(a_1334) && Boolean(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap()))
               {
                  a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this.stBottomEffect);
               }
               this.stBottomEffect.SetAnimation(2,true);
               this.stBottomEffect = null;
            }
         }
         m_iBeOtherPlaced = false;
         return super.a_3940();
      }
   }
}

