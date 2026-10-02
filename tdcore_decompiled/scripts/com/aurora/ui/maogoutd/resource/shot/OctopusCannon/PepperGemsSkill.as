package com.aurora.ui.maogoutd.resource.shot.OctopusCannon
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.AttackBuffManager;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkill;
   
   public class PepperGemsSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      private var m_stThreeRectEffect:PepperGemsThreeRectSkillEffect;
      
      private var m_stFiveRectEffect:PepperGemsFiveRectSkillEffect;
      
      private var iAttackRange:int = 0;
      
      public function PepperGemsSkill()
      {
         super();
      }
      
      public static function a_3926() : PepperGemsSkill
      {
         return PoolManager.getInstance().CheckOutOne(PepperGemsSkill) as PepperGemsSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         this.m_isSkillUsed = false;
         m_uiSkillCoolingTime = 50;
         if(m_stBaseAvatar)
         {
            sourceID = "PepperGems_" + m_uiSkillID + "_" + (m_stBaseAvatar.m_isMyPlaced ? "MySkill" : "OtherSkill");
         }
         this.ClearSkillEffect();
         this.iAttackRange = m_iSkillDegree == 15 ? 2 : 1;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         super.OnTimeInterval(iTimeNum);
         if(null != this.m_stThreeRectEffect)
         {
            this.m_stThreeRectEffect.OnTimeInterval(iTimeNum);
         }
         else if(null != this.m_stFiveRectEffect)
         {
            this.m_stFiveRectEffect.OnTimeInterval(iTimeNum);
         }
         if(null == this.m_stThreeRectEffect && null == this.m_stFiveRectEffect && iTimeNum >= 20 && AvatarIsOk)
         {
            this.RealeaseSkillEffect();
         }
         if(iTimeNum % GetSkillCoolingTime() == 0 && AvatarIsOk && null != m_stBattleFieldView)
         {
            this.SkillAttack();
         }
         if(iTimeNum % 10 == 0 && AvatarIsOk && null != m_stBattleFieldView)
         {
            this.UpdateAttackBuff();
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
      
      override public function a_4330() : void
      {
         this.ClearSkillEffect();
         super.a_4330();
      }
      
      private function UpdateAttackBuff() : void
      {
         var stFieldGrid:a_3491 = m_stBaseAvatar.stFieldGrid;
         if(!stFieldGrid || sourceID == "")
         {
            return;
         }
         AttackBuffManager.instance.UpdateBuffRange(sourceID,stFieldGrid,this.iAttackRange,this.iAttackRange,null,this.ApplySkillBuff,true);
      }
      
      private function ApplySkillBuff(srcID:String, target:a_3953) : void
      {
         var centerGrid:a_3491 = m_stBaseAvatar.stFieldGrid;
         if(!centerGrid || !target.stFieldGrid)
         {
            return;
         }
         var dx:int = Math.abs(centerGrid.m_iXGridNo - target.stFieldGrid.m_iXGridNo);
         var dy:int = Math.abs(centerGrid.m_iYGridNo - target.stFieldGrid.m_iYGridNo);
         var maxDist:int = Math.max(dx,dy);
         var rate:Number = this.GetPowerRateValue();
         target.AddAttackBuffFromSource(srcID,rate);
      }
      
      private function GetPowerRateValue() : Number
      {
         var fEffectRateValue:Number = 0.05;
         switch(m_iSkillDegree)
         {
            case 0:
               fEffectRateValue = 0.05;
               break;
            case 1:
               fEffectRateValue = 0.06;
               break;
            case 2:
               fEffectRateValue = 0.07;
               break;
            case 3:
               fEffectRateValue = 0.08;
               break;
            case 4:
               fEffectRateValue = 0.09;
               break;
            case 5:
               fEffectRateValue = 0.1;
               break;
            case 6:
               fEffectRateValue = 0.11;
               break;
            case 7:
               fEffectRateValue = 0.12;
               break;
            case 8:
               fEffectRateValue = 0.13;
               break;
            case 9:
               fEffectRateValue = 0.14;
               break;
            case 10:
               fEffectRateValue = 0.15;
               break;
            case 11:
               fEffectRateValue = 0.2;
               break;
            case 12:
               fEffectRateValue = 0.25;
               break;
            case 13:
               fEffectRateValue = 0.3;
               break;
            case 14:
               fEffectRateValue = 0.35;
               break;
            case 15:
               fEffectRateValue = 0.4;
               break;
            default:
               throw Error("GetSkillEffectRateValue::星级越界！！！");
         }
         return fEffectRateValue;
      }
      
      private function SkillAttack() : void
      {
         var iYGridNo:int = 0;
         var arrMoveIntruder:Array = null;
         var stBaseMoveIntruder:a_4206 = null;
         var iReduceLife:int = 0;
         var stFieldGrid:a_3491 = m_stBaseAvatar.stFieldGrid;
         var iStartXGridNo:int = Math.max(stFieldGrid.m_iXGridNo - this.iAttackRange,0);
         var iStartYGridNo:int = Math.max(stFieldGrid.m_iYGridNo - this.iAttackRange,0);
         var iEndXGridNo:int = Math.min(stFieldGrid.m_iXGridNo + this.iAttackRange,BattleFieldView.a_1011 - 1);
         var iEndYGridNo:int = Math.min(stFieldGrid.m_iYGridNo + this.iAttackRange,BattleFieldView.a_1012 - 1);
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
                     iReduceLife = this.HurtValue();
                     stBaseMoveIntruder.a_3969(iReduceLife);
                     stBaseMoveIntruder.a_4208(b_182.a_432,1);
                  }
               }
            }
         }
      }
      
      public function HurtValue() : int
      {
         var fEffectRateValue:Number = 1;
         switch(m_iSkillDegree)
         {
            case 0:
               fEffectRateValue = 1;
               break;
            case 1:
               fEffectRateValue = 1.2;
               break;
            case 2:
               fEffectRateValue = 1.4;
               break;
            case 3:
               fEffectRateValue = 1.6;
               break;
            case 4:
               fEffectRateValue = 2;
               break;
            case 5:
               fEffectRateValue = 2.4;
               break;
            case 6:
               fEffectRateValue = 2.8;
               break;
            case 7:
               fEffectRateValue = 3.4;
               break;
            case 8:
               fEffectRateValue = 4;
               break;
            case 9:
               fEffectRateValue = 4.6;
               break;
            case 10:
               fEffectRateValue = 5.2;
               break;
            case 11:
               fEffectRateValue = 5.8;
               break;
            case 12:
               fEffectRateValue = 6.8;
               break;
            case 13:
               fEffectRateValue = 7.8;
               break;
            case 14:
               fEffectRateValue = 8.8;
               break;
            case 15:
               fEffectRateValue = 10;
               break;
            default:
               throw Error("GetSkillEffectRateValue::星级越界！！！");
         }
         return fEffectRateValue * 10;
      }
      
      private function RealeaseSkillEffect() : void
      {
         this.ClearSkillEffect();
         var stFieldGrid:a_3491 = m_stBaseAvatar.stFieldGrid;
         if(this.iAttackRange == 1)
         {
            this.m_stThreeRectEffect = PepperGemsThreeRectSkillEffect.a_3926();
            this.m_stThreeRectEffect.a_1797(!m_stBattleFieldView.isOwnBattleField);
            this.m_stThreeRectEffect.x = -33 + stFieldGrid.m_iXGridNo * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - this.m_stThreeRectEffect.width);
            if(!m_stBattleFieldView.isOwnBattleField)
            {
               this.m_stThreeRectEffect.x = BattleFieldView.a_1013 - this.m_stThreeRectEffect.x;
            }
            this.m_stThreeRectEffect.y = 18 + stFieldGrid.m_iYGridNo * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - this.m_stThreeRectEffect.height);
            m_stBattleFieldView.AddToBattleView(this.m_stThreeRectEffect,BattleLayerDefine.EFFECTS_BASE_TYPE);
            if(m_stBattleFieldView.GetGameMoveMap())
            {
               m_stBattleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_stThreeRectEffect,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
            }
         }
         else if(this.iAttackRange == 2)
         {
            this.m_stFiveRectEffect = PepperGemsFiveRectSkillEffect.a_3926();
            this.m_stFiveRectEffect.a_1797(!m_stBattleFieldView.isOwnBattleField);
            this.m_stFiveRectEffect.x = -53 + stFieldGrid.m_iXGridNo * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - this.m_stFiveRectEffect.width);
            if(!m_stBattleFieldView.isOwnBattleField)
            {
               this.m_stFiveRectEffect.x = BattleFieldView.a_1013 - this.m_stFiveRectEffect.x;
            }
            this.m_stFiveRectEffect.y = 25 + stFieldGrid.m_iYGridNo * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - this.m_stFiveRectEffect.height);
            m_stBattleFieldView.AddToBattleView(this.m_stFiveRectEffect,BattleLayerDefine.EFFECTS_BASE_TYPE);
            if(m_stBattleFieldView.GetGameMoveMap())
            {
               m_stBattleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_stFiveRectEffect,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
            }
         }
      }
      
      private function ClearSkillEffect() : void
      {
         if(sourceID != "")
         {
            AttackBuffManager.instance.RemoveBuffBySource(sourceID);
         }
         if(null != this.m_stThreeRectEffect)
         {
            this.m_stThreeRectEffect.a_3940();
            this.m_stThreeRectEffect = null;
         }
         if(null != this.m_stFiveRectEffect)
         {
            this.m_stFiveRectEffect.a_3940();
            this.m_stFiveRectEffect = null;
         }
      }
   }
}

