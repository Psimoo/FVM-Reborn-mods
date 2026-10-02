package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class MoYingXunJiSkill extends BaseSkill
   {
      
      private static const attackValues:Array = [18,19,20,21,22,23,24,26,28,30,33,38,43,48,53,60];
      
      private static const attackFrequencies:Array = [0.98,0.97,0.96,0.95,0.94,0.93,0.91,0.89,0.86,0.83,0.76,0.76,0.76,0.74,0.74,0.7];
      
      private var m_stMoYingShengYiBianShengTextEffect:MoYingXunJiBianShengTextEffect;
      
      private var m_stMoYingShengYi2BianShengTextEffect:MoYingXunJi2BianShengTextEffect;
      
      private var m_stMoYingShengYiBianShengLightEffect:MoYingShengYiBianShengLightEffect;
      
      private var m_isSkillUsed:Boolean = false;
      
      public var m_iSex:int;
      
      public var m_bShow:Boolean;
      
      public function MoYingXunJiSkill()
      {
         super();
      }
      
      public static function a_3926(bShow:Boolean) : MoYingXunJiSkill
      {
         var stMoYingXunJiSkill:MoYingXunJiSkill = PoolManager.getInstance().CheckOutOne(MoYingXunJiSkill) as MoYingXunJiSkill;
         stMoYingXunJiSkill.m_bShow = bShow;
         return stMoYingXunJiSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         this.m_isSkillUsed = false;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         super.OnTimeInterval(iTimeNum);
         if(!this.m_isSkillUsed && iTimeNum % 18 == 0)
         {
            if(Boolean(m_stBaseAvatar) && Boolean(m_stBaseAvatar.stFieldGrid))
            {
               m_stBaseAvatar.SetAttakDelaySpeedRate(this.GetSkillEffectAattackFrequency());
               m_stBaseAvatar.SetAttackValue(this.GetSkillEffectAattackValue());
               this.m_iSex = m_stBaseAvatar.m_iSex;
               if(this.m_bShow && this.m_iSex == 1)
               {
                  if(!this.m_stMoYingShengYiBianShengTextEffect)
                  {
                     this.m_stMoYingShengYiBianShengTextEffect = MoYingXunJiBianShengTextEffect.a_3926();
                  }
                  this.m_stMoYingShengYiBianShengTextEffect.a_1797(false);
                  this.m_stMoYingShengYiBianShengTextEffect.x = -350;
                  this.m_stMoYingShengYiBianShengTextEffect.y = 50;
                  m_stBattleFieldView.addChild(this.m_stMoYingShengYiBianShengTextEffect);
               }
               else if(this.m_bShow && this.m_iSex == 2)
               {
                  if(!this.m_stMoYingShengYi2BianShengTextEffect)
                  {
                     this.m_stMoYingShengYi2BianShengTextEffect = MoYingXunJi2BianShengTextEffect.a_3926();
                  }
                  this.m_stMoYingShengYi2BianShengTextEffect.a_1797(false);
                  this.m_stMoYingShengYi2BianShengTextEffect.x = -350;
                  this.m_stMoYingShengYi2BianShengTextEffect.y = 50;
                  m_stBattleFieldView.addChild(this.m_stMoYingShengYi2BianShengTextEffect);
               }
               if(this.m_bShow && Boolean(this.m_iSex))
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
         if(this.m_stMoYingShengYi2BianShengTextEffect)
         {
            this.m_stMoYingShengYi2BianShengTextEffect.OnTimeInterval(iTimeNum);
            if(this.m_stMoYingShengYi2BianShengTextEffect.iCurrentFrame == this.m_stMoYingShengYi2BianShengTextEffect.iTotalFrames)
            {
               this.m_stMoYingShengYi2BianShengTextEffect.a_3940();
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
         this.m_isSkillUsed = false;
         this.m_iSex = 0;
         this.m_bShow = false;
         if(this.m_stMoYingShengYiBianShengTextEffect)
         {
            this.m_stMoYingShengYiBianShengTextEffect.a_3940();
            this.m_stMoYingShengYiBianShengTextEffect = null;
         }
         if(this.m_stMoYingShengYi2BianShengTextEffect)
         {
            this.m_stMoYingShengYi2BianShengTextEffect.a_3940();
            this.m_stMoYingShengYi2BianShengTextEffect = null;
         }
         if(this.m_stMoYingShengYiBianShengLightEffect)
         {
            this.m_stMoYingShengYiBianShengLightEffect.a_3940();
            this.m_stMoYingShengYiBianShengLightEffect = null;
         }
      }
      
      public function GetSkillEffectAattackValue() : Number
      {
         return attackValues[m_iSkillDegree];
      }
      
      protected function GetSkillEffectAattackFrequency() : Number
      {
         return attackFrequencies[m_iSkillDegree];
      }
   }
}

