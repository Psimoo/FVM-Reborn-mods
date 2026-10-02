package com.aurora.ui.maogoutd.resource.shot.ThornRoseShield
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.AttackBuffManager;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.effect.base.BaseOriginEffect;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkill;
   import flash.utils.Dictionary;
   
   public class RosesProtectionSkill extends BaseSkill
   {
      
      private var m_AddAttackValue:Number;
      
      private var stFieldGrid:a_3491;
      
      private var m_dicTargetsWithEffect:Dictionary = new Dictionary();
      
      private var m_stSkillEffect:BaseOriginEffect;
      
      public function RosesProtectionSkill()
      {
         super();
      }
      
      public static function a_3926() : RosesProtectionSkill
      {
         return PoolManager.getInstance().CheckOutOne(RosesProtectionSkill) as RosesProtectionSkill;
      }
      
      override public function a_4330() : void
      {
         this.recoverHurt();
         this.ClearSkillEffect();
         if(sourceID != "")
         {
            AttackBuffManager.instance.RemoveBuffBySource(sourceID);
         }
         this.stFieldGrid = null;
         super.a_4330();
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         m_uiSkillCoolingTime = 40;
         this.m_AddAttackValue = this.GetSkillEffectRateValue();
         if(m_stBaseAvatar != null)
         {
            sourceID = "RosesProtection_" + m_uiSkillID + "_" + (m_stBaseAvatar.m_isMyPlaced ? "MySkill" : "OtherSkill");
            if(this.stFieldGrid != m_stBaseAvatar.stFieldGrid && m_stBaseAvatar.m_bServerIssued && sourceID != "")
            {
               this.recoverHurt();
               AttackBuffManager.instance.RemoveBuffBySource(sourceID);
            }
            this.stFieldGrid = m_stBaseAvatar.stFieldGrid;
         }
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         super.OnTimeInterval(iTimeNum);
         if(null == this.m_stSkillEffect && AvatarIsOk && Boolean(this.stFieldGrid))
         {
            this.RealeaseSkillEffect();
         }
         if(Boolean(iTimeNum % 2 == 0 && AvatarIsOk && m_stBattleFieldView) && Boolean(this.stFieldGrid) && sourceID != "")
         {
            AttackBuffManager.instance.UpdateBuffRange(sourceID,this.stFieldGrid,2,2,null,this.ApplyBuff,true,this.OnOutOfRange);
         }
      }
      
      private function ClearSkillEffect() : void
      {
         if(null != this.m_stSkillEffect)
         {
            if(Boolean(m_stBattleFieldView) && Boolean(m_stBattleFieldView.GetGameMoveMap()))
            {
               m_stBattleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this.m_stSkillEffect);
            }
            this.m_stSkillEffect.a_3940();
            this.m_stSkillEffect = null;
         }
      }
      
      private function RealeaseSkillEffect() : void
      {
         if(m_stBaseAvatar == null || m_stBaseAvatar.stFieldGrid == null)
         {
            return;
         }
         var stGrid:a_3491 = m_stBaseAvatar.stFieldGrid;
         if(this.m_stSkillEffect == null)
         {
            if(m_iSkillDegree <= 6)
            {
               this.m_stSkillEffect = BattleEffectUtil.CreateOriginEffect(null,RosesProtectionOneSkillEffectMovie,stGrid);
            }
            else if(m_iSkillDegree <= 14)
            {
               this.m_stSkillEffect = BattleEffectUtil.CreateOriginEffect(null,RosesProtectionTwoSkillEffectMovie,stGrid);
            }
            else if(m_iSkillDegree <= 15)
            {
               this.m_stSkillEffect = BattleEffectUtil.CreateOriginEffect(null,RosesProtectionThreeSkillEffectMovie,stGrid);
            }
            if(this.m_stSkillEffect)
            {
               this.m_stSkillEffect.SetReversed(!m_stBattleFieldView.isOwnBattleField);
               this.m_stSkillEffect.SetAnimationOnce2Loop(0,1);
               if(m_stBattleFieldView.GetGameMoveMap())
               {
                  m_stBattleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_stSkillEffect,stGrid.m_iXGridNo,stGrid.m_iYGridNo);
               }
            }
         }
      }
      
      private function ApplyBuff(srcID:String, target:a_3953) : void
      {
         var centerGrid:a_3491 = this.stFieldGrid;
         if(!centerGrid || !target.stFieldGrid)
         {
            return;
         }
         var dx:int = Math.abs(centerGrid.m_iXGridNo - target.stFieldGrid.m_iXGridNo);
         var dy:int = Math.abs(centerGrid.m_iYGridNo - target.stFieldGrid.m_iYGridNo);
         var maxDist:int = Math.max(dx,dy);
         var rate:Number = this.m_AddAttackValue;
         if(maxDist >= 2)
         {
            rate *= m_iSkillDegree >= 11 ? 0.75 : 0.5;
         }
         target.AddAttackBuffFromSource(srcID,rate);
         this.addHurtEffectFunc(target);
         this.m_dicTargetsWithEffect[target.m_iDefenseGlobalID] = target;
      }
      
      private function recoverHurt() : void
      {
         var target:a_3953 = null;
         for each(target in this.m_dicTargetsWithEffect)
         {
            if(Boolean(target) && target.m_stAddHurtEffect != null)
            {
               target.m_stAddHurtEffect.a_3940();
               target.m_stAddHurtEffect = null;
            }
         }
         this.m_dicTargetsWithEffect = new Dictionary();
      }
      
      private function OnOutOfRange(srcID:String, target:a_3953) : void
      {
         if(!target)
         {
            return;
         }
         if(target.m_stAddHurtEffect != null)
         {
            target.m_stAddHurtEffect.a_3940();
            target.m_stAddHurtEffect = null;
         }
         delete this.m_dicTargetsWithEffect[target.m_iDefenseGlobalID];
      }
      
      private function addHurtEffectFunc(stAttackFighter:a_3953) : void
      {
         var grid:a_3491 = null;
         var stAddHurtEffect:AddHurtEffect = null;
         var offsetX:Number = NaN;
         if(stAttackFighter != null && stAttackFighter.m_stAddHurtEffect == null)
         {
            grid = stAttackFighter.stFieldGrid;
            stAddHurtEffect = AddHurtEffect.a_3926();
            stAddHurtEffect.a_1797(false);
            offsetX = stAttackFighter.stDisplayBitmap.x + stAttackFighter.width * 0.5;
            if(stAttackFighter.IsReversed())
            {
               offsetX = -stAttackFighter.stDisplayBitmap.x - stAttackFighter.width * 0.5;
            }
            stAddHurtEffect.x = stAttackFighter.x + offsetX;
            stAddHurtEffect.y = stAttackFighter.y;
            grid.m_stCurrentBattbleFieldView.AddToBattleView(stAddHurtEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,grid);
            stAttackFighter.m_stAddHurtEffect = stAddHurtEffect;
            if(m_stBattleFieldView.GetGameMoveMap())
            {
               m_stBattleFieldView.GetGameMoveMap().AddMoveDisplayObject(stAddHurtEffect,grid.m_iXGridNo,grid.m_iYGridNo);
            }
         }
      }
      
      override public function UseSkill(iRandomNum:int) : void
      {
         super.UseSkill(iRandomNum);
      }
      
      override public function GetSkillCostCoolingTime() : uint
      {
         return 0;
      }
      
      protected function GetSkillEffectRateValue() : Number
      {
         var arrEffectRate:Array = [0.24,0.26,0.28,0.3,0.32,0.35,0.38,0.41,0.44,0.47,0.5,0.55,0.6,0.65,0.7,0.75];
         return m_iSkillDegree >= 0 && m_iSkillDegree < arrEffectRate.length ? Number(arrEffectRate[m_iSkillDegree]) : 0;
      }
   }
}

