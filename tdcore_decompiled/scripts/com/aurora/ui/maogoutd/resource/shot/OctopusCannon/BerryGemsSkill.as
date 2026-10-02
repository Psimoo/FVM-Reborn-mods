package com.aurora.ui.maogoutd.resource.shot.OctopusCannon
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkill;
   
   public class BerryGemsSkill extends BaseSkill
   {
      
      private static var ms_iStartTime:int;
      
      private static const MAX_REDUCELIFE:int = 3000;
      
      private var m_iHurtTime:int;
      
      private var m_stSkillEffect:BerryGemsSkillEffect;
      
      public function BerryGemsSkill()
      {
         super();
      }
      
      public static function a_3926() : BerryGemsSkill
      {
         return PoolManager.getInstance().CheckOutOne(BerryGemsSkill) as BerryGemsSkill;
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
         m_uiSkillCoolingTime = 20 * 20;
         ms_iStartTime = -1;
         this.m_iHurtTime = 0;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         super.OnTimeInterval(iTimeNum);
         if(ms_iStartTime == -1)
         {
            ms_iStartTime = iTimeNum;
         }
         if(null != this.m_stSkillEffect)
         {
            this.m_stSkillEffect.OnTimeInterval(iTimeNum);
         }
         if(null != this.m_stSkillEffect && (iTimeNum - ms_iStartTime) % this.GetDurationValue() == 0 && AvatarIsOk && null != m_stBattleFieldView)
         {
            this.ClearSkillEffect();
         }
         if((iTimeNum - ms_iStartTime) % m_uiSkillCoolingTime == 0 && AvatarIsOk && null != m_stBattleFieldView)
         {
            this.addSkillEffect();
            ms_iStartTime = iTimeNum;
            this.m_iHurtTime = 0;
         }
         var m_iShotIntervalTime:int = Math.floor(this.GetDurationValue() / this.GetHurtTimes() + 0.5);
         if((iTimeNum - ms_iStartTime) % m_iShotIntervalTime == 0 && AvatarIsOk && null != m_stBattleFieldView)
         {
            if(null != this.m_stSkillEffect && this.m_iHurtTime < this.GetHurtTimes())
            {
               ++this.m_iHurtTime;
               trace("莓果宝石第" + this.m_iHurtTime + "次伤害");
               this.SkillAttack();
            }
         }
      }
      
      private function addSkillEffect() : void
      {
         var stFieldGrid:a_3491 = m_stBaseAvatar.stFieldGrid;
         this.m_stSkillEffect = BerryGemsSkillEffect.a_3926();
         this.m_stSkillEffect.a_1797(!m_stBattleFieldView.isOwnBattleField);
         this.m_stSkillEffect.x = 8 * a_3491.a_1080;
         if(!m_stBattleFieldView.isOwnBattleField)
         {
            this.m_stSkillEffect.x = BattleFieldView.a_1013 - this.m_stSkillEffect.x;
         }
         this.m_stSkillEffect.y = 0 * a_3491.a_1081;
         m_stBattleFieldView.AddToBattleView(this.m_stSkillEffect,BattleLayerDefine.EFFECTS_BASE_TYPE);
         if(m_stBattleFieldView.GetGameMoveMap())
         {
            m_stBattleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_stSkillEffect,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         }
      }
      
      private function SkillAttack() : void
      {
         var iYGridNo:int = 0;
         var arrMoveIntruder:Array = null;
         var stBaseMoveIntruder:a_4206 = null;
         var iReduceLife:int = 0;
         var stFieldGrid:a_3491 = m_stBaseAvatar.stFieldGrid;
         var iAttackRange:int = 2;
         var iStartXGridNo:int = BattleFieldView.a_1011 - 1;
         var iStartYGridNo:int = 0;
         var iEndXGridNo:int = BattleFieldView.a_1011 - 1;
         var iEndYGridNo:int = BattleFieldView.a_1012 - 1;
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
                     iReduceLife = this.GetHurtRateValue();
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
      
      private function GetHurtRateValue() : Number
      {
         var fEffectRateValue:Number = 0.5;
         switch(m_iSkillDegree)
         {
            case 0:
               fEffectRateValue = 0.5;
               break;
            case 1:
               fEffectRateValue = 0.6;
               break;
            case 2:
               fEffectRateValue = 0.7;
               break;
            case 3:
               fEffectRateValue = 0.8;
               break;
            case 4:
               fEffectRateValue = 0.9;
               break;
            case 5:
               fEffectRateValue = 1;
               break;
            case 6:
               fEffectRateValue = 1.2;
               break;
            case 7:
               fEffectRateValue = 1.5;
               break;
            case 8:
               fEffectRateValue = 2;
               break;
            case 9:
               fEffectRateValue = 2.5;
               break;
            case 10:
               fEffectRateValue = 3;
               break;
            default:
               throw Error("GetSkillEffectRateValue::星级越界！！！");
         }
         return fEffectRateValue * 10;
      }
      
      private function GetDurationValue() : int
      {
         var iEffectValue:int = 3;
         switch(m_iSkillDegree)
         {
            case 0:
               iEffectValue = 3;
               break;
            case 1:
               iEffectValue = 3;
               break;
            case 2:
               iEffectValue = 3;
               break;
            case 3:
               iEffectValue = 3;
               break;
            case 4:
               iEffectValue = 3;
               break;
            case 5:
               iEffectValue = 5;
               break;
            case 6:
               iEffectValue = 5;
               break;
            case 7:
               iEffectValue = 5;
               break;
            case 8:
               iEffectValue = 7;
               break;
            case 9:
               iEffectValue = 7;
               break;
            case 10:
               iEffectValue = 10;
               break;
            default:
               throw Error("GetSkillEffectValue::星级越界！！！");
         }
         return iEffectValue * 20;
      }
      
      private function GetHurtTimes() : int
      {
         var iEffectValue:int = 2;
         switch(m_iSkillDegree)
         {
            case 0:
               iEffectValue = 2;
               break;
            case 1:
               iEffectValue = 2;
               break;
            case 2:
               iEffectValue = 2;
               break;
            case 3:
               iEffectValue = 2;
               break;
            case 4:
               iEffectValue = 2;
               break;
            case 5:
               iEffectValue = 3;
               break;
            case 6:
               iEffectValue = 3;
               break;
            case 7:
               iEffectValue = 3;
               break;
            case 8:
               iEffectValue = 4;
               break;
            case 9:
               iEffectValue = 4;
               break;
            case 10:
               iEffectValue = 5;
               break;
            default:
               throw Error("GetSkillEffectValue::星级越界！！！");
         }
         return iEffectValue;
      }
   }
}

