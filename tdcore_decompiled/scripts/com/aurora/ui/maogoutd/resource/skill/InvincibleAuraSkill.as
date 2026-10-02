package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.AddBloodEffect;
   
   public class InvincibleAuraSkill extends BaseSkill
   {
      
      private var m_stInvincibleAuraSkillEffectConch:InvincibleAuraSkillEffectConch;
      
      private var m_iEffectContinueTime:int;
      
      private var m_stInvincibleAuraSkillTextEffect:InvincibleAuraSkillTextEffect;
      
      public function InvincibleAuraSkill()
      {
         super();
      }
      
      public static function a_3926() : InvincibleAuraSkill
      {
         return PoolManager.getInstance().CheckOutOne(InvincibleAuraSkill) as InvincibleAuraSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         m_uiSkillCoolingTime = 2400 - this.GetSkillCoolingReduceTime();
         this.m_iEffectContinueTime = this.GetSkillEffectContinueTime();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stAddBloodEffect:AddBloodEffect = null;
         var iYIndex:int = 0;
         var iXIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         super.OnTimeInterval(iTimeNum);
         if(iTimeNum - m_uiStartCoolingTime < 90)
         {
            if(this.m_stInvincibleAuraSkillEffectConch)
            {
               this.m_stInvincibleAuraSkillEffectConch.OnTimeInterval(iTimeNum);
            }
         }
         else if(iTimeNum - m_uiStartCoolingTime == 90)
         {
            if(this.m_stInvincibleAuraSkillEffectConch)
            {
               this.m_stInvincibleAuraSkillEffectConch.a_3940();
               this.m_stInvincibleAuraSkillEffectConch = null;
            }
         }
         if(iTimeNum > m_uiSkillCoolingTime - 20 && iTimeNum - m_uiStartCoolingTime <= this.m_iEffectContinueTime && Boolean((iTimeNum - m_uiStartCoolingTime) % 4))
         {
            for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
            {
               for(iXIndex = 0; iXIndex < BattleFieldView.a_1011; iXIndex++)
               {
                  stFieldGrid = m_stBattleFieldView.a_3438(iXIndex,iYIndex);
                  if(Boolean(stFieldGrid.m_stAttackFighter) && stFieldGrid.m_stAttackFighter.iLifeValue < 50)
                  {
                     stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue - 50);
                     stAddBloodEffect = AddBloodEffect.a_3926();
                     stAddBloodEffect.a_1797(!m_stBattleFieldView.isOwnBattleField);
                     stAddBloodEffect.x = stFieldGrid.m_stAttackFighter.x;
                     stAddBloodEffect.y = stFieldGrid.m_stAttackFighter.y;
                     m_stBattleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stFieldGrid);
                  }
                  if(Boolean(stFieldGrid.m_stProtector) && stFieldGrid.m_stProtector.iLifeValue < 50)
                  {
                     stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue - 50);
                     stAddBloodEffect = AddBloodEffect.a_3926();
                     stAddBloodEffect.a_1797(!m_stBattleFieldView.isOwnBattleField);
                     stAddBloodEffect.x = stFieldGrid.m_stProtector.x;
                     stAddBloodEffect.y = stFieldGrid.m_stProtector.y;
                     m_stBattleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stFieldGrid);
                  }
                  if(Boolean(stFieldGrid.m_stTrayDefense) && stFieldGrid.m_stTrayDefense.iLifeValue < 50)
                  {
                     stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue - 50);
                     stAddBloodEffect = AddBloodEffect.a_3926();
                     stAddBloodEffect.a_1797(!m_stBattleFieldView.isOwnBattleField);
                     stAddBloodEffect.x = stFieldGrid.m_stTrayDefense.x;
                     stAddBloodEffect.y = stFieldGrid.m_stTrayDefense.y;
                     m_stBattleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stFieldGrid);
                  }
                  if(Boolean(stFieldGrid.m_stBoomDefense) && stFieldGrid.m_stBoomDefense.iLifeValue < 50)
                  {
                     stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue - 50);
                     stAddBloodEffect = AddBloodEffect.a_3926();
                     stAddBloodEffect.a_1797(!m_stBattleFieldView.isOwnBattleField);
                     stAddBloodEffect.x = stFieldGrid.m_stBoomDefense.x;
                     stAddBloodEffect.y = stFieldGrid.m_stBoomDefense.y;
                     m_stBattleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stFieldGrid);
                  }
                  if(Boolean(stFieldGrid.m_stFlowerDefense) && stFieldGrid.m_stFlowerDefense.iLifeValue < 50)
                  {
                     stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue - 50);
                     stAddBloodEffect = AddBloodEffect.a_3926();
                     stAddBloodEffect.a_1797(!m_stBattleFieldView.isOwnBattleField);
                     stAddBloodEffect.x = stFieldGrid.m_stFlowerDefense.x;
                     stAddBloodEffect.y = stFieldGrid.m_stFlowerDefense.y;
                     m_stBattleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stFieldGrid);
                  }
                  if(Boolean(stFieldGrid.m_stBaseAuxiliaryFighter) && stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue < 50)
                  {
                     stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue - 50);
                     stAddBloodEffect = AddBloodEffect.a_3926();
                     stAddBloodEffect.a_1797(!m_stBattleFieldView.isOwnBattleField);
                     stAddBloodEffect.x = stFieldGrid.m_stBaseAuxiliaryFighter.x;
                     stAddBloodEffect.y = stFieldGrid.m_stBaseAuxiliaryFighter.y;
                     m_stBattleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stFieldGrid);
                  }
                  if(Boolean(stFieldGrid.m_stBaseToolDefense) && stFieldGrid.m_stBaseToolDefense.iLifeValue < 50)
                  {
                     stFieldGrid.m_stBaseToolDefense.a_3969(stFieldGrid.m_stBaseToolDefense.iLifeValue - 50);
                     stAddBloodEffect = AddBloodEffect.a_3926();
                     stAddBloodEffect.a_1797(!m_stBattleFieldView.isOwnBattleField);
                     stAddBloodEffect.x = stFieldGrid.m_stBaseToolDefense.x;
                     stAddBloodEffect.y = stFieldGrid.m_stBaseToolDefense.y;
                     m_stBattleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stFieldGrid);
                  }
               }
            }
         }
         if(this.m_stInvincibleAuraSkillTextEffect)
         {
            this.m_stInvincibleAuraSkillTextEffect.OnTimeInterval(iTimeNum);
            if(this.m_stInvincibleAuraSkillTextEffect.iCurrentFrame == this.m_stInvincibleAuraSkillTextEffect.iTotalFrames)
            {
               this.m_stInvincibleAuraSkillTextEffect.a_3940();
               this.m_stInvincibleAuraSkillTextEffect = null;
            }
         }
      }
      
      override public function UseSkill(iRandomNum:int) : void
      {
         this.m_stInvincibleAuraSkillTextEffect = InvincibleAuraSkillTextEffect.a_3926();
         this.m_stInvincibleAuraSkillTextEffect.a_1797(false);
         this.m_stInvincibleAuraSkillTextEffect.x = (BattleFieldView.a_1013 - this.m_stInvincibleAuraSkillTextEffect.width) * 0.5;
         this.m_stInvincibleAuraSkillTextEffect.y = 20;
         m_stBattleFieldView.addChild(this.m_stInvincibleAuraSkillTextEffect);
         super.UseSkill(iRandomNum);
         this.m_stInvincibleAuraSkillEffectConch = InvincibleAuraSkillEffectConch.a_3926();
         if(m_stBattleFieldView)
         {
            this.m_stInvincibleAuraSkillEffectConch.a_1797(!m_stBattleFieldView.isOwnBattleField);
            this.m_stInvincibleAuraSkillEffectConch.x = 230;
            this.m_stInvincibleAuraSkillEffectConch.y = 0;
            m_stBattleFieldView.addChild(this.m_stInvincibleAuraSkillEffectConch);
         }
      }
      
      override public function a_4330() : void
      {
         super.a_4330();
         if(this.m_stInvincibleAuraSkillEffectConch)
         {
            this.m_stInvincibleAuraSkillEffectConch.a_3940();
            this.m_stInvincibleAuraSkillEffectConch = null;
         }
      }
      
      protected function GetSkillCoolingReduceTime() : int
      {
         return 0;
      }
      
      protected function GetSkillEffectContinueTime() : int
      {
         var iEffectValue:Number = 2;
         if(m_iSkillDegree == 1)
         {
            iEffectValue = 3;
         }
         else if(m_iSkillDegree == 2)
         {
            iEffectValue = 4;
         }
         else if(m_iSkillDegree == 3)
         {
            iEffectValue = 5.5;
         }
         else if(m_iSkillDegree == 4)
         {
            iEffectValue = 7;
         }
         else if(m_iSkillDegree == 5)
         {
            iEffectValue = 8.5;
         }
         else if(m_iSkillDegree == 6)
         {
            iEffectValue = 10.5;
         }
         else if(m_iSkillDegree == 7)
         {
            iEffectValue = 12.5;
         }
         else if(m_iSkillDegree == 8)
         {
            iEffectValue = 14.5;
         }
         else if(m_iSkillDegree == 9)
         {
            iEffectValue = 17;
         }
         else if(m_iSkillDegree == 10)
         {
            iEffectValue = 19.5;
         }
         return 20 * iEffectValue;
      }
   }
}

