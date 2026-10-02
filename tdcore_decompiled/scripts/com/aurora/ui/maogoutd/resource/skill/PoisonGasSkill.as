package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class PoisonGasSkill extends BaseSkill
   {
      
      private var m_stPoisonGasSkillEffectGasArray:Array = [];
      
      private var m_stPoisonGasSkillEffectConch:PoisonGasSkillEffectConch;
      
      private var m_iBloodDownTime:int;
      
      private var m_stPoisonGasSkillTextEffect:PoisonGasSkillTextEffect;
      
      public function PoisonGasSkill()
      {
         super();
      }
      
      public static function a_3926() : PoisonGasSkill
      {
         return PoolManager.getInstance().CheckOutOne(PoisonGasSkill) as PoisonGasSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         m_uiSkillCoolingTime = 1800 - this.GetSkillCoolingReduceTime();
         this.m_iBloodDownTime = this.GetSkillEffectBloodDownTime();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stPoisonGasSkillEffectGas:PoisonGasSkillEffectGas = null;
         var iIndex:int = 0;
         var stBaseMoveIntruder:a_4206 = null;
         super.OnTimeInterval(iTimeNum);
         if(iTimeNum - m_uiStartCoolingTime < 30)
         {
            if(this.m_stPoisonGasSkillEffectConch)
            {
               this.m_stPoisonGasSkillEffectConch.OnTimeInterval(iTimeNum);
               if(iTimeNum - m_uiStartCoolingTime == 24)
               {
                  for(iIndex = 0; iIndex < 3; iIndex++)
                  {
                     stPoisonGasSkillEffectGas = PoisonGasSkillEffectGas.a_3926();
                     if(m_stBattleFieldView)
                     {
                        stPoisonGasSkillEffectGas.a_1797(!m_stBattleFieldView.isOwnBattleField);
                        stPoisonGasSkillEffectGas.x = (BattleFieldView.a_1011 - 2) * a_3491.a_1080;
                        stPoisonGasSkillEffectGas.y = a_3491.a_1081 * (2 * iIndex + 1.5);
                        m_stBattleFieldView.addChild(stPoisonGasSkillEffectGas);
                     }
                     this.m_stPoisonGasSkillEffectGasArray.push(stPoisonGasSkillEffectGas);
                  }
               }
            }
         }
         else if(iTimeNum - m_uiStartCoolingTime == 30)
         {
            if(this.m_stPoisonGasSkillEffectConch)
            {
               this.m_stPoisonGasSkillEffectConch.a_3940();
               this.m_stPoisonGasSkillEffectConch = null;
            }
         }
         for(var iGasIndex:int = 0; iGasIndex < this.m_stPoisonGasSkillEffectGasArray.length; iGasIndex++)
         {
            stPoisonGasSkillEffectGas = this.m_stPoisonGasSkillEffectGasArray[iGasIndex];
            if(iTimeNum - m_uiStartCoolingTime > 24 && iTimeNum - m_uiStartCoolingTime < 100)
            {
               if(stPoisonGasSkillEffectGas)
               {
                  stPoisonGasSkillEffectGas.OnTimeInterval(iTimeNum);
               }
            }
            else if(iTimeNum - m_uiStartCoolingTime == 100)
            {
               if(stPoisonGasSkillEffectGas)
               {
                  stPoisonGasSkillEffectGas.a_3940();
                  stPoisonGasSkillEffectGas = null;
                  this.m_stPoisonGasSkillEffectGasArray[iGasIndex] = 0;
               }
            }
         }
         if(iTimeNum - m_uiStartCoolingTime == 100)
         {
            this.m_stPoisonGasSkillEffectGasArray = [];
         }
         if(iTimeNum > m_uiSkillCoolingTime - 45 && iTimeNum - m_uiStartCoolingTime <= this.m_iBloodDownTime && (iTimeNum - m_uiStartCoolingTime) % 20 == 0)
         {
            for each(stBaseMoveIntruder in m_stBattleFieldView.m_arrBaseMoveIntruderVector.slice())
            {
               if(stBaseMoveIntruder.iLifeValue > 0)
               {
                  stBaseMoveIntruder.a_4209(20);
               }
            }
         }
         if(this.m_stPoisonGasSkillTextEffect)
         {
            this.m_stPoisonGasSkillTextEffect.OnTimeInterval(iTimeNum);
            if(this.m_stPoisonGasSkillTextEffect.iCurrentFrame == this.m_stPoisonGasSkillTextEffect.iTotalFrames)
            {
               this.m_stPoisonGasSkillTextEffect.a_3940();
               this.m_stPoisonGasSkillTextEffect = null;
            }
         }
      }
      
      override public function UseSkill(iRandomNum:int) : void
      {
         this.m_stPoisonGasSkillTextEffect = PoisonGasSkillTextEffect.a_3926();
         this.m_stPoisonGasSkillTextEffect.a_1797(false);
         this.m_stPoisonGasSkillTextEffect.x = (BattleFieldView.a_1013 - this.m_stPoisonGasSkillTextEffect.width) * 0.5;
         this.m_stPoisonGasSkillTextEffect.y = 20;
         m_stBattleFieldView.addChild(this.m_stPoisonGasSkillTextEffect);
         super.UseSkill(iRandomNum);
         this.m_stPoisonGasSkillEffectConch = PoisonGasSkillEffectConch.a_3926();
         if(m_stBattleFieldView)
         {
            this.m_stPoisonGasSkillEffectConch.a_1797(!m_stBattleFieldView.isOwnBattleField);
            this.m_stPoisonGasSkillEffectConch.x = 470 - a_3491.a_1080 * 2;
            if(m_stBattleFieldView.isOwnBattleField)
            {
               this.m_stPoisonGasSkillEffectConch.x = BattleFieldView.a_1013 - this.m_stPoisonGasSkillEffectConch.x;
            }
            this.m_stPoisonGasSkillEffectConch.y = 200;
            m_stBattleFieldView.addChild(this.m_stPoisonGasSkillEffectConch);
         }
         this.m_stPoisonGasSkillEffectGasArray = [];
      }
      
      override public function a_4330() : void
      {
         var stPoisonGasSkillEffectGas:PoisonGasSkillEffectGas = null;
         super.a_4330();
         if(this.m_stPoisonGasSkillEffectConch)
         {
            this.m_stPoisonGasSkillEffectConch.a_3940();
            this.m_stPoisonGasSkillEffectConch = null;
         }
         if(this.m_stPoisonGasSkillTextEffect)
         {
            this.m_stPoisonGasSkillTextEffect.a_3940();
            this.m_stPoisonGasSkillTextEffect = null;
         }
         for(var iBombIndex:int = 0; iBombIndex < this.m_stPoisonGasSkillEffectGasArray.length; iBombIndex++)
         {
            stPoisonGasSkillEffectGas = this.m_stPoisonGasSkillEffectGasArray[iBombIndex];
            if(stPoisonGasSkillEffectGas)
            {
               stPoisonGasSkillEffectGas.a_3940();
               stPoisonGasSkillEffectGas = null;
            }
         }
         this.m_stPoisonGasSkillEffectGasArray = [];
      }
      
      protected function GetSkillCoolingReduceTime() : int
      {
         return 0;
      }
      
      protected function GetSkillEffectBloodDownTime() : int
      {
         var iEffectValue:int = 2;
         if(m_iSkillDegree == 1)
         {
            iEffectValue = 3;
         }
         else if(m_iSkillDegree == 2)
         {
            iEffectValue = 4;
         }
         else if(m_iSkillDegree == 3)
         {
            iEffectValue = 5;
         }
         else if(m_iSkillDegree == 4)
         {
            iEffectValue = 6;
         }
         else if(m_iSkillDegree == 5)
         {
            iEffectValue = 7;
         }
         else if(m_iSkillDegree == 6)
         {
            iEffectValue = 9;
         }
         else if(m_iSkillDegree == 7)
         {
            iEffectValue = 11;
         }
         else if(m_iSkillDegree == 8)
         {
            iEffectValue = 13;
         }
         else if(m_iSkillDegree == 9)
         {
            iEffectValue = 15;
         }
         else if(m_iSkillDegree == 10)
         {
            iEffectValue = 17;
         }
         return 20 * iEffectValue;
      }
   }
}

