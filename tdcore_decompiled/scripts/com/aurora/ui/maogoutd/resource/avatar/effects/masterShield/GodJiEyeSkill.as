package com.aurora.ui.maogoutd.resource.avatar.effects.masterShield
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkill;
   
   public class GodJiEyeSkill extends BaseSkill
   {
      
      private static const MAX_REDUCELIFE:int = 3000;
      
      private var m_stSkillEffect:GodJiEyeSkillEffect;
      
      public function GodJiEyeSkill()
      {
         super();
      }
      
      public static function a_3926() : GodJiEyeSkill
      {
         return PoolManager.getInstance().CheckOutOne(GodJiEyeSkill) as GodJiEyeSkill;
      }
      
      override public function a_4330() : void
      {
         this.ClearSkillEffect();
         super.a_4330();
      }
      
      private function ClearSkillEffect() : void
      {
         if(null != this.m_stSkillEffect)
         {
            this.m_stSkillEffect.a_3940();
            this.m_stSkillEffect = null;
         }
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         m_uiSkillCoolingTime = 50;
         this.ClearSkillEffect();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         super.OnTimeInterval(iTimeNum);
         if(null != this.m_stSkillEffect)
         {
            this.m_stSkillEffect.OnTimeInterval(iTimeNum);
         }
         if(null == this.m_stSkillEffect && iTimeNum >= 20 && AvatarIsOk)
         {
            this.RealeaseSkillEffect();
         }
         if(iTimeNum % GetSkillCoolingTime() == 0 && AvatarIsOk && null != m_stBattleFieldView)
         {
            this.RealeaseSkillAttack();
         }
      }
      
      private function RealeaseSkillEffect() : void
      {
         this.ClearSkillEffect();
         var stFieldGrid:a_3491 = m_stBaseAvatar.stFieldGrid;
         this.m_stSkillEffect = GodJiEyeSkillEffect.a_3926();
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
      
      private function RealeaseSkillAttack() : void
      {
         var iYGridNo:int = 0;
         var arrMoveIntruder:Array = null;
         var stBaseMoveIntruder:a_4206 = null;
         var iReduceLife:int = 0;
         var stFieldGrid:a_3491 = m_stBaseAvatar.stFieldGrid;
         var iAttackRange:int = 2;
         var iStartXGridNo:int = Math.max(stFieldGrid.m_iXGridNo - iAttackRange,0);
         var iStartYGridNo:int = Math.max(stFieldGrid.m_iYGridNo - iAttackRange,0);
         var iEndXGridNo:int = Math.min(stFieldGrid.m_iXGridNo + iAttackRange,BattleFieldView.a_1011 - 1);
         var iEndYGridNo:int = Math.min(stFieldGrid.m_iYGridNo + iAttackRange,BattleFieldView.a_1012 - 1);
         var stFieldGridsVector:Array = m_stBattleFieldView.stFieldGridsVector;
         for(var iXGridNo:int = iStartXGridNo; iXGridNo <= iEndXGridNo; iXGridNo++)
         {
            for(iYGridNo = iStartYGridNo; iYGridNo <= iEndYGridNo; iYGridNo++)
            {
               arrMoveIntruder = stFieldGridsVector[iYGridNo][iXGridNo].a_1511.slice();
               for each(stBaseMoveIntruder in arrMoveIntruder)
               {
                  if(stBaseMoveIntruder.iLifeValue > 0)
                  {
                     iReduceLife = this.GetSkillEffectValue() + stBaseMoveIntruder.iLifeValue * this.GetSkillEffectRateValue();
                     if(iReduceLife > MAX_REDUCELIFE)
                     {
                        iReduceLife = MAX_REDUCELIFE;
                     }
                     stBaseMoveIntruder.a_3969(iReduceLife);
                     stBaseMoveIntruder.a_4208(b_182.a_432,1);
                  }
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
         var fEffectRateValue:Number = 0.02;
         switch(m_iSkillDegree)
         {
            case 0:
               fEffectRateValue = 0.02;
               break;
            case 1:
               fEffectRateValue = 0.025;
               break;
            case 2:
               fEffectRateValue = 0.03;
               break;
            case 3:
               fEffectRateValue = 0.04;
               break;
            case 4:
               fEffectRateValue = 0.05;
               break;
            case 5:
               fEffectRateValue = 0.06;
               break;
            case 6:
               fEffectRateValue = 0.08;
               break;
            case 7:
               fEffectRateValue = 0.1;
               break;
            case 8:
               fEffectRateValue = 0.12;
               break;
            case 9:
               fEffectRateValue = 0.15;
               break;
            case 10:
               fEffectRateValue = 0.18;
               break;
            case 11:
               fEffectRateValue = 0.19;
               break;
            case 12:
               fEffectRateValue = 0.2;
               break;
            case 13:
               fEffectRateValue = 0.23;
               break;
            case 14:
               fEffectRateValue = 0.24;
               break;
            case 15:
               fEffectRateValue = 0.26;
               break;
            default:
               throw Error("GetSkillEffectRateValue::星级越界！！！");
         }
         return fEffectRateValue;
      }
      
      private function GetSkillEffectValue() : int
      {
         var iEffectValue:int = 12;
         switch(m_iSkillDegree)
         {
            case 0:
               iEffectValue = 12;
               break;
            case 1:
               iEffectValue = 14;
               break;
            case 2:
               iEffectValue = 16;
               break;
            case 3:
               iEffectValue = 18;
               break;
            case 4:
               iEffectValue = 20;
               break;
            case 5:
               iEffectValue = 22;
               break;
            case 6:
               iEffectValue = 26;
               break;
            case 7:
               iEffectValue = 32;
               break;
            case 8:
               iEffectValue = 40;
               break;
            case 9:
               iEffectValue = 55;
               break;
            case 10:
               iEffectValue = 70;
               break;
            case 11:
               iEffectValue = 85;
               break;
            case 12:
               iEffectValue = 100;
               break;
            case 13:
               iEffectValue = 120;
               break;
            case 14:
               iEffectValue = 140;
               break;
            case 15:
               iEffectValue = 160;
               break;
            default:
               throw Error("GetSkillEffectValue::星级越界！！！");
         }
         return iEffectValue;
      }
   }
}

