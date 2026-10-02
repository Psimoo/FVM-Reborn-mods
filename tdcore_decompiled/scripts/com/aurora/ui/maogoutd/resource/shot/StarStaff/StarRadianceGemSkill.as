package com.aurora.ui.maogoutd.resource.shot.StarStaff
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkill;
   
   public class StarRadianceGemSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      private var m_stStarRadianceBianShengEffect:StarRadianceBianShengEffect;
      
      private var m_stStarRadianceBoySkillEffect:StarRadianceBoySkillEffect;
      
      private var m_stStarRadianceGirlSkillEffect:StarRadianceGirlSkillEffect;
      
      public var m_iSex:int;
      
      public var m_bShow:Boolean;
      
      public function StarRadianceGemSkill()
      {
         super();
      }
      
      public static function a_3926(bShow:Boolean) : StarRadianceGemSkill
      {
         var stStarRadianceGemSkill:StarRadianceGemSkill = PoolManager.getInstance().CheckOutOne(StarRadianceGemSkill) as StarRadianceGemSkill;
         stStarRadianceGemSkill.m_bShow = bShow;
         return stStarRadianceGemSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         this.m_isSkillUsed = false;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         super.OnTimeInterval(iTimeNum);
         if(!this.m_isSkillUsed && iTimeNum % 20 == 0)
         {
            if(Boolean(m_stBaseAvatar) && Boolean(m_stBaseAvatar.stFieldGrid))
            {
               this.m_iSex = m_stBaseAvatar.m_iSex;
               if(this.m_bShow && Boolean(this.m_iSex))
               {
                  if(!this.m_stStarRadianceBianShengEffect)
                  {
                     this.m_stStarRadianceBianShengEffect = StarRadianceBianShengEffect.a_3926();
                  }
                  this.m_stStarRadianceBianShengEffect.a_1797(false);
                  if(m_stBattleFieldView.isOwnBattleField)
                  {
                     this.m_stStarRadianceBianShengEffect.x = (m_stBaseAvatar.stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080 - 0.5 * this.m_stStarRadianceBianShengEffect.width;
                  }
                  else
                  {
                     this.m_stStarRadianceBianShengEffect.x = (BattleFieldView.a_1011 - (m_stBaseAvatar.stFieldGrid.m_iXGridNo + 0.5)) * a_3491.a_1080 - 0.5 * this.m_stStarRadianceBianShengEffect.width;
                  }
                  this.m_stStarRadianceBianShengEffect.y = (m_stBaseAvatar.stFieldGrid.m_iYGridNo + 1) * a_3491.a_1081 - this.m_stStarRadianceBianShengEffect.height;
                  m_stBattleFieldView.addChild(this.m_stStarRadianceBianShengEffect);
               }
               if(this.m_bShow && this.m_iSex == 1)
               {
                  if(!this.m_stStarRadianceBoySkillEffect)
                  {
                     this.m_stStarRadianceBoySkillEffect = StarRadianceBoySkillEffect.a_3926();
                  }
                  this.m_stStarRadianceBoySkillEffect.a_1797(false);
                  this.m_stStarRadianceBoySkillEffect.x = -m_stBattleFieldView.x - 75;
                  this.m_stStarRadianceBoySkillEffect.y = -m_stBattleFieldView.y - 61;
                  m_stBattleFieldView.addChild(this.m_stStarRadianceBoySkillEffect);
               }
               else if(this.m_bShow && this.m_iSex == 2)
               {
                  if(!this.m_stStarRadianceGirlSkillEffect)
                  {
                     this.m_stStarRadianceGirlSkillEffect = StarRadianceGirlSkillEffect.a_3926();
                  }
                  this.m_stStarRadianceGirlSkillEffect.a_1797(false);
                  this.m_stStarRadianceGirlSkillEffect.x = -m_stBattleFieldView.x - 75;
                  this.m_stStarRadianceGirlSkillEffect.y = -m_stBattleFieldView.y - 61;
                  m_stBattleFieldView.addChild(this.m_stStarRadianceGirlSkillEffect);
               }
               m_stBaseAvatar.SetSputteringHurtRate(this.GetSkillEffectAattackRate());
               this.m_isSkillUsed = true;
            }
         }
         if(this.m_stStarRadianceBoySkillEffect)
         {
            this.m_stStarRadianceBoySkillEffect.OnTimeInterval(iTimeNum);
            if(this.m_stStarRadianceBoySkillEffect.iCurrentFrame == this.m_stStarRadianceBoySkillEffect.iTotalFrames)
            {
               this.m_stStarRadianceBoySkillEffect.a_3940();
            }
         }
         if(this.m_stStarRadianceGirlSkillEffect)
         {
            this.m_stStarRadianceGirlSkillEffect.OnTimeInterval(iTimeNum);
            if(this.m_stStarRadianceGirlSkillEffect.iCurrentFrame == this.m_stStarRadianceGirlSkillEffect.iTotalFrames)
            {
               this.m_stStarRadianceGirlSkillEffect.a_3940();
            }
         }
         if(this.m_stStarRadianceBianShengEffect)
         {
            this.m_stStarRadianceBianShengEffect.OnTimeInterval(iTimeNum);
            if(this.m_stStarRadianceBianShengEffect.iCurrentFrame == this.m_stStarRadianceBianShengEffect.iTotalFrames)
            {
               this.m_stStarRadianceBianShengEffect.a_3940();
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
      
      override public function a_4330() : void
      {
         super.a_4330();
         this.m_iSex = 0;
         this.m_bShow = false;
         if(this.m_stStarRadianceBoySkillEffect)
         {
            this.m_stStarRadianceBoySkillEffect.a_3940();
            this.m_stStarRadianceBoySkillEffect = null;
         }
         if(this.m_stStarRadianceGirlSkillEffect)
         {
            this.m_stStarRadianceGirlSkillEffect.a_3940();
            this.m_stStarRadianceGirlSkillEffect = null;
         }
         if(this.m_stStarRadianceBianShengEffect)
         {
            this.m_stStarRadianceBianShengEffect.a_3940();
            this.m_stStarRadianceBianShengEffect = null;
         }
      }
      
      protected function GetSkillEffectAattackRate() : Number
      {
         var numEffectValue:Number = 0.15;
         if(m_iSkillDegree == 1)
         {
            numEffectValue = 0.16;
         }
         else if(m_iSkillDegree == 2)
         {
            numEffectValue = 0.17;
         }
         else if(m_iSkillDegree == 3)
         {
            numEffectValue = 0.18;
         }
         else if(m_iSkillDegree == 4)
         {
            numEffectValue = 0.2;
         }
         else if(m_iSkillDegree == 5)
         {
            numEffectValue = 0.22;
         }
         else if(m_iSkillDegree == 6)
         {
            numEffectValue = 0.25;
         }
         else if(m_iSkillDegree == 7)
         {
            numEffectValue = 0.3;
         }
         else if(m_iSkillDegree == 8)
         {
            numEffectValue = 0.35;
         }
         else if(m_iSkillDegree == 9)
         {
            numEffectValue = 0.4;
         }
         else if(m_iSkillDegree == 10)
         {
            numEffectValue = 0.45;
         }
         else if(m_iSkillDegree == 11)
         {
            numEffectValue = 0.5;
         }
         else if(m_iSkillDegree == 12)
         {
            numEffectValue = 0.6;
         }
         else if(m_iSkillDegree == 13)
         {
            numEffectValue = 0.7;
         }
         else if(m_iSkillDegree == 14)
         {
            numEffectValue = 0.8;
         }
         else if(m_iSkillDegree == 15)
         {
            numEffectValue = 1;
         }
         return numEffectValue;
      }
   }
}

