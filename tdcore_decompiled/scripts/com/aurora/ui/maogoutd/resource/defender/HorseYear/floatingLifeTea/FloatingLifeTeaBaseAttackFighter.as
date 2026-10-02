package com.aurora.ui.maogoutd.resource.defender.HorseYear.floatingLifeTea
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleVOUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.EffectManager;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.AttackBuffManager;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.floatingLifeTea.effect.FloatingLifeTeaBaseRangeEffectMovie;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   
   public class FloatingLifeTeaBaseAttackFighter extends a_3953
   {
      
      private static const GRID_RANGE:int = 1;
      
      private var m_AttackBufRate:Number;
      
      private var m_AttackBuffName:String = "";
      
      private var stBottomEffect:BaseGameEffect;
      
      public function FloatingLifeTeaBaseAttackFighter()
      {
         super();
         a_1095 = FloatingLifeTeaDefine.DEFENSE_PRICE;
         a_1313 = true;
         a_1333 = true;
         a_1337 = -13;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(FloatingLifeTeaBaseAttackFighter) as FloatingLifeTeaBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return FloatingLifeTeaBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         canReceiveAttackBuff = false;
         if(m_bServerIssued)
         {
            this.m_AttackBuffName = BattleVOUtil.ATTACKBUFF_MUSICBOXHORSE + m_iDefenseGlobalID;
            this.m_AttackBufRate = FloatingLifeTeaDefine.a_3965(a_1094);
            if(a_1336)
            {
               a_1336.x += 13;
            }
         }
         return true;
      }
      
      override public function finalizeInitialization() : void
      {
         super.finalizeInitialization();
         if(m_bServerIssued)
         {
            this.addRangeEffect();
         }
      }
      
      override protected function a_3964() : int
      {
         return FloatingLifeTeaDefine.a_3964(m_iSkillDegree);
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(m_bServerIssued && Boolean(this.m_AttackBuffName))
         {
            AttackBuffManager.instance.UpdateBuffRange(this.m_AttackBuffName,stFieldGrid,GRID_RANGE,GRID_RANGE,this.filterTarget,this.applyBuffToTarget,true,this.onBuffOutOfRange);
         }
         return true;
      }
      
      private function filterTarget(fighter:a_3953) : Boolean
      {
         if(!fighter || fighter is a_3924)
         {
            return false;
         }
         if(!fighter.canReceiveAttackBuff)
         {
            return false;
         }
         if(!FloatingLifeTeaDefine.IsFixedTrajectoryDefense(fighter.a_3512()))
         {
            return false;
         }
         if(fighter.GetAttackBuffRate(this.m_AttackBuffName) >= this.m_AttackBufRate)
         {
            return false;
         }
         return true;
      }
      
      private function applyBuffToTarget(sourceID:String, target:a_3953) : void
      {
         if(!target)
         {
            return;
         }
         if(target.GetAttackBuffRate(sourceID) >= this.m_AttackBufRate)
         {
            return;
         }
         target.AddAttackBuffFromSource(sourceID,this.m_AttackBufRate);
      }
      
      private function onBuffOutOfRange(sourceID:String, target:a_3953) : void
      {
         if(!target)
         {
            return;
         }
         target.RemoveAttackBuffFromSource(sourceID);
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            if(a_1278 == null)
            {
               a_1278 = "待机";
            }
            super.a_3957(iCurrentTime);
         }
      }
      
      private function addRangeEffect() : void
      {
         if(!a_1334 || Boolean(this.stBottomEffect))
         {
            return;
         }
         this.stBottomEffect = EffectManager.getInstance().CheckOutEffect(FloatingLifeTeaBaseRangeEffectMovie);
         var numShotXpos:Number = a_1283 ? -51 : 51;
         this.stBottomEffect.x = x + numShotXpos;
         this.stBottomEffect.y = y + 69.5;
         this.stBottomEffect.SetAnimation(0,false);
         a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this.stBottomEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,a_1334);
         if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.stBottomEffect,a_1334.m_iXGridNo,a_1334.m_iYGridNo);
         }
      }
      
      private function removeRangeEffect() : void
      {
         if(!this.stBottomEffect)
         {
            return;
         }
         if(Boolean(a_1334) && Boolean(a_1334.m_stCurrentBattbleFieldView) && Boolean(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap()))
         {
            a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this.stBottomEffect);
         }
         this.stBottomEffect.a_3940();
         this.stBottomEffect = null;
      }
      
      override public function a_3940() : Boolean
      {
         if(m_bServerIssued)
         {
            if(this.m_AttackBuffName != "")
            {
               AttackBuffManager.instance.RemoveBuffBySource(this.m_AttackBuffName);
               this.m_AttackBuffName = "";
            }
            this.removeRangeEffect();
         }
         return super.a_3940();
      }
   }
}

