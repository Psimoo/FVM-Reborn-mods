package com.aurora.ui.maogoutd.resource.shot.StarStaff
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.base.BaseOriginEffect;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkill;
   
   public class StarShinesGemoSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      private var m_stStarRadianceBianShengEffect:StarRadianceBianShengEffect;
      
      private var m_stStarShinesBoySkillEffect:BaseOriginEffect;
      
      private var m_stStarShinesGirlSkillEffect:BaseOriginEffect;
      
      public var m_iSex:int;
      
      public var m_bShow:Boolean;
      
      public function StarShinesGemoSkill()
      {
         super();
      }
      
      public static function a_3926(bShow:Boolean) : StarShinesGemoSkill
      {
         var stStarShinesGemoSkill:StarShinesGemoSkill = PoolManager.getInstance().CheckOutOne(StarShinesGemoSkill) as StarShinesGemoSkill;
         stStarShinesGemoSkill.m_bShow = bShow;
         return stStarShinesGemoSkill;
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
                  if(!this.m_stStarShinesBoySkillEffect)
                  {
                     this.m_stStarShinesBoySkillEffect = PoolManager.getInstance().CheckOutOne(BaseOriginEffect,StarShinesBoySkillEffectMovie) as BaseOriginEffect;
                  }
                  this.m_stStarShinesBoySkillEffect.a_3014();
                  this.m_stStarShinesBoySkillEffect.x = -m_stBattleFieldView.x + 491;
                  this.m_stStarShinesBoySkillEffect.y = -m_stBattleFieldView.y + 343;
                  m_stBattleFieldView.addChild(this.m_stStarShinesBoySkillEffect);
                  this.m_stStarShinesBoySkillEffect.SetAnimation(0,true);
               }
               else if(this.m_bShow && this.m_iSex == 2)
               {
                  if(!this.m_stStarShinesGirlSkillEffect)
                  {
                     this.m_stStarShinesGirlSkillEffect = PoolManager.getInstance().CheckOutOne(BaseOriginEffect,StarShinesGirlSkillEffectMovie) as BaseOriginEffect;
                  }
                  this.m_stStarShinesGirlSkillEffect.a_3014();
                  this.m_stStarShinesGirlSkillEffect.x = -m_stBattleFieldView.x + 491;
                  this.m_stStarShinesGirlSkillEffect.y = -m_stBattleFieldView.y + 343;
                  m_stBattleFieldView.addChild(this.m_stStarShinesGirlSkillEffect);
                  this.m_stStarShinesGirlSkillEffect.SetAnimation(0,true);
               }
               m_stBaseAvatar.SetSputteringHurtRate(this.GetSkillEffectAattackRate());
               this.m_isSkillUsed = true;
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
         if(this.m_stStarShinesBoySkillEffect)
         {
            this.m_stStarShinesBoySkillEffect.a_3940();
            this.m_stStarShinesBoySkillEffect = null;
         }
         if(this.m_stStarShinesGirlSkillEffect)
         {
            this.m_stStarShinesGirlSkillEffect.a_3940();
            this.m_stStarShinesGirlSkillEffect = null;
         }
         if(this.m_stStarRadianceBianShengEffect)
         {
            this.m_stStarRadianceBianShengEffect.a_3940();
            this.m_stStarRadianceBianShengEffect = null;
         }
      }
      
      protected function GetSkillEffectAattackRate() : Number
      {
         var numEffectValue:Number = 0.21;
         switch(m_iSkillDegree)
         {
            case 1:
               numEffectValue = 0.22;
               break;
            case 2:
               numEffectValue = 0.23;
               break;
            case 3:
               numEffectValue = 0.24;
               break;
            case 4:
               numEffectValue = 0.25;
               break;
            case 5:
               numEffectValue = 0.3;
               break;
            case 6:
               numEffectValue = 0.35;
               break;
            case 7:
               numEffectValue = 0.4;
               break;
            case 8:
               numEffectValue = 0.45;
               break;
            case 9:
               numEffectValue = 0.55;
               break;
            case 10:
               numEffectValue = 0.7;
               break;
            case 11:
               numEffectValue = 0.85;
               break;
            case 12:
               numEffectValue = 1;
               break;
            case 13:
               numEffectValue = 1.15;
               break;
            case 14:
               numEffectValue = 1.3;
               break;
            case 15:
               numEffectValue = 1.5;
         }
         return numEffectValue;
      }
   }
}

