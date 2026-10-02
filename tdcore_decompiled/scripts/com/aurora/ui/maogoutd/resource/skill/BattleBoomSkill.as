package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.BattleBoomShot;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class BattleBoomSkill extends BaseSkill
   {
      
      private var m_stBattleBoomSkillEffectConchArray:Array = [];
      
      private var m_iBoomNum:int = 2;
      
      private var m_iStarRowIndex:int = 0;
      
      private var m_stBattleBoomSkillTextEffect:BattleBoomSkillTextEffect;
      
      public function BattleBoomSkill()
      {
         super();
      }
      
      public static function a_3926() : BattleBoomSkill
      {
         return PoolManager.getInstance().CheckOutOne(BattleBoomSkill) as BattleBoomSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         m_uiSkillCoolingTime = 2300 - this.GetSkillCoolingReduceTime();
         this.m_iBoomNum = this.GetSkillEffectBoomNum();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stBattleBoomSkillEffectConch:BattleBoomSkillEffectConch = null;
         var stLastWaitShot:a_4348 = null;
         super.OnTimeInterval(iTimeNum);
         for(var iBombIndex:int = 0; iBombIndex < this.m_stBattleBoomSkillEffectConchArray.length; iBombIndex++)
         {
            stBattleBoomSkillEffectConch = this.m_stBattleBoomSkillEffectConchArray[iBombIndex];
            if(iTimeNum - m_uiStartCoolingTime < 50)
            {
               if(stBattleBoomSkillEffectConch)
               {
                  stBattleBoomSkillEffectConch.OnTimeInterval(iTimeNum);
                  if(iTimeNum - m_uiStartCoolingTime == 38)
                  {
                     stLastWaitShot = BattleBoomShot.a_4344();
                     if((stLastWaitShot as Object).hasOwnProperty("a_1598"))
                     {
                        (stLastWaitShot as Object).a_1598 = stBattleBoomSkillEffectConch.m_stAttackTargetFieldGrid;
                     }
                     stLastWaitShot.iShotSequenceNum = 0;
                     stLastWaitShot.a_1797(0,15,50,m_stBattleFieldView.isOwnBattleField ? int(a_3491.a_1080 * stBattleBoomSkillEffectConch.a_1334.m_iXGridNo) : int(BattleFieldView.a_1013 - a_3491.a_1080 * stBattleBoomSkillEffectConch.a_1334.m_iXGridNo),a_3491.a_1081 * stBattleBoomSkillEffectConch.a_1334.m_iYGridNo,m_stBattleFieldView,stBattleBoomSkillEffectConch.a_1334);
                     stBattleBoomSkillEffectConch.parent.addChildAt(stLastWaitShot,m_stBattleFieldView.a_3433());
                  }
               }
            }
            else if(iTimeNum - m_uiStartCoolingTime == 50)
            {
               if(stBattleBoomSkillEffectConch)
               {
                  stBattleBoomSkillEffectConch.a_3940();
                  stBattleBoomSkillEffectConch = null;
                  this.m_stBattleBoomSkillEffectConchArray[iBombIndex] = 0;
               }
            }
         }
         if(iTimeNum - m_uiStartCoolingTime == 50)
         {
            this.m_stBattleBoomSkillEffectConchArray = [];
         }
         if(this.m_stBattleBoomSkillTextEffect)
         {
            this.m_stBattleBoomSkillTextEffect.OnTimeInterval(iTimeNum);
            if(this.m_stBattleBoomSkillTextEffect.iCurrentFrame == this.m_stBattleBoomSkillTextEffect.iTotalFrames)
            {
               this.m_stBattleBoomSkillTextEffect.a_3940();
               this.m_stBattleBoomSkillTextEffect = null;
            }
         }
      }
      
      override public function UseSkill(iRandomNum:int) : void
      {
         var iIndex:int = 0;
         var stBattleBoomSkillEffectConch:BattleBoomSkillEffectConch = null;
         var iXIndex:int = 0;
         var iYIndex:int = 0;
         var iDepthIndex:int = 0;
         var iTotalGridNumExistDefense:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         this.m_stBattleBoomSkillTextEffect = BattleBoomSkillTextEffect.a_3926();
         this.m_stBattleBoomSkillTextEffect.a_1797(false);
         this.m_stBattleBoomSkillTextEffect.x = (BattleFieldView.a_1013 - this.m_stBattleBoomSkillTextEffect.width) * 0.5;
         this.m_stBattleBoomSkillTextEffect.y = 20;
         m_stBattleFieldView.addChild(this.m_stBattleBoomSkillTextEffect);
         super.UseSkill(iRandomNum);
         this.m_iStarRowIndex = 3 - int(this.m_iBoomNum / 2);
         if(this.m_iStarRowIndex < 0)
         {
            this.m_iStarRowIndex = 0;
         }
         else if(this.m_iStarRowIndex > BattleFieldView.a_1012 - this.m_iBoomNum)
         {
            this.m_iStarRowIndex = BattleFieldView.a_1012 - this.m_iBoomNum;
         }
         this.m_stBattleBoomSkillEffectConchArray = [];
         for(iIndex = this.m_iStarRowIndex; iIndex < this.m_iBoomNum + this.m_iStarRowIndex; iIndex++)
         {
            stBattleBoomSkillEffectConch = BattleBoomSkillEffectConch.a_3926();
            if(m_stBattleFieldView)
            {
               stBattleBoomSkillEffectConch.a_1797(!m_stBattleFieldView.isOwnBattleField);
               iXIndex = 1;
               iYIndex = iIndex;
               stBattleBoomSkillEffectConch.x = -20 + a_3491.a_1080 * iXIndex;
               if(!m_stBattleFieldView.isOwnBattleField)
               {
                  stBattleBoomSkillEffectConch.x = BattleFieldView.a_1013 - stBattleBoomSkillEffectConch.x;
               }
               stBattleBoomSkillEffectConch.y = -100 + a_3491.a_1081 * iYIndex;
               stBattleBoomSkillEffectConch.a_1334 = m_stBattleFieldView.a_3438(iXIndex,iYIndex);
               iDepthIndex = m_stBattleFieldView.getChildIndex(m_stBattleFieldView.arrBackDepthBitmap[iYIndex]);
               m_stBattleFieldView.addChildAt(stBattleBoomSkillEffectConch,iDepthIndex);
               iTotalGridNumExistDefense = m_stBattleFieldView.m_stOpponentBattleFieldInstance.a_3423();
               stTargetFieldGrid = m_stBattleFieldView.m_stOpponentBattleFieldInstance.a_3427((iRandomNum + iIndex) % iTotalGridNumExistDefense);
               if(null == stTargetFieldGrid)
               {
                  stTargetFieldGrid = m_stBattleFieldView.m_stOpponentBattleFieldInstance.stFieldGridsVector[(iRandomNum + iIndex) % BattleFieldView.a_1012][(iRandomNum - iIndex) % BattleFieldView.a_1011];
               }
               stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3460(stTargetFieldGrid.m_iXGridNo,stTargetFieldGrid.m_iYGridNo);
               stBattleBoomSkillEffectConch.m_stAttackTargetFieldGrid = stTargetFieldGrid;
            }
            this.m_stBattleBoomSkillEffectConchArray.push(stBattleBoomSkillEffectConch);
         }
      }
      
      override public function a_4330() : void
      {
         var stBattleBoomSkillEffectConch:BattleBoomSkillEffectConch = null;
         super.a_4330();
         for(var iBombIndex:int = 0; iBombIndex < this.m_stBattleBoomSkillEffectConchArray.length; iBombIndex++)
         {
            stBattleBoomSkillEffectConch = this.m_stBattleBoomSkillEffectConchArray[iBombIndex];
            if(stBattleBoomSkillEffectConch)
            {
               stBattleBoomSkillEffectConch.a_3940();
               stBattleBoomSkillEffectConch = null;
            }
         }
         this.m_stBattleBoomSkillEffectConchArray = [];
      }
      
      protected function GetSkillCoolingReduceTime() : int
      {
         var iReduceTime:int = 0;
         if(m_iSkillDegree < 10)
         {
            iReduceTime = 5 * m_iSkillDegree;
         }
         else if(m_iSkillDegree >= 10)
         {
            iReduceTime = 5 * 9 + 10 * (m_iSkillDegree - 9);
         }
         return 20 * iReduceTime;
      }
      
      protected function GetSkillEffectBoomNum() : int
      {
         var iEffectValue:int = 1;
         if(m_iSkillDegree > 0 && m_iSkillDegree <= 2)
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
         else if(m_iSkillDegree > 6 && m_iSkillDegree <= 8)
         {
            iEffectValue = 4;
         }
         else if(m_iSkillDegree == 9)
         {
            iEffectValue = 5;
         }
         else if(m_iSkillDegree == 10)
         {
            iEffectValue = 6;
         }
         return iEffectValue;
      }
   }
}

