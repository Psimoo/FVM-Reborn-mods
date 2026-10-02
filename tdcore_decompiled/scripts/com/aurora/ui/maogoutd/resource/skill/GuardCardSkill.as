package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.AddBloodEffect;
   
   public class GuardCardSkill extends BaseSkill
   {
      
      public function GuardCardSkill()
      {
         super();
      }
      
      public static function a_3926() : GuardCardSkill
      {
         return PoolManager.getInstance().CheckOutOne(GuardCardSkill) as GuardCardSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stAddBloodEffect:AddBloodEffect = null;
         var stFieldGridVector:Array = null;
         var stAvatarFieldGrid:a_3491 = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         super.OnTimeInterval(iTimeNum);
         if(iTimeNum % 20 == 0)
         {
            if(Boolean(m_stBaseAvatar) && Boolean(m_stBaseAvatar.stFieldGrid))
            {
               stFieldGridVector = m_stBattleFieldView.stFieldGridsVector;
               stAvatarFieldGrid = m_stBaseAvatar.stFieldGrid;
               yStart = stAvatarFieldGrid.m_iYGridNo - 1 < 0 ? 0 : int(stAvatarFieldGrid.m_iYGridNo - 1);
               xStart = stAvatarFieldGrid.m_iXGridNo - 1 < 0 ? 0 : int(stAvatarFieldGrid.m_iXGridNo - 1);
               yEnd = stAvatarFieldGrid.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(stAvatarFieldGrid.m_iYGridNo + 1);
               xEnd = stAvatarFieldGrid.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(stAvatarFieldGrid.m_iXGridNo + 1);
               for(yIndex = yStart; yIndex <= yEnd; yIndex++)
               {
                  for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                  {
                     stFieldGrid = stFieldGridVector[yIndex][xIndex];
                     if(null != stFieldGrid.m_stProtector && stFieldGrid.m_stProtector.iLifeValue < this.GetSkillEffect())
                     {
                        stFieldGrid.m_stProtector.a_3969(-10);
                        stAddBloodEffect = AddBloodEffect.a_3926();
                        stAddBloodEffect.a_1797(!m_stBattleFieldView.isOwnBattleField);
                        stAddBloodEffect.x = stFieldGrid.m_stProtector.x;
                        stAddBloodEffect.y = stFieldGrid.m_stProtector.y;
                        m_stBattleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stFieldGrid);
                     }
                     if(null != stFieldGrid.m_stAttackFighter && stFieldGrid.m_stAttackFighter.iLifeValue < this.GetSkillEffect())
                     {
                        stFieldGrid.m_stAttackFighter.a_3969(-10);
                        stAddBloodEffect = AddBloodEffect.a_3926();
                        stAddBloodEffect.a_1797(!m_stBattleFieldView.isOwnBattleField);
                        stAddBloodEffect.x = stFieldGrid.m_stAttackFighter.x;
                        stAddBloodEffect.y = stFieldGrid.m_stAttackFighter.y;
                        m_stBattleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stFieldGrid);
                     }
                     if(null != stFieldGrid.m_stBoomDefense && stFieldGrid.m_stBoomDefense.iLifeValue < this.GetSkillEffect())
                     {
                        stFieldGrid.m_stBoomDefense.a_3969(-10);
                        stAddBloodEffect = AddBloodEffect.a_3926();
                        stAddBloodEffect.a_1797(!m_stBattleFieldView.isOwnBattleField);
                        stAddBloodEffect.x = stFieldGrid.m_stBoomDefense.x;
                        stAddBloodEffect.y = stFieldGrid.m_stBoomDefense.y;
                        m_stBattleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stFieldGrid);
                     }
                     if(null != stFieldGrid.m_stFlowerDefense && stFieldGrid.m_stFlowerDefense.iLifeValue < this.GetSkillEffect())
                     {
                        stFieldGrid.m_stFlowerDefense.a_3969(-10);
                        stAddBloodEffect = AddBloodEffect.a_3926();
                        stAddBloodEffect.a_1797(!m_stBattleFieldView.isOwnBattleField);
                        stAddBloodEffect.x = stFieldGrid.m_stFlowerDefense.x;
                        stAddBloodEffect.y = stFieldGrid.m_stFlowerDefense.y;
                        m_stBattleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stFieldGrid);
                     }
                     if(null != stFieldGrid.m_stBaseAuxiliaryFighter && stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue < this.GetSkillEffect())
                     {
                        stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(-10);
                        stAddBloodEffect = AddBloodEffect.a_3926();
                        stAddBloodEffect.a_1797(!m_stBattleFieldView.isOwnBattleField);
                        stAddBloodEffect.x = stFieldGrid.m_stBaseAuxiliaryFighter.x;
                        stAddBloodEffect.y = stFieldGrid.m_stBaseAuxiliaryFighter.y;
                        m_stBattleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stFieldGrid);
                     }
                     if(null != stFieldGrid.m_stTrayDefense && stFieldGrid.m_stTrayDefense.iLifeValue < this.GetSkillEffect())
                     {
                        stFieldGrid.m_stTrayDefense.a_3969(-10);
                        stAddBloodEffect = AddBloodEffect.a_3926();
                        stAddBloodEffect.a_1797(!m_stBattleFieldView.isOwnBattleField);
                        stAddBloodEffect.x = stFieldGrid.m_stTrayDefense.x;
                        stAddBloodEffect.y = stFieldGrid.m_stTrayDefense.y;
                        m_stBattleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stFieldGrid);
                     }
                  }
               }
            }
         }
      }
      
      override public function GetSkillCostCoolingTime() : uint
      {
         return 1;
      }
      
      override public function UseSkill(iRandomNum:int) : void
      {
         super.UseSkill(iRandomNum);
      }
      
      protected function GetSkillEffect() : Number
      {
         var numAddLifeValue:Number = 0.5;
         if(m_iSkillDegree == 1)
         {
            numAddLifeValue = 1;
         }
         else if(m_iSkillDegree == 2)
         {
            numAddLifeValue = 1.5;
         }
         else if(m_iSkillDegree == 3)
         {
            numAddLifeValue = 2;
         }
         else if(m_iSkillDegree == 4)
         {
            numAddLifeValue = 3;
         }
         else if(m_iSkillDegree == 5)
         {
            numAddLifeValue = 4;
         }
         else if(m_iSkillDegree == 6)
         {
            numAddLifeValue = 5;
         }
         else if(m_iSkillDegree == 7)
         {
            numAddLifeValue = 7;
         }
         else if(m_iSkillDegree == 8)
         {
            numAddLifeValue = 9;
         }
         else if(m_iSkillDegree == 9)
         {
            numAddLifeValue = 12;
         }
         else if(m_iSkillDegree == 10)
         {
            numAddLifeValue = 15;
         }
         return 50 + 10 * numAddLifeValue;
      }
   }
}

