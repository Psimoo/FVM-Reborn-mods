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
   
   public class RosesHeartSkill extends BaseSkill
   {
      
      private var m_AddAttackValue:Number;
      
      private var stFieldGrid:a_3491;
      
      private var m_dicTargetsWithEffect:Dictionary = new Dictionary();
      
      private var m_stSkillEffect:BaseOriginEffect;
      
      public function RosesHeartSkill()
      {
         super();
      }
      
      public static function a_3926() : RosesHeartSkill
      {
         return PoolManager.getInstance().CheckOutOne(RosesHeartSkill) as RosesHeartSkill;
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
            sourceID = "RosesHeart_" + m_uiSkillID + "_" + (m_stBaseAvatar.m_isMyPlaced ? "MySkill" : "OtherSkill");
            if(this.stFieldGrid != m_stBaseAvatar.stFieldGrid && m_stBaseAvatar.m_bServerIssued && sourceID != "")
            {
               this.recoverHurt();
               this.ClearSkillEffect();
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
            AttackBuffManager.instance.UpdateBuffRange(sourceID,this.stFieldGrid,2,3,null,this.ApplyBuff,true,this.OnOutOfRange);
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
               this.m_stSkillEffect = BattleEffectUtil.CreateOriginEffect(null,RosesHeartOneSkillEffectMovie,stGrid);
            }
            else if(m_iSkillDegree <= 14)
            {
               this.m_stSkillEffect = BattleEffectUtil.CreateOriginEffect(null,RosesHeartTwoSkillEffectMovie,stGrid);
            }
            else if(m_iSkillDegree <= 15)
            {
               this.m_stSkillEffect = BattleEffectUtil.CreateOriginEffect(null,RosesHeartThreeSkillEffectMovie,stGrid);
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
         if(!target)
         {
            return;
         }
         target.AddAttackBuffFromSource(srcID,this.m_AddAttackValue);
         this.RosesHeartAddHurtEffectFunc(target);
         this.m_dicTargetsWithEffect[target.m_iDefenseGlobalID] = target;
      }
      
      private function recoverHurt() : void
      {
         var target:a_3953 = null;
         for each(target in this.m_dicTargetsWithEffect)
         {
            if(Boolean(target) && target.m_stRosesHeartAddHurtEffect != null)
            {
               target.m_stRosesHeartAddHurtEffect.a_3940();
               target.m_stRosesHeartAddHurtEffect = null;
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
         if(target.m_stRosesHeartAddHurtEffect != null)
         {
            target.m_stRosesHeartAddHurtEffect.a_3940();
            target.m_stRosesHeartAddHurtEffect = null;
         }
         delete this.m_dicTargetsWithEffect[target.m_iDefenseGlobalID];
      }
      
      private function RosesHeartAddHurtEffectFunc(stAttackFighter:a_3953) : void
      {
         var grid:a_3491 = null;
         var stRosesHeartAddHurtEffect:RosesHeartAddHurtEffect = null;
         var offsetX:Number = NaN;
         if(stAttackFighter != null && stAttackFighter.m_stRosesHeartAddHurtEffect == null)
         {
            grid = stAttackFighter.stFieldGrid;
            stRosesHeartAddHurtEffect = RosesHeartAddHurtEffect.a_3926();
            stRosesHeartAddHurtEffect.a_1797(false);
            offsetX = stAttackFighter.stDisplayBitmap.x + stAttackFighter.width * 0.5;
            if(stAttackFighter.IsReversed())
            {
               offsetX = -stAttackFighter.stDisplayBitmap.x - stAttackFighter.width * 0.5;
            }
            stRosesHeartAddHurtEffect.x = stAttackFighter.x + offsetX;
            stRosesHeartAddHurtEffect.y = stAttackFighter.y;
            grid.m_stCurrentBattbleFieldView.AddToBattleView(stRosesHeartAddHurtEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,grid);
            stAttackFighter.m_stRosesHeartAddHurtEffect = stRosesHeartAddHurtEffect;
            if(m_stBattleFieldView.GetGameMoveMap())
            {
               m_stBattleFieldView.GetGameMoveMap().AddMoveDisplayObject(stRosesHeartAddHurtEffect,grid.m_iXGridNo,grid.m_iYGridNo);
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
         switch(m_iSkillDegree)
         {
            case 0:
               return 0.31;
            case 1:
               return 0.33;
            case 2:
               return 0.35;
            case 3:
               return 0.37;
            case 4:
               return 0.39;
            case 5:
               return 0.43;
            case 6:
               return 0.47;
            case 7:
               return 0.51;
            case 8:
               return 0.55;
            case 9:
               return 0.59;
            case 10:
               return 0.63;
            case 11:
               return 0.67;
            case 12:
               return 0.71;
            case 13:
               return 0.75;
            case 14:
               return 0.8;
            case 15:
               return 0.85;
            default:
               return 0;
         }
      }
   }
}

