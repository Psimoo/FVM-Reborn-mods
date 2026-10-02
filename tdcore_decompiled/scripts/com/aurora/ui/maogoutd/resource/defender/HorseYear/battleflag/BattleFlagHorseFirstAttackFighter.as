package com.aurora.ui.maogoutd.resource.defender.HorseYear.battleflag
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.battleflag.effect.BattleFlagFirstBottomEffect;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.battleflag.effect.BattleFlagFirstPlaceEffect;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class BattleFlagHorseFirstAttackFighter extends a_3976
   {
      
      private var m_stTimer:Timer;
      
      private var m_BottomRangeEffect:a_4108;
      
      private var m_PlaceEffect:a_4108;
      
      private var m_continueTick:int;
      
      private var m_sHotMultiplier:Number;
      
      private var m_endTimeInterval:int;
      
      public function BattleFlagHorseFirstAttackFighter()
      {
         super();
         a_1095 = BattleFlagHorseDefence.DEFENSE_PRICE;
         this.m_stTimer = new Timer(50);
         alpha = 0.7;
         a_1337 = 10;
         a_1338 = -32;
         m_iMoveByMap = true;
         m_iToolType = 5;
      }
      
      public static function a_3926() : BattleFlagHorseFirstAttackFighter
      {
         return PoolManager.getInstance().CheckOutOne(BattleFlagHorseFirstAttackFighter) as BattleFlagHorseFirstAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return BattleFlagHorseFirstAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued && Boolean(stFieldGrid))
         {
            if(stFieldGrid.m_stBattleFlagHorseDefense)
            {
               stFieldGrid.m_stBattleFlagHorseDefense.a_3940();
            }
            stFieldGrid.m_stBattleFlagHorseDefense = this;
            this.m_stTimer.addEventListener(TimerEvent.TIMER,this.a_4003);
            this.m_stTimer.start();
            this.m_sHotMultiplier = BattleFlagHorseDefence.a_3965(a_1094);
            this.AddePlaceEffect(stFieldGrid);
            this.AddeBottomRangeEffect(stFieldGrid);
            this.m_continueTick = BattleFlagHorseDefence.a_3966(m_iSkillDegree);
            this.m_endTimeInterval = a_1334.m_stCurrentBattbleFieldView.iTimeIntervalNum + this.m_continueTick;
            if(a_1336)
            {
               a_1336.y = height - a_1336.height + 7;
            }
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return BattleFlagHorseDefence.a_3964(a_1094);
      }
      
      private function a_4003(e:TimerEvent) : void
      {
         nextFrame();
         if(a_1273 == a_1274 || a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         var cur:int = a_1334.m_stCurrentBattbleFieldView.iTimeIntervalNum;
         if(cur >= this.m_endTimeInterval)
         {
            a_3969(iLifeValue);
         }
         else if(cur == this.m_endTimeInterval - 10)
         {
            this.RealeaseRangEffect();
         }
         this.ApplyBattleFlagBuff();
      }
      
      private function ApplyBattleFlagBuff() : void
      {
         if(!a_1334)
         {
            return;
         }
         this.ForEachInRange(2,function(stAttackFighter:a_3953):void
         {
            if(m_sHotMultiplier > stAttackFighter.m_BattleFlagAddMul)
            {
               stAttackFighter.m_BattleFlagAddMul = m_sHotMultiplier;
            }
         });
      }
      
      private function RecoverBattleFlagBuff() : void
      {
         this.ForEachInRange(2,function(stAttackFighter:a_3953):void
         {
            stAttackFighter.m_BattleFlagAddMul = 0;
         });
      }
      
      private function ForEachInRange(range:int, func:Function) : void
      {
         var grid:a_3491 = null;
         var fighter:a_3953 = null;
         var y:int = 0;
         var cx:int = stFieldGrid.m_iXGridNo;
         var cy:int = stFieldGrid.m_iYGridNo;
         var sx:int = Math.max(cx - range,0);
         var sy:int = Math.max(cy - range,0);
         var ex:int = Math.min(cx + range,BattleFieldView.a_1011 - 1);
         var ey:int = Math.min(cy + range,BattleFieldView.a_1012 - 1);
         var grids:Array = stFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var x:int = sx; x <= ex; x++)
         {
            for(y = sy; y <= ey; y++)
            {
               grid = grids[y][x];
               if(grid)
               {
                  fighter = grid.m_stAttackFighter;
                  if(Boolean(fighter) && Boolean(fighter.m_iDefenseGlobalID != this.m_iDefenseGlobalID) && !(fighter is a_3924))
                  {
                     func(fighter);
                  }
               }
            }
         }
      }
      
      private function AddeBottomRangeEffect(grid:a_3491) : void
      {
         if(!grid || Boolean(this.m_BottomRangeEffect))
         {
            return;
         }
         this.m_BottomRangeEffect = BattleFlagFirstBottomEffect.a_3926();
         this.m_BottomRangeEffect.a_1797(false);
         this.m_BottomRangeEffect.x = (grid.m_iXGridNo + 0.5) * a_3491.a_1080;
         this.m_BottomRangeEffect.y = (grid.m_iYGridNo + 0.5) * a_3491.a_1081;
         grid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_BottomRangeEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,grid);
         if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_BottomRangeEffect,a_1334.m_iXGridNo,a_1334.m_iYGridNo);
         }
         this.m_BottomRangeEffect.play();
      }
      
      private function AddePlaceEffect(grid:a_3491) : void
      {
         if(!grid || Boolean(this.m_PlaceEffect))
         {
            return;
         }
         this.m_PlaceEffect = BattleFlagFirstPlaceEffect.a_3926();
         this.m_PlaceEffect.a_1797(false);
         this.m_PlaceEffect.x = (grid.m_iXGridNo + 0.5) * a_3491.a_1080;
         this.m_PlaceEffect.y = (grid.m_iYGridNo + 0.5) * a_3491.a_1081;
         grid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_PlaceEffect,BattleLayerDefine.SHOT_TYPE,grid);
         if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_PlaceEffect,a_1334.m_iXGridNo,a_1334.m_iYGridNo);
         }
         this.m_PlaceEffect.play();
      }
      
      private function RealeaseRangEffect() : void
      {
         if(this.m_BottomRangeEffect)
         {
            if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this.m_BottomRangeEffect);
            }
            this.m_BottomRangeEffect.SpecialSkillCallBack();
            this.m_BottomRangeEffect = null;
         }
      }
      
      override public function a_3940() : Boolean
      {
         if(m_bServerIssued)
         {
            stFieldGrid.m_stBattleFlagHorseDefense = null;
            this.m_stTimer.removeEventListener(TimerEvent.TIMER,this.a_4003);
            this.m_stTimer.stop();
            this.RecoverBattleFlagBuff();
            this.RealeaseRangEffect();
            if(this.m_PlaceEffect)
            {
               if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
               {
                  a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this.m_PlaceEffect);
               }
               this.m_PlaceEffect.a_3940();
               this.m_PlaceEffect = null;
            }
         }
         return super.a_3940();
      }
   }
}

