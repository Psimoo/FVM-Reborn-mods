package com.aurora.ui.maogoutd.resource.defender.HorseYear.battleflag
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.battleflag.effect.BattleFlagBaseBottomEffect;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.battleflag.effect.BattleFlagBasePlaceEffect;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   
   public class BattleFlagHorseBaseAttackFighter extends a_3953
   {
      
      private var m_BottomRangeEffect:a_4108;
      
      private var m_PlaceEffect:a_4108;
      
      private var m_continueTick:int;
      
      public function BattleFlagHorseBaseAttackFighter()
      {
         super();
         a_1095 = BattleFlagHorseDefence.DEFENSE_PRICE;
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(BattleFlagHorseBaseAttackFighter) as BattleFlagHorseBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return BattleFlagHorseBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            m_BaseAuxiliaryMultiplier = BattleFlagHorseDefence.a_3965(a_1094);
            this.AddePlaceEffect(stFieldGrid);
            this.AddeBottomRangeEffect(stFieldGrid);
            this.m_continueTick = BattleFlagHorseDefence.a_3966(m_iSkillDegree);
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return BattleFlagHorseDefence.a_3964(m_iSkillDegree);
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(this.m_continueTick > 0)
         {
            --this.m_continueTick;
            if(this.m_continueTick == 10)
            {
               this.RealeaseRangEffect();
            }
            else if(this.m_continueTick == 0)
            {
               a_3969(iLifeValue);
            }
         }
         this.ApplyBattleFlagBuff();
         return true;
      }
      
      private function ApplyBattleFlagBuff() : void
      {
         if(!a_1334)
         {
            return;
         }
         this.ForEachInRange(2,function(stAttackFighter:a_3953):void
         {
            if(m_BaseAuxiliaryMultiplier > stAttackFighter.m_BattleFlagAddMul)
            {
               stAttackFighter.m_BattleFlagAddMul = m_BaseAuxiliaryMultiplier;
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
         this.m_BottomRangeEffect = BattleFlagBaseBottomEffect.a_3926();
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
         this.m_PlaceEffect = BattleFlagBasePlaceEffect.a_3926();
         this.m_PlaceEffect.a_1797(false);
         this.m_PlaceEffect.x = (grid.m_iXGridNo + 0.5) * a_3491.a_1080;
         this.m_PlaceEffect.y = (grid.m_iYGridNo + 0.5) * a_3491.a_1081;
         grid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_PlaceEffect,BattleLayerDefine.OBSTACL_TYPE,grid);
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
         super.a_3940();
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return 0.9 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.3 * height + 25;
      }
      
      override protected function a_3966() : int
      {
         return 5 * m_iSkillDegree;
      }
   }
}

