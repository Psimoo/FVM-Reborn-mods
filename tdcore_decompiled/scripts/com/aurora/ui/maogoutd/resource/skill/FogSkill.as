package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4128;
   import flash.utils.setTimeout;
   
   public class FogSkill extends BaseSkill
   {
      
      private var m_stFogSkillEffectConch:FogSkillEffectConch;
      
      private var m_iFogContinueTime:int;
      
      private var m_stFogSkillTextEffect:FogSkillTextEffect;
      
      public function FogSkill()
      {
         super();
      }
      
      public static function a_3926() : FogSkill
      {
         return PoolManager.getInstance().CheckOutOne(FogSkill) as FogSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         m_uiSkillCoolingTime = 2400 - this.GetSkillCoolingReduceTime();
         this.m_iFogContinueTime = this.GetSkillEffectFogContinueTime();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         super.OnTimeInterval(iTimeNum);
         if(iTimeNum - m_uiStartCoolingTime < 42)
         {
            if(this.m_stFogSkillEffectConch)
            {
               this.m_stFogSkillEffectConch.OnTimeInterval(iTimeNum);
               if(iTimeNum - m_uiStartCoolingTime == 35)
               {
                  a_4128.a_1413 = true;
                  m_stBattleFieldView.m_stOpponentBattleFieldInstance.m_stLargeFogEffect.a_1797();
                  m_stBattleFieldView.m_stOpponentBattleFieldInstance.a_3462(4);
                  setTimeout(m_stBattleFieldView.m_stOpponentBattleFieldInstance.m_stLargeFogEffect.a_4130,50 * this.m_iFogContinueTime);
               }
            }
         }
         else if(iTimeNum - m_uiStartCoolingTime == 42)
         {
            if(this.m_stFogSkillEffectConch)
            {
               this.m_stFogSkillEffectConch.a_3940();
               this.m_stFogSkillEffectConch = null;
            }
         }
         if(this.m_stFogSkillTextEffect)
         {
            this.m_stFogSkillTextEffect.OnTimeInterval(iTimeNum);
            if(this.m_stFogSkillTextEffect.iCurrentFrame == this.m_stFogSkillTextEffect.iTotalFrames)
            {
               this.m_stFogSkillTextEffect.a_3940();
               this.m_stFogSkillTextEffect = null;
            }
         }
      }
      
      override public function UseSkill(iRandomNum:int) : void
      {
         this.m_stFogSkillTextEffect = FogSkillTextEffect.a_3926();
         this.m_stFogSkillTextEffect.a_1797(false);
         this.m_stFogSkillTextEffect.x = (BattleFieldView.a_1013 - this.m_stFogSkillTextEffect.width) * 0.5;
         this.m_stFogSkillTextEffect.y = 20;
         m_stBattleFieldView.addChild(this.m_stFogSkillTextEffect);
         super.UseSkill(iRandomNum);
         this.m_stFogSkillEffectConch = FogSkillEffectConch.a_3926();
         if(m_stBattleFieldView)
         {
            this.m_stFogSkillEffectConch.a_1797(!m_stBattleFieldView.m_stOpponentBattleFieldInstance.isOwnBattleField);
            this.m_stFogSkillEffectConch.x = 470 - a_3491.a_1080 * 2;
            if(!m_stBattleFieldView.m_stOpponentBattleFieldInstance.isOwnBattleField)
            {
               this.m_stFogSkillEffectConch.x = BattleFieldView.a_1013 - this.m_stFogSkillEffectConch.x;
            }
            this.m_stFogSkillEffectConch.y = 200;
            m_stBattleFieldView.m_stOpponentBattleFieldInstance.addChild(this.m_stFogSkillEffectConch);
         }
      }
      
      override public function a_4330() : void
      {
         super.a_4330();
         if(this.m_stFogSkillEffectConch)
         {
            this.m_stFogSkillEffectConch.a_3940();
            this.m_stFogSkillEffectConch = null;
         }
         if(this.m_stFogSkillTextEffect)
         {
            this.m_stFogSkillTextEffect.a_3940();
            this.m_stFogSkillTextEffect = null;
         }
      }
      
      protected function GetSkillCoolingReduceTime() : int
      {
         var iReduceTime:int = 0;
         if(m_iSkillDegree <= 8)
         {
            iReduceTime = 5 * m_iSkillDegree;
         }
         else if(m_iSkillDegree > 8)
         {
            iReduceTime = 5 * 8 + 10 * (m_iSkillDegree - 8);
         }
         return 20 * iReduceTime;
      }
      
      protected function GetSkillEffectFogContinueTime() : int
      {
         var iEffectValue:Number = 3;
         if(m_iSkillDegree == 1)
         {
            iEffectValue = 5;
         }
         else if(m_iSkillDegree == 2)
         {
            iEffectValue = 5;
         }
         else if(m_iSkillDegree == 3)
         {
            iEffectValue = 10;
         }
         else if(m_iSkillDegree == 4)
         {
            iEffectValue = 10;
         }
         else if(m_iSkillDegree == 5)
         {
            iEffectValue = 10;
         }
         else if(m_iSkillDegree == 6)
         {
            iEffectValue = 15;
         }
         else if(m_iSkillDegree == 7)
         {
            iEffectValue = 15;
         }
         else if(m_iSkillDegree == 8)
         {
            iEffectValue = 15;
         }
         else if(m_iSkillDegree == 9)
         {
            iEffectValue = 20;
         }
         else if(m_iSkillDegree == 10)
         {
            iEffectValue = 20;
         }
         return 20 * iEffectValue;
      }
   }
}

