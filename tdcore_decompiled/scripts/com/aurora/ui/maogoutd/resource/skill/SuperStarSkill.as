package com.aurora.ui.maogoutd.resource.skill
{
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class SuperStarSkill extends BaseSkill
   {
      
      private var m_arrSuperStarSkillEffectStarArray:Array = [];
      
      private var m_iSuperStarNum:int = 0;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stSuperStarSkillTextEffect:SuperStarSkillTextEffect;
      
      public function SuperStarSkill()
      {
         super();
      }
      
      public static function a_3926() : SuperStarSkill
      {
         return PoolManager.getInstance().CheckOutOne(SuperStarSkill) as SuperStarSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         m_uiSkillCoolingTime = 1200 - this.GetSkillCoolingReduceTime();
         this.m_iSuperStarNum = this.GetSkillEffectStarNum();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stSuperStarSkillEffectStar:SuperStarSkillEffectStar = null;
         super.OnTimeInterval(iTimeNum);
         for(var iStarIndex:int = 0; iStarIndex < this.m_arrSuperStarSkillEffectStarArray.length; iStarIndex++)
         {
            stSuperStarSkillEffectStar = this.m_arrSuperStarSkillEffectStarArray[iStarIndex];
            if(iTimeNum - m_uiStartCoolingTime < 60)
            {
               if(stSuperStarSkillEffectStar)
               {
                  stSuperStarSkillEffectStar.OnTimeInterval(iTimeNum);
               }
            }
            else if(iTimeNum - m_uiStartCoolingTime == 60)
            {
               if(stSuperStarSkillEffectStar)
               {
                  stSuperStarSkillEffectStar.a_3940();
                  stSuperStarSkillEffectStar = null;
               }
            }
         }
         if(this.m_stSuperStarSkillTextEffect)
         {
            this.m_stSuperStarSkillTextEffect.OnTimeInterval(iTimeNum);
            if(this.m_stSuperStarSkillTextEffect.iCurrentFrame == this.m_stSuperStarSkillTextEffect.iTotalFrames)
            {
               this.m_stSuperStarSkillTextEffect.a_3940();
               this.m_stSuperStarSkillTextEffect = null;
            }
         }
      }
      
      override public function UseSkill(iRandomNum:int) : void
      {
         var iTargetXNo:int = 0;
         var iTargetYNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var stSuperStarSkillEffectStar:SuperStarSkillEffectStar = null;
         this.m_stSuperStarSkillTextEffect = SuperStarSkillTextEffect.a_3926();
         this.m_stSuperStarSkillTextEffect.a_1797(false);
         this.m_stSuperStarSkillTextEffect.x = (BattleFieldView.a_1013 - this.m_stSuperStarSkillTextEffect.width) * 0.5;
         this.m_stSuperStarSkillTextEffect.y = 20;
         m_stBattleFieldView.addChild(this.m_stSuperStarSkillTextEffect);
         super.UseSkill(iRandomNum);
         this.m_stRandomSeed.setSeed(iRandomNum + 500,iRandomNum - 300);
         for(var iIndex:int = 0; iIndex < this.m_iSuperStarNum; iIndex++)
         {
            iTargetXNo = 6 + this.m_stRandomSeed.nextInt(BattleFieldView.a_1011 - 6);
            iTargetYNo = int(this.m_stRandomSeed.nextInt(BattleFieldView.a_1012));
            if(m_stBattleFieldView)
            {
               stFieldGrid = m_stBattleFieldView.a_3438(iTargetXNo,iTargetYNo);
               stSuperStarSkillEffectStar = SuperStarSkillEffectStar.a_3926();
               stSuperStarSkillEffectStar.a_1797(!m_stBattleFieldView.isOwnBattleField);
               stSuperStarSkillEffectStar.a_1334 = stFieldGrid;
               stSuperStarSkillEffectStar.m_iSuperStarNum = this.m_iSuperStarNum;
               stSuperStarSkillEffectStar.x = -7 + a_3491.a_1080 * iTargetXNo;
               stSuperStarSkillEffectStar.y = -225 + a_3491.a_1081 * iTargetYNo;
               m_stBattleFieldView.addChild(stSuperStarSkillEffectStar);
               this.m_arrSuperStarSkillEffectStarArray.push(stSuperStarSkillEffectStar);
            }
         }
      }
      
      override public function a_4330() : void
      {
         var stSuperStarSkillEffectStar:SuperStarSkillEffectStar = null;
         super.a_4330();
         for(var iStarIndex:int = 0; iStarIndex < this.m_arrSuperStarSkillEffectStarArray.length; iStarIndex++)
         {
            stSuperStarSkillEffectStar = this.m_arrSuperStarSkillEffectStarArray[iStarIndex];
            if(stSuperStarSkillEffectStar)
            {
               stSuperStarSkillEffectStar.a_3940();
               stSuperStarSkillEffectStar = null;
            }
         }
         if(this.m_stSuperStarSkillTextEffect)
         {
            this.m_stSuperStarSkillTextEffect.a_3940();
         }
         this.m_arrSuperStarSkillEffectStarArray = [];
      }
      
      protected function GetSkillCoolingReduceTime() : int
      {
         return 0;
      }
      
      protected function GetSkillEffectStarNum() : int
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
            iEffectValue = 8;
         }
         else if(m_iSkillDegree == 7)
         {
            iEffectValue = 9;
         }
         else if(m_iSkillDegree == 8)
         {
            iEffectValue = 10;
         }
         else if(m_iSkillDegree == 9)
         {
            iEffectValue = 12;
         }
         else if(m_iSkillDegree == 10)
         {
            iEffectValue = 14;
         }
         return iEffectValue;
      }
   }
}

