package com.aurora.ui.maogoutd.resource.defender.HorseYear.battleflag
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.battleflag.effect.BattleFlagSecondBottomEffect;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.battleflag.effect.BattleFlagSecondPlaceEffect;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class BattleFlagHorseSecondAttackFighter extends a_3976
   {
      
      private static var ms_aliveCount:int;
      
      private static var ms_Effects:Array = [null,null,null,null];
      
      private static const POS_LEFT_TOP:int = 0;
      
      private static const POS_RIGHT_TOP:int = 1;
      
      private static const POS_LEFT_BOTTOM:int = 2;
      
      private static const POS_RIGHT_BOTTOM:int = 3;
      
      private var m_stTimer:Timer;
      
      private var m_PlaceEffect:a_4108;
      
      private var m_continueTick:int;
      
      private var m_sHotMultiplier:Number;
      
      private var m_endTimeInterval:int;
      
      public function BattleFlagHorseSecondAttackFighter()
      {
         super();
         a_1095 = BattleFlagHorseDefence.DEFENSE_PRICE;
         this.m_stTimer = new Timer(100);
         alpha = 0.7;
         a_1337 = 10;
         a_1338 = -32;
         m_iMoveByMap = true;
         m_iToolType = 5;
      }
      
      public static function a_3926() : BattleFlagHorseSecondAttackFighter
      {
         return PoolManager.getInstance().CheckOutOne(BattleFlagHorseSecondAttackFighter) as BattleFlagHorseSecondAttackFighter;
      }
      
      public static function hideAll() : void
      {
         for(var i:int = 0; i < 4; i++)
         {
            if(ms_Effects[i])
            {
               ms_Effects[i].a_3940();
               ms_Effects[i] = null;
            }
         }
      }
      
      override protected function getBindMovie() : Class
      {
         return BattleFlagHorseSecondAttackFighterMovie;
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
            this.m_sHotMultiplier = BattleFlagHorseDefence.a_3965(a_1094) * 2;
            this.AddePlaceEffect(stFieldGrid);
            this.m_continueTick = BattleFlagHorseDefence.a_3966(m_iSkillDegree);
            this.m_endTimeInterval = a_1334.m_stCurrentBattbleFieldView.iTimeIntervalNum + this.m_continueTick;
            ++ms_aliveCount;
            if(ms_aliveCount == 1)
            {
               this.showAll();
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
         var sx:int = 0;
         var sy:int = 0;
         var ex:int = BattleFieldView.a_1011 - 1;
         var ey:int = BattleFieldView.a_1012 - 1;
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
      
      private function AddePlaceEffect(grid:a_3491) : void
      {
         if(!grid || Boolean(this.m_PlaceEffect))
         {
            return;
         }
         this.m_PlaceEffect = BattleFlagSecondPlaceEffect.a_3926();
         this.m_PlaceEffect.a_1797(this.IsReversed());
         this.m_PlaceEffect.x = (int(BattleFieldView.a_1011 / 2) + 0.5) * a_3491.a_1080;
         this.m_PlaceEffect.y = (int(BattleFieldView.a_1012 / 2) + 0.5) * a_3491.a_1081;
         grid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_PlaceEffect,BattleLayerDefine.SHOT_TYPE,grid);
         if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_PlaceEffect,a_1334.m_iXGridNo,a_1334.m_iYGridNo);
         }
         this.m_PlaceEffect.play();
      }
      
      public function showAll() : void
      {
         this.showEffect(POS_LEFT_TOP);
         this.showEffect(POS_RIGHT_TOP);
         this.showEffect(POS_LEFT_BOTTOM);
         this.showEffect(POS_RIGHT_BOTTOM);
      }
      
      private function showEffect(pos:int) : void
      {
         var gridY:int = 0;
         var offsetY:int = 0;
         var grid:a_3491 = null;
         var effect:BattleFlagSecondBottomEffect = null;
         if(!stFieldGrid || Boolean(ms_Effects[pos]))
         {
            return;
         }
         var gridX:int = 0;
         gridY = 0;
         var scaleX:Number = 1;
         var scaleY:Number = 1;
         var maxX:int = BattleFieldView.a_1011 - 1;
         var maxY:int = BattleFieldView.a_1012 - 1;
         var offsetX:int = 0;
         offsetY = 0;
         switch(pos)
         {
            case POS_LEFT_BOTTOM:
               gridX = 0;
               gridY = maxY;
               offsetY = a_3491.a_1081;
               break;
            case POS_RIGHT_BOTTOM:
               gridX = maxX;
               gridY = maxY;
               scaleX = -1;
               offsetY = a_3491.a_1081;
               offsetX = a_3491.a_1080;
               break;
            case POS_LEFT_TOP:
               gridX = 0;
               gridY = 0;
               scaleY = -1;
               offsetY = 16;
               break;
            case POS_RIGHT_TOP:
               gridX = maxX;
               gridY = 0;
               scaleX = -1;
               scaleY = -1;
               offsetX = a_3491.a_1080;
               offsetY = 16;
         }
         grid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(gridX,gridY);
         effect = BattleFlagSecondBottomEffect.a_3926();
         effect.a_1797(false);
         effect.scaleX = scaleX;
         effect.scaleY = scaleY;
         effect.x = gridX * a_3491.a_1080 + offsetX;
         effect.y = gridY * a_3491.a_1081 + offsetY;
         ms_Effects[pos] = effect;
         grid.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_BASE_TYPE,grid);
      }
      
      override public function a_3940() : Boolean
      {
         if(m_bServerIssued)
         {
            stFieldGrid.m_stBattleFlagHorseDefense = null;
            this.m_stTimer.removeEventListener(TimerEvent.TIMER,this.a_4003);
            this.m_stTimer.stop();
            this.RecoverBattleFlagBuff();
            --ms_aliveCount;
            if(ms_aliveCount == 0)
            {
               hideAll();
            }
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

