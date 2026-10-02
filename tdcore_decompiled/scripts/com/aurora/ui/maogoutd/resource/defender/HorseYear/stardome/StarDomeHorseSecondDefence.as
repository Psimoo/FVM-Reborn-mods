package com.aurora.ui.maogoutd.resource.defender.HorseYear.stardome
{
   import a_4752.GlobalVariables;
   import com.aurora.protocol.game.maogoutd.CardDieVO;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public dynamic class StarDomeHorseSecondDefence extends a_3976
   {
      
      private var m_stTimer:Timer;
      
      private var m_BottomRangeEffect:a_4108;
      
      private var m_range:int = 2;
      
      private var m_TickTime:int;
      
      private var m_continueTick:int;
      
      private var totalTick:int;
      
      private var m_arrPos:Array = [[0,0],[0,-1],[0,1],[1,0],[-1,0],[-1,-1],[-1,1],[1,-1],[1,1],[-2,-2],[-2,2],[-2,-1],[-2,1],[-2,0],[-1,-2],[-1,2],[0,-2],[0,2],[1,-2],[1,2],[2,-2],[2,2],[2,-1],[2,1],[2,0]];
      
      public function StarDomeHorseSecondDefence()
      {
         super();
         a_1095 = StarDomeHorseDefence.DEFENSE_PRICE;
         this.m_stTimer = new Timer(100);
         this.m_stTimer.addEventListener(TimerEvent.TIMER,this.a_4003);
      }
      
      public static function a_3926() : StarDomeHorseSecondDefence
      {
         return PoolManager.getInstance().CheckOutOne(StarDomeHorseSecondDefence) as StarDomeHorseSecondDefence;
      }
      
      override protected function getBindMovie() : Class
      {
         return StarDomeHorseSecondDefenceMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         visible = true;
         gotoAndStop(1);
         if(m_bServerIssued)
         {
            this.m_stTimer.start();
            this.AddBottomRangeEffect();
            this.m_TickTime = StarDomeHorseDefence.a_3966(m_iSkillDegree);
            this.m_continueTick = StarDomeHorseDefence.GetCardSkillEffectTick(m_iSkillDegree);
            this.totalTick = StarDomeHorseDefence.PackProtectBuffTime(this.m_TickTime,this.m_continueTick);
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return StarDomeHorseDefence.a_3964(a_1094);
      }
      
      private function a_4003(e:TimerEvent) : void
      {
         nextFrame();
         if(a_1273 == 13)
         {
            if(a_1334.m_stCurrentBattbleFieldView.isOwnBattleField)
            {
               StarDomeHorseDefence.TatalRangeFangyuSkill(stFieldGrid,2,this.m_TickTime,this.m_continueTick);
               if(Boolean(root) && !m_iBeOtherPlaced)
               {
                  this.skillAddCard(stFieldGrid,3);
               }
            }
         }
         else if(a_1273 == a_1274)
         {
            m_iDieType = 1;
            a_3969(this.iLifeValue);
         }
      }
      
      private function skillAddCard(stFieldGrid:a_3491, SkillTimes:int) : void
      {
         var best:CardDieVO = null;
         var vo:CardDieVO = null;
         var dx:int = 0;
         var dy:int = 0;
         var placeX:int = 0;
         var placeY:int = 0;
         var stCurField:a_3491 = null;
         if(!stFieldGrid)
         {
            return;
         }
         var times:int = 0;
         var eatArr:Array = GlobalVariables.getInstance().m_iEatDieArr;
         for each(vo in eatArr)
         {
            dx = vo.m_byXGridNo - stFieldGrid.m_iInitialXGridNo;
            dy = vo.m_byYGridNo - stFieldGrid.m_iInitialYGridNo;
            if(!(dx < -this.m_range || dx > this.m_range))
            {
               if(!(dy < -this.m_range || dy > this.m_range))
               {
                  if(!best || vo.m_DieTime > best.m_DieTime)
                  {
                     best = vo;
                  }
               }
            }
         }
         if(!best)
         {
            return;
         }
         var i:int = 0;
         while(i < this.m_arrPos.length && times < SkillTimes)
         {
            placeX = stFieldGrid.m_iInitialXGridNo + this.m_arrPos[i][0];
            placeY = stFieldGrid.m_iInitialYGridNo + this.m_arrPos[i][1];
            stCurField = stFieldGrid.m_stCurrentBattbleFieldView.GetInitialFieldGrid(placeX,placeY);
            if(Boolean(stCurField) && StarDomeHorseDefence.TryAddCardCopy(stCurField,best.m_iDefenderTypeID,best.m_iOrigSeatID,this.totalTick))
            {
               this.AddDeathCopyEffect(stCurField);
               times++;
            }
            i++;
         }
      }
      
      private function AddBottomRangeEffect() : void
      {
         if(Boolean(a_1334) && this.m_BottomRangeEffect == null)
         {
            this.m_BottomRangeEffect = StarDomeHorseSecondBottomEffect.a_3926();
            this.m_BottomRangeEffect.a_1797(false);
            this.m_BottomRangeEffect.x = (a_1334.m_iXGridNo + 0.5) * a_3491.a_1080;
            this.m_BottomRangeEffect.y = (a_1334.m_iYGridNo + 0.5) * a_3491.a_1081;
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this.m_BottomRangeEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,a_1334);
            if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_BottomRangeEffect,a_1334.m_iXGridNo,a_1334.m_iYGridNo);
            }
         }
      }
      
      private function AddDeathCopyEffect(grid:a_3491) : void
      {
         var m_DeathCopyEffect:DeathCopyEffect = null;
         if(!grid)
         {
            return;
         }
         m_DeathCopyEffect = DeathCopyEffect.a_3926();
         m_DeathCopyEffect.stOriginalFieldGrid = grid;
         m_DeathCopyEffect.a_1797(false);
         m_DeathCopyEffect.x = (grid.m_iXGridNo + 0.5) * a_3491.a_1080;
         m_DeathCopyEffect.y = (grid.m_iYGridNo + 0.5) * a_3491.a_1081;
         grid.m_stCurrentBattbleFieldView.AddToBattleView(m_DeathCopyEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,grid);
         m_DeathCopyEffect.play();
      }
      
      override public function a_3940() : Boolean
      {
         if(m_bServerIssued)
         {
            this.m_stTimer.stop();
            if(this.m_BottomRangeEffect)
            {
               if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
               {
                  a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this.m_BottomRangeEffect);
               }
               this.m_BottomRangeEffect.a_3940();
               this.m_BottomRangeEffect = null;
            }
         }
         return super.a_3940();
      }
   }
}

