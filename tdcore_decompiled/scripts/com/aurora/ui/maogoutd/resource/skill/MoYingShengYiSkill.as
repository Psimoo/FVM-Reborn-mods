package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class MoYingShengYiSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      private var m_stMoYingShengYiBianShengTextEffect:MoYingShengYiBianShengTextEffect;
      
      private var m_stMoYingShengYiBianShengLightEffect:MoYingShengYiBianShengLightEffect;
      
      public var m_bShow:Boolean;
      
      public function MoYingShengYiSkill()
      {
         super();
      }
      
      public static function a_3926(bShow:Boolean) : MoYingShengYiSkill
      {
         var stMoYingShengYiSkill:MoYingShengYiSkill = PoolManager.getInstance().CheckOutOne(MoYingShengYiSkill) as MoYingShengYiSkill;
         stMoYingShengYiSkill.m_bShow = bShow;
         return stMoYingShengYiSkill;
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
               if(this.m_bShow)
               {
                  if(!this.m_stMoYingShengYiBianShengTextEffect)
                  {
                     this.m_stMoYingShengYiBianShengTextEffect = MoYingShengYiBianShengTextEffect.a_3926();
                  }
                  this.m_stMoYingShengYiBianShengTextEffect.a_1797(false);
                  this.m_stMoYingShengYiBianShengTextEffect.x = -350;
                  this.m_stMoYingShengYiBianShengTextEffect.y = 50;
                  m_stBattleFieldView.addChild(this.m_stMoYingShengYiBianShengTextEffect);
                  if(!this.m_stMoYingShengYiBianShengLightEffect)
                  {
                     this.m_stMoYingShengYiBianShengLightEffect = MoYingShengYiBianShengLightEffect.a_3926();
                  }
                  this.m_stMoYingShengYiBianShengLightEffect.a_1797(false);
                  if(m_stBattleFieldView.isOwnBattleField)
                  {
                     this.m_stMoYingShengYiBianShengLightEffect.x = (m_stBaseAvatar.stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080 - 0.5 * this.m_stMoYingShengYiBianShengLightEffect.width;
                  }
                  else
                  {
                     this.m_stMoYingShengYiBianShengLightEffect.x = (BattleFieldView.a_1011 - (m_stBaseAvatar.stFieldGrid.m_iXGridNo + 0.5)) * a_3491.a_1080 - 0.5 * this.m_stMoYingShengYiBianShengLightEffect.width;
                  }
                  this.m_stMoYingShengYiBianShengLightEffect.y = (m_stBaseAvatar.stFieldGrid.m_iYGridNo + 1) * a_3491.a_1081 - this.m_stMoYingShengYiBianShengLightEffect.height;
                  m_stBattleFieldView.addChild(this.m_stMoYingShengYiBianShengLightEffect);
               }
               m_stBaseAvatar.SetSputteringHurtRate(this.GetSkillEffectAattackRate());
               if(m_iSkillDegree >= 14)
               {
                  m_stBaseAvatar.SetTransfigurationStatus(5);
               }
               else if(m_iSkillDegree >= 12)
               {
                  m_stBaseAvatar.SetTransfigurationStatus(4);
               }
               else if(m_iSkillDegree >= 10)
               {
                  m_stBaseAvatar.SetTransfigurationStatus(3);
               }
               else if(m_iSkillDegree >= 6)
               {
                  m_stBaseAvatar.SetTransfigurationStatus(2);
               }
               else
               {
                  m_stBaseAvatar.SetTransfigurationStatus(1);
               }
               this.m_isSkillUsed = true;
            }
         }
         if(this.m_stMoYingShengYiBianShengTextEffect)
         {
            this.m_stMoYingShengYiBianShengTextEffect.OnTimeInterval(iTimeNum);
            if(this.m_stMoYingShengYiBianShengTextEffect.iCurrentFrame == this.m_stMoYingShengYiBianShengTextEffect.iTotalFrames)
            {
               this.m_stMoYingShengYiBianShengTextEffect.a_3940();
            }
         }
         if(this.m_stMoYingShengYiBianShengLightEffect)
         {
            this.m_stMoYingShengYiBianShengLightEffect.OnTimeInterval(iTimeNum);
            if(this.m_stMoYingShengYiBianShengLightEffect.iCurrentFrame == this.m_stMoYingShengYiBianShengLightEffect.iTotalFrames)
            {
               this.m_stMoYingShengYiBianShengLightEffect.a_3940();
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
         this.m_bShow = false;
         if(this.m_stMoYingShengYiBianShengTextEffect)
         {
            this.m_stMoYingShengYiBianShengTextEffect.a_3940();
            this.m_stMoYingShengYiBianShengTextEffect = null;
         }
         if(this.m_stMoYingShengYiBianShengLightEffect)
         {
            this.m_stMoYingShengYiBianShengLightEffect.a_3940();
            this.m_stMoYingShengYiBianShengTextEffect = null;
         }
      }
      
      protected function GetSkillEffectAattackRate() : Number
      {
         var numEffectValue:Number = 0.1;
         if(m_iSkillDegree == 1)
         {
            numEffectValue = 0.13;
         }
         else if(m_iSkillDegree == 2)
         {
            numEffectValue = 0.16;
         }
         else if(m_iSkillDegree == 3)
         {
            numEffectValue = 0.19;
         }
         else if(m_iSkillDegree == 4)
         {
            numEffectValue = 0.21;
         }
         else if(m_iSkillDegree == 5)
         {
            numEffectValue = 0.24;
         }
         else if(m_iSkillDegree == 6)
         {
            numEffectValue = 0.27;
         }
         else if(m_iSkillDegree == 7)
         {
            numEffectValue = 0.3;
         }
         else if(m_iSkillDegree == 8)
         {
            numEffectValue = 0.33;
         }
         else if(m_iSkillDegree == 9)
         {
            numEffectValue = 0.36;
         }
         else if(m_iSkillDegree == 10)
         {
            numEffectValue = 0.4;
         }
         else if(m_iSkillDegree == 11)
         {
            numEffectValue = 0.41;
         }
         else if(m_iSkillDegree == 12)
         {
            numEffectValue = 0.42;
         }
         else if(m_iSkillDegree == 13)
         {
            numEffectValue = 0.43;
         }
         else if(m_iSkillDegree == 14)
         {
            numEffectValue = 0.44;
         }
         else if(m_iSkillDegree == 15)
         {
            numEffectValue = 0.45;
         }
         return numEffectValue;
      }
   }
}

