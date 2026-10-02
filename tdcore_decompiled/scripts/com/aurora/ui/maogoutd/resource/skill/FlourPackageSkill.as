package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_4012;
   
   public class FlourPackageSkill extends BaseSkill
   {
      
      public var m_arrBaseInsuranceVector:Array = [];
      
      private var m_stFlourPackageSkillTextEffect:FlourPackageSkillTextEffect;
      
      private var m_iRowNum:int = 0;
      
      public function FlourPackageSkill()
      {
         super();
      }
      
      public static function a_3926() : FlourPackageSkill
      {
         return PoolManager.getInstance().CheckOutOne(FlourPackageSkill) as FlourPackageSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         m_uiSkillCoolingTime = 6400 - this.GetSkillCoolingReduceTime();
         this.m_iRowNum = this.GetSkillEffectRowNum();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         super.OnTimeInterval(iTimeNum);
         if(this.m_stFlourPackageSkillTextEffect)
         {
            this.m_stFlourPackageSkillTextEffect.OnTimeInterval(iTimeNum);
            if(this.m_stFlourPackageSkillTextEffect.iCurrentFrame == this.m_stFlourPackageSkillTextEffect.iTotalFrames)
            {
               this.m_stFlourPackageSkillTextEffect.a_3940();
               this.m_stFlourPackageSkillTextEffect = null;
            }
         }
      }
      
      override public function UseSkill(iRandomNum:int) : void
      {
         var i:int = 0;
         var j:int = 0;
         var stFlourPackageDefense:a_3962 = null;
         var addResult:Boolean = false;
         var stInitialFieldGrid:a_3491 = null;
         this.m_stFlourPackageSkillTextEffect = FlourPackageSkillTextEffect.a_3926();
         this.m_stFlourPackageSkillTextEffect.a_1797(false);
         this.m_stFlourPackageSkillTextEffect.x = (BattleFieldView.a_1013 - this.m_stFlourPackageSkillTextEffect.width) * 0.5;
         this.m_stFlourPackageSkillTextEffect.y = 20;
         m_stBattleFieldView.addChild(this.m_stFlourPackageSkillTextEffect);
         super.UseSkill(iRandomNum);
         if(m_stBattleFieldView)
         {
            for(i = BattleFieldView.a_1011 - this.m_iRowNum - 1; i < BattleFieldView.a_1011; i++)
            {
               for(j = 0; j < BattleFieldView.a_1012; j++)
               {
                  stFlourPackageDefense = a_4012.getInstance().a_4013(286458064);
                  if(stFlourPackageDefense)
                  {
                     stFlourPackageDefense.iDefenseTypeID = 286458064;
                     stFlourPackageDefense.a_1094 = 0;
                     stFlourPackageDefense.m_iSkillDegree = 0;
                     stFlourPackageDefense.m_iPlaceTimeIntervals = m_stBattleFieldView.iTimeIntervalNum;
                     stFlourPackageDefense.m_iDefenseGlobalID = m_stBattleFieldView.a_2180();
                     addResult = m_stBattleFieldView.a_3441(stFlourPackageDefense,i,j);
                     if(addResult)
                     {
                        stInitialFieldGrid = m_stBattleFieldView.a_3438(j,i);
                        a_3962.a_1088.a_2059(stFlourPackageDefense.m_iDefenseGlobalID,stFlourPackageDefense.a_3512(),stInitialFieldGrid.m_iInitialXGridNo,stInitialFieldGrid.m_iInitialYGridNo,0);
                     }
                     else
                     {
                        stFlourPackageDefense.a_3940();
                     }
                  }
               }
            }
         }
      }
      
      override public function a_4330() : void
      {
         super.a_4330();
         if(this.m_stFlourPackageSkillTextEffect)
         {
            this.m_stFlourPackageSkillTextEffect.a_3940();
            this.m_stFlourPackageSkillTextEffect = null;
         }
      }
      
      protected function GetSkillCoolingReduceTime() : int
      {
         var iReduceTime:int = 0;
         if(m_iSkillDegree <= 8)
         {
            iReduceTime = 20 * m_iSkillDegree;
         }
         else if(m_iSkillDegree > 8)
         {
            iReduceTime = 20 * 8 + 30 * (m_iSkillDegree - 8);
         }
         return 20 * iReduceTime;
      }
      
      protected function GetSkillEffectRowNum() : int
      {
         var iEffectValue:int = 1;
         if(m_iSkillDegree > 0 && m_iSkillDegree <= 3)
         {
            iEffectValue = 1;
         }
         else if(m_iSkillDegree > 3 && m_iSkillDegree <= 6)
         {
            iEffectValue = 2;
         }
         else if(m_iSkillDegree > 6 && m_iSkillDegree <= 8)
         {
            iEffectValue = 3;
         }
         else if(m_iSkillDegree > 8)
         {
            iEffectValue = 4;
         }
         return iEffectValue;
      }
   }
}

