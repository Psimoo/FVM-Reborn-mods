package com.aurora.ui.maogoutd.resource.avatar.effects.masterShield
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.AttackBuffManager;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkill;
   
   public class GodHuEyeSkill extends BaseSkill
   {
      
      private var m_stSkillEffect:GodHuEyeSkillEffect;
      
      public function GodHuEyeSkill()
      {
         super();
      }
      
      public static function a_3926() : GodHuEyeSkill
      {
         return PoolManager.getInstance().CheckOutOne(GodHuEyeSkill) as GodHuEyeSkill;
      }
      
      override public function a_4330() : void
      {
         this.ClearSkillEffect();
         super.a_4330();
      }
      
      private function ClearSkillEffect() : void
      {
         if(this.m_stSkillEffect)
         {
            this.m_stSkillEffect.a_3940();
            this.m_stSkillEffect = null;
         }
         if(sourceID != "")
         {
            AttackBuffManager.instance.RemoveBuffBySource(sourceID);
         }
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         if(m_stBaseAvatar)
         {
            sourceID = m_uiSkillID + "_" + (m_stBaseAvatar.m_isMyPlaced ? "MySkill" : "OtherSkill");
         }
         m_uiSkillCoolingTime = 40;
         this.ClearSkillEffect();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         super.OnTimeInterval(iTimeNum);
         if(null != this.m_stSkillEffect)
         {
            this.m_stSkillEffect.OnTimeInterval(iTimeNum);
         }
         else if(AvatarIsOk)
         {
            this.RealeaseSkillEffect();
         }
         if(iTimeNum % GetSkillCoolingTime() == 0 && AvatarIsOk && null != m_stBattleFieldView)
         {
            this.RealeaseSkill();
         }
      }
      
      private function RealeaseSkillEffect() : void
      {
         this.ClearSkillEffect();
         var stFieldGrid:a_3491 = m_stBaseAvatar.stFieldGrid;
         this.m_stSkillEffect = GodHuEyeSkillEffect.a_3926();
         this.m_stSkillEffect.a_1797(!m_stBattleFieldView.isOwnBattleField);
         this.m_stSkillEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - this.m_stSkillEffect.width);
         if(!m_stBattleFieldView.isOwnBattleField)
         {
            this.m_stSkillEffect.x = BattleFieldView.a_1013 - this.m_stSkillEffect.x;
         }
         this.m_stSkillEffect.y = 10 + stFieldGrid.m_iYGridNo * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - this.m_stSkillEffect.height);
         m_stBattleFieldView.AddToBattleView(this.m_stSkillEffect,BattleLayerDefine.EFFECTS_BASE_TYPE);
         if(m_stBattleFieldView.GetGameMoveMap())
         {
            m_stBattleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_stSkillEffect,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         }
      }
      
      private function RealeaseSkill() : void
      {
         var stFieldGrid:a_3491 = m_stBaseAvatar.stFieldGrid;
         if(!stFieldGrid || sourceID == "")
         {
            return;
         }
         AttackBuffManager.instance.UpdateBuffRange(sourceID,stFieldGrid,2,2,null,this.ApplySkillBuff,true);
      }
      
      private function ApplySkillBuff(sourceID:String, target:a_3953) : void
      {
         var centerGrid:a_3491 = m_stBaseAvatar.stFieldGrid;
         if(!centerGrid || !target.stFieldGrid)
         {
            return;
         }
         var dx:int = Math.abs(centerGrid.m_iXGridNo - target.stFieldGrid.m_iXGridNo);
         var dy:int = Math.abs(centerGrid.m_iYGridNo - target.stFieldGrid.m_iYGridNo);
         var maxDist:int = Math.max(dx,dy);
         var rate:Number = this.GetSkillEffectRateValue();
         if(maxDist >= 2)
         {
            rate *= 0.5;
         }
         target.AddAttackBuffFromSource(sourceID,rate);
      }
      
      override public function UseSkill(iRandomNum:int) : void
      {
         super.UseSkill(iRandomNum);
      }
      
      override public function GetSkillCostCoolingTime() : uint
      {
         return 0;
      }
      
      private function GetSkillEffectRateValue() : Number
      {
         var fEffectRateValue:Number = 0.07;
         switch(m_iSkillDegree)
         {
            case 0:
               fEffectRateValue = 0.07;
               break;
            case 1:
               fEffectRateValue = 0.08;
               break;
            case 2:
               fEffectRateValue = 0.09;
               break;
            case 3:
               fEffectRateValue = 0.11;
               break;
            case 4:
               fEffectRateValue = 0.14;
               break;
            case 5:
               fEffectRateValue = 0.17;
               break;
            case 6:
               fEffectRateValue = 0.2;
               break;
            case 7:
               fEffectRateValue = 0.23;
               break;
            case 8:
               fEffectRateValue = 0.26;
               break;
            case 9:
               fEffectRateValue = 0.29;
               break;
            case 10:
               fEffectRateValue = 0.32;
               break;
            case 11:
               fEffectRateValue = 0.35;
               break;
            case 12:
               fEffectRateValue = 0.38;
               break;
            case 13:
               fEffectRateValue = 0.42;
               break;
            case 14:
               fEffectRateValue = 0.46;
               break;
            case 15:
               fEffectRateValue = 0.5;
               break;
            default:
               throw Error("GetSkillEffectRateValue::星级越界！！！");
         }
         return fEffectRateValue;
      }
   }
}

