package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3972;
   import com.aurora.ui.maogoutd.resource.defender.a_4012;
   
   public class WangWangSkill extends BaseSkill
   {
      
      public var m_arrBaseInsuranceVector:Array = [];
      
      private var m_iSummonRowNum:int;
      
      private var m_stWangWangSkillTextEffect:WangWangSkillTextEffect;
      
      private var m_iStarRowIndex:int = 0;
      
      public function WangWangSkill()
      {
         super();
      }
      
      public static function a_3926() : WangWangSkill
      {
         return PoolManager.getInstance().CheckOutOne(WangWangSkill) as WangWangSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         m_uiSkillCoolingTime = 6000 - this.GetSkillCoolingReduceTime();
         this.m_iSummonRowNum = this.GetSkillEffectRowNum();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         super.OnTimeInterval(iTimeNum);
         for(var i:int = 0; i < BattleFieldView.a_1012; i++)
         {
            if(null != this.m_arrBaseInsuranceVector[i])
            {
               this.m_arrBaseInsuranceVector[i].a_3973(iTimeNum);
               if(!(this.m_arrBaseInsuranceVector[i] as a_3972).visible)
               {
                  this.m_arrBaseInsuranceVector[i] = null;
               }
            }
         }
         if(this.m_stWangWangSkillTextEffect)
         {
            this.m_stWangWangSkillTextEffect.OnTimeInterval(iTimeNum);
            if(this.m_stWangWangSkillTextEffect.iCurrentFrame == this.m_stWangWangSkillTextEffect.iTotalFrames)
            {
               this.m_stWangWangSkillTextEffect.a_3940();
               this.m_stWangWangSkillTextEffect = null;
            }
         }
      }
      
      override public function UseSkill(iRandomNum:int) : void
      {
         var i:int = 0;
         var stBaseInsurance:a_3972 = null;
         var stFieldGrid:a_3491 = null;
         var iDepthIndex:int = 0;
         this.m_stWangWangSkillTextEffect = WangWangSkillTextEffect.a_3926();
         this.m_stWangWangSkillTextEffect.a_1797(false);
         this.m_stWangWangSkillTextEffect.x = (BattleFieldView.a_1013 - this.m_stWangWangSkillTextEffect.width) * 0.5;
         this.m_stWangWangSkillTextEffect.y = 20;
         m_stBattleFieldView.addChild(this.m_stWangWangSkillTextEffect);
         super.UseSkill(iRandomNum);
         if(m_stBattleFieldView)
         {
            this.m_iStarRowIndex = 3 - int(this.m_iSummonRowNum / 2);
            if(this.m_iStarRowIndex < 0)
            {
               this.m_iStarRowIndex = 0;
            }
            else if(this.m_iStarRowIndex > BattleFieldView.a_1012 - this.m_iSummonRowNum)
            {
               this.m_iStarRowIndex = BattleFieldView.a_1012 - this.m_iSummonRowNum;
            }
            for(i = this.m_iStarRowIndex; i < this.m_iSummonRowNum + this.m_iStarRowIndex; i++)
            {
               stFieldGrid = m_stBattleFieldView.a_3438(0,i);
               if(stFieldGrid != null)
               {
                  if(stFieldGrid.m_isNeedTray)
                  {
                     stBaseInsurance = a_4012.getInstance().a_4013(285212672) as a_3972;
                  }
                  else
                  {
                     stBaseInsurance = a_4012.getInstance().a_4013(285212674) as a_3972;
                  }
                  if(null != stBaseInsurance)
                  {
                     stBaseInsurance.iDefenseTypeID = 285212927;
                     stBaseInsurance.a_1797(stFieldGrid);
                     stBaseInsurance.x = m_stBattleFieldView.iIntruderMoveDirection > 0 ? BattleFieldView.a_1013 + stBaseInsurance.width : -stBaseInsurance.width;
                     stBaseInsurance.y = a_3491.a_1081 * i + (a_3491.a_1081 - stBaseInsurance.height);
                     iDepthIndex = m_stBattleFieldView.getChildIndex(m_stBattleFieldView.arrBackDepthBitmap[i]);
                     m_stBattleFieldView.addChildAt(stBaseInsurance,iDepthIndex);
                     this.m_arrBaseInsuranceVector[i] = stBaseInsurance;
                     stBaseInsurance.a_3974();
                  }
               }
            }
         }
      }
      
      override public function a_4330() : void
      {
         super.a_4330();
         if(this.m_stWangWangSkillTextEffect)
         {
            this.m_stWangWangSkillTextEffect.a_3940();
         }
      }
      
      protected function GetSkillCoolingReduceTime() : int
      {
         var iReduceTime:int = 0;
         if(m_iSkillDegree <= 5)
         {
            iReduceTime = 20 * m_iSkillDegree;
         }
         else if(m_iSkillDegree > 5)
         {
            iReduceTime = 20 * 5 + 10 * (m_iSkillDegree - 5);
         }
         return 20 * iReduceTime;
      }
      
      protected function GetSkillEffectRowNum() : int
      {
         var iEffectValue:int = 1;
         if(m_iSkillDegree <= 2)
         {
            iEffectValue = 1;
         }
         else if(m_iSkillDegree > 2 && m_iSkillDegree <= 4)
         {
            iEffectValue = 2;
         }
         else if(m_iSkillDegree > 4 && m_iSkillDegree <= 6)
         {
            iEffectValue = 3;
         }
         else if(m_iSkillDegree == 7)
         {
            iEffectValue = 4;
         }
         else if(m_iSkillDegree == 8)
         {
            iEffectValue = 5;
         }
         else if(m_iSkillDegree == 9)
         {
            iEffectValue = 6;
         }
         else if(m_iSkillDegree == 10)
         {
            iEffectValue = 7;
         }
         return iEffectValue;
      }
   }
}

