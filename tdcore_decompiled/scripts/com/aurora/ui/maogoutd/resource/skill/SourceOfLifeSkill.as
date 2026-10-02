package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.defender.a_3971;
   
   public class SourceOfLifeSkill extends BaseSkill
   {
      
      private var m_stSkillEffect:SourceOfLifeSkillEffect;
      
      private var m_isSkillUsed:Boolean = false;
      
      private var m_vSkillUsed:Vector.<Vector.<Boolean>>;
      
      public function SourceOfLifeSkill()
      {
         var tmp:Vector.<Boolean> = null;
         var j:int = 0;
         super();
         this.m_vSkillUsed = new Vector.<Vector.<Boolean>>();
         for(var i:int = 0; i < BattleFieldView.a_1012; i++)
         {
            tmp = new Vector.<Boolean>();
            for(j = 0; j < BattleFieldView.a_1011; j++)
            {
               tmp.push(false);
            }
            this.m_vSkillUsed.push(tmp);
         }
      }
      
      public static function a_3926() : SourceOfLifeSkill
      {
         return PoolManager.getInstance().CheckOutOne(SourceOfLifeSkill) as SourceOfLifeSkill;
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
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         m_uiSkillCoolingTime = 40;
         this.m_isSkillUsed = false;
         this.ClearSkillEffect();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var addLifeValue:int = 0;
         super.OnTimeInterval(iTimeNum);
         if(null != this.m_stSkillEffect)
         {
            this.m_stSkillEffect.OnTimeInterval(iTimeNum);
         }
         else if(AvatarIsOk)
         {
            this.RealeaseSkillEffect();
         }
         if(!this.m_isSkillUsed && iTimeNum % m_uiSkillCoolingTime == 0)
         {
            if(Boolean(m_stBaseAvatar) && Boolean(m_stBaseAvatar.stFieldGrid))
            {
               addLifeValue = m_stBaseAvatar.a_1339 * this.GetSkillEffectRateValue();
               m_stBaseAvatar.a_3969(-1 * addLifeValue);
               this.m_isSkillUsed = true;
            }
         }
         if(iTimeNum % m_uiSkillCoolingTime == 0 && AvatarIsOk && null != m_stBattleFieldView)
         {
            this.RealeaseSkill();
         }
      }
      
      private function RealeaseSkillEffect() : void
      {
         this.ClearSkillEffect();
         var stFieldGrid:a_3491 = m_stBaseAvatar.stFieldGrid;
         this.m_stSkillEffect = SourceOfLifeSkillEffect.a_3926();
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
         var iYGridNo:int = 0;
         var stAttackFighter:a_3953 = null;
         var stFlowerDefense:a_3971 = null;
         var addLifeValue:int = 0;
         var stFieldGrid:a_3491 = m_stBaseAvatar.stFieldGrid;
         var iXCenterGridNo:int = stFieldGrid.m_iXGridNo;
         var iYCenterGridNo:int = stFieldGrid.m_iYGridNo;
         var iAttackRange:int = 2;
         var iStartXGridNo:int = Math.max(iXCenterGridNo - iAttackRange,0);
         var iStartYGridNo:int = Math.max(iYCenterGridNo - iAttackRange,0);
         var iEndXGridNo:int = Math.min(iXCenterGridNo + iAttackRange,BattleFieldView.a_1011 - 1);
         var iEndYGridNo:int = Math.min(iYCenterGridNo + iAttackRange,BattleFieldView.a_1012 - 1);
         var stFieldGridsVector:Array = m_stBattleFieldView.stFieldGridsVector;
         for(var iXGridNo:int = iStartXGridNo; iXGridNo <= iEndXGridNo; iXGridNo++)
         {
            for(iYGridNo = iStartYGridNo; iYGridNo <= iEndYGridNo; iYGridNo++)
            {
               stAttackFighter = (stFieldGridsVector[iYGridNo][iXGridNo] as a_3491).m_stAttackFighter;
               stFlowerDefense = (stFieldGridsVector[iYGridNo][iXGridNo] as a_3491).m_stFlowerDefense;
               if(!this.m_vSkillUsed[iYGridNo][iXGridNo])
               {
                  addLifeValue = 0;
                  if(null != stAttackFighter && !(stAttackFighter is a_3924))
                  {
                     this.m_vSkillUsed[iYGridNo][iXGridNo] = true;
                     addLifeValue = stAttackFighter.a_1339 * this.GetSkillEffectRateValue();
                     stAttackFighter.a_3969(-1 * addLifeValue);
                  }
                  if(null != stFlowerDefense)
                  {
                     this.m_vSkillUsed[iYGridNo][iXGridNo] = true;
                     addLifeValue = stFlowerDefense.a_1339 * this.GetSkillEffectRateValue();
                     stFlowerDefense.a_3969(-1 * addLifeValue);
                  }
               }
               else if(null == stAttackFighter && null == stFlowerDefense)
               {
                  this.m_vSkillUsed[iYGridNo][iXGridNo] = false;
               }
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
      
      private function GetSkillEffectRateValue() : Number
      {
         var fEffectRateValue:Number = 0.1;
         switch(m_iSkillDegree)
         {
            case 0:
               fEffectRateValue = 0.15;
               break;
            case 1:
               fEffectRateValue = 0.2;
               break;
            case 2:
               fEffectRateValue = 0.25;
               break;
            case 3:
               fEffectRateValue = 0.3;
               break;
            case 4:
               fEffectRateValue = 0.35;
               break;
            case 5:
               fEffectRateValue = 0.4;
               break;
            case 6:
               fEffectRateValue = 0.45;
               break;
            case 7:
               fEffectRateValue = 0.5;
               break;
            case 8:
               fEffectRateValue = 0.55;
               break;
            case 9:
               fEffectRateValue = 0.6;
               break;
            case 10:
               fEffectRateValue = 0.65;
               break;
            case 11:
               fEffectRateValue = 0.7;
               break;
            case 12:
               fEffectRateValue = 0.75;
               break;
            case 13:
               fEffectRateValue = 0.8;
               break;
            case 14:
               fEffectRateValue = 0.85;
               break;
            case 15:
               fEffectRateValue = 0.95;
               break;
            default:
               throw Error("GetSkillEffectRateValue::星级越界！！！");
         }
         return fEffectRateValue;
      }
   }
}

