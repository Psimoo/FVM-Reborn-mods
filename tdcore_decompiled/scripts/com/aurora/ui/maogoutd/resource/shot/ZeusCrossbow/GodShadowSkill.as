package com.aurora.ui.maogoutd.resource.shot.ZeusCrossbow
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkill;
   import com.aurora.ui.maogoutd.resource.skill.MoYingShengYiBianShengLightEffect;
   
   public class GodShadowSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      private var m_stMoYingShengYiBianShengLightEffect:MoYingShengYiBianShengLightEffect;
      
      private var m_stGodShadowBoySkillEffect:GodShadowBoySkillEffect;
      
      private var m_stGodShadowGirlSkillEffect:GodShadowGirlSkillEffect;
      
      public var m_iSex:int;
      
      public var m_bShow:Boolean;
      
      public function GodShadowSkill()
      {
         super();
      }
      
      public static function a_3926(bShow:Boolean) : GodShadowSkill
      {
         var stGodShadowSkill:GodShadowSkill = PoolManager.getInstance().CheckOutOne(GodShadowSkill) as GodShadowSkill;
         stGodShadowSkill.m_bShow = bShow;
         return stGodShadowSkill;
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
               if(this.m_bShow && this.m_iSex == 1)
               {
                  if(!this.m_stGodShadowBoySkillEffect)
                  {
                     this.m_stGodShadowBoySkillEffect = GodShadowBoySkillEffect.a_3926();
                  }
                  this.m_stGodShadowBoySkillEffect.a_1797(false);
                  this.m_stGodShadowBoySkillEffect.x = -350;
                  this.m_stGodShadowBoySkillEffect.y = 50;
                  m_stBattleFieldView.addChild(this.m_stGodShadowBoySkillEffect);
               }
               else if(this.m_bShow && this.m_iSex == 2)
               {
                  if(!this.m_stGodShadowGirlSkillEffect)
                  {
                     this.m_stGodShadowGirlSkillEffect = GodShadowGirlSkillEffect.a_3926();
                  }
                  this.m_stGodShadowGirlSkillEffect.a_1797(false);
                  this.m_stGodShadowGirlSkillEffect.x = -350;
                  this.m_stGodShadowGirlSkillEffect.y = 50;
                  m_stBattleFieldView.addChild(this.m_stGodShadowGirlSkillEffect);
               }
               if(this.m_bShow && Boolean(this.m_iSex))
               {
                  if(this.m_iSex)
                  {
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
         if(this.m_stGodShadowBoySkillEffect)
         {
            this.m_stGodShadowBoySkillEffect.OnTimeInterval(iTimeNum);
            if(this.m_stGodShadowBoySkillEffect.iCurrentFrame == this.m_stGodShadowBoySkillEffect.iTotalFrames)
            {
               this.m_stGodShadowBoySkillEffect.a_3940();
            }
         }
         if(this.m_stGodShadowGirlSkillEffect)
         {
            this.m_stGodShadowGirlSkillEffect.OnTimeInterval(iTimeNum);
            if(this.m_stGodShadowGirlSkillEffect.iCurrentFrame == this.m_stGodShadowGirlSkillEffect.iTotalFrames)
            {
               this.m_stGodShadowGirlSkillEffect.a_3940();
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
         this.m_iSex = 0;
         this.m_bShow = false;
         if(this.m_stGodShadowBoySkillEffect)
         {
            this.m_stGodShadowBoySkillEffect.a_3940();
            this.m_stGodShadowBoySkillEffect = null;
         }
         if(this.m_stGodShadowGirlSkillEffect)
         {
            this.m_stGodShadowGirlSkillEffect.a_3940();
            this.m_stGodShadowGirlSkillEffect = null;
         }
         if(this.m_stMoYingShengYiBianShengLightEffect)
         {
            this.m_stMoYingShengYiBianShengLightEffect.a_3940();
            this.m_stMoYingShengYiBianShengLightEffect = null;
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
            numEffectValue = 0.18;
         }
         else if(m_iSkillDegree == 3)
         {
            numEffectValue = 0.2;
         }
         else if(m_iSkillDegree == 4)
         {
            numEffectValue = 0.23;
         }
         else if(m_iSkillDegree == 5)
         {
            numEffectValue = 0.26;
         }
         else if(m_iSkillDegree == 6)
         {
            numEffectValue = 0.29;
         }
         else if(m_iSkillDegree == 7)
         {
            numEffectValue = 0.32;
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
            numEffectValue = 0.47;
         }
         else if(m_iSkillDegree == 12)
         {
            numEffectValue = 0.49;
         }
         else if(m_iSkillDegree == 13)
         {
            numEffectValue = 0.52;
         }
         else if(m_iSkillDegree == 14)
         {
            numEffectValue = 0.55;
         }
         else if(m_iSkillDegree == 15)
         {
            numEffectValue = 0.6;
         }
         return numEffectValue;
      }
   }
}

