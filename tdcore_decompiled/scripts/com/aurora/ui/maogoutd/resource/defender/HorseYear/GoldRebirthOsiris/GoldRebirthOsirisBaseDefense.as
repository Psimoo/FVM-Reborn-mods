package com.aurora.ui.maogoutd.resource.defender.HorseYear.GoldRebirthOsiris
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.EffectManager;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.GoldRebirthOsiris.effect.GoldOsirisBaseRangeEffectMovie;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class GoldRebirthOsirisBaseDefense extends a_3976
   {
      
      private var m_stTimer:Timer;
      
      private var stBottomEffect:BaseGameEffect;
      
      private var m_range:int = 2;
      
      private var m_TickTime:int = 0;
      
      private var m_FangYuTimes:int = 0;
      
      private var m_WuDiType:int = 0;
      
      private var m_WuDiTimes:int = 0;
      
      private var m_iProtectBuffTime:int;
      
      public function GoldRebirthOsirisBaseDefense()
      {
         super();
         a_1095 = GoldRebirthOsirisDefence.DEFENSE_PRICE;
         this.m_stTimer = new Timer(100);
         this.m_stTimer.addEventListener(TimerEvent.TIMER,this.a_4003);
      }
      
      public static function a_3926() : GoldRebirthOsirisBaseDefense
      {
         return PoolManager.getInstance().CheckOutOne(GoldRebirthOsirisBaseDefense) as GoldRebirthOsirisBaseDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldRebirthOsirisBaseDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            this.m_stTimer.start();
            this.m_TickTime = GoldRebirthOsirisDefence.a_3966(m_iSkillDegree);
            this.m_FangYuTimes = GoldRebirthOsirisDefence.GetCardSkillFangYuTimes(m_iSkillDegree);
            this.m_iProtectBuffTime = GoldRebirthOsirisDefence.PackProtectBuffTime(this.m_TickTime,this.m_FangYuTimes,this.m_WuDiType,this.m_WuDiTimes);
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
            GoldRebirthOsirisDefence.TotalRangeFangyuBuff(stFieldGrid,this.m_range,this.m_range,this.m_TickTime,this.m_FangYuTimes);
            if(a_1334.m_stCurrentBattbleFieldView.isOwnBattleField)
            {
               GoldRebirthOsirisDefence.skillAddCard(stFieldGrid,4,this.m_range,this.m_range,0,this.AddRebirthEffect);
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
         GoldRebirthOsirisDefence.AddGridRebirthEffect(grid,0,stBaseDefense.a_3512(),iOrigSeatID,this.m_iProtectBuffTime,!m_iBeOtherPlaced);
      }
      
      private function AddBottomRangeEffect() : void
      {
         var numShotXpos:Number = NaN;
         if(Boolean(a_1334) && this.stBottomEffect == null)
         {
            this.stBottomEffect = EffectManager.getInstance().CheckOutEffect(GoldOsirisBaseRangeEffectMovie);
            numShotXpos = a_1283 ? -44 : 44;
            this.stBottomEffect.x = this.x + numShotXpos;
            this.stBottomEffect.y = this.y + 69;
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

