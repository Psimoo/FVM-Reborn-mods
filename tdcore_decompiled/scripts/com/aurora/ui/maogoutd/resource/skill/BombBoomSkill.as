package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class BombBoomSkill extends BaseSkill
   {
      
      private var m_stBombBoomSkillEffectConchArray:Array = [];
      
      private var m_stBombBoomSkillTextEffect:BombBoomSkillTextEffect;
      
      public function BombBoomSkill()
      {
         super();
      }
      
      public static function a_3926() : BombBoomSkill
      {
         return PoolManager.getInstance().CheckOutOne(BombBoomSkill) as BombBoomSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         m_uiSkillCoolingTime = 6400 - this.GetSkillCoolingReduceTime();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stBombBoomSkillEffectConch:BombBoomSkillEffectConch = null;
         super.OnTimeInterval(iTimeNum);
         for(var iBombIndex:int = 0; iBombIndex < this.m_stBombBoomSkillEffectConchArray.length; iBombIndex++)
         {
            stBombBoomSkillEffectConch = this.m_stBombBoomSkillEffectConchArray[iBombIndex];
            if(iTimeNum - m_uiStartCoolingTime < 40)
            {
               if(stBombBoomSkillEffectConch)
               {
                  stBombBoomSkillEffectConch.OnTimeInterval(iTimeNum);
               }
            }
            else if(iTimeNum - m_uiStartCoolingTime == 40)
            {
               if(stBombBoomSkillEffectConch)
               {
                  stBombBoomSkillEffectConch.a_3940();
                  stBombBoomSkillEffectConch = null;
                  this.m_stBombBoomSkillEffectConchArray[iBombIndex] = 0;
               }
            }
         }
         if(iTimeNum - m_uiStartCoolingTime == 40)
         {
            this.m_stBombBoomSkillEffectConchArray = [];
         }
         if(this.m_stBombBoomSkillTextEffect)
         {
            this.m_stBombBoomSkillTextEffect.OnTimeInterval(iTimeNum);
            if(this.m_stBombBoomSkillTextEffect.iCurrentFrame == this.m_stBombBoomSkillTextEffect.iTotalFrames)
            {
               this.m_stBombBoomSkillTextEffect.a_3940();
               this.m_stBombBoomSkillTextEffect = null;
            }
         }
      }
      
      override public function UseSkill(iRandomNum:int) : void
      {
         var stBombBoomSkillEffectConch:BombBoomSkillEffectConch = null;
         var iXIndex:int = 0;
         var iYIndex:int = 0;
         var iDepthIndex:int = 0;
         this.m_stBombBoomSkillTextEffect = BombBoomSkillTextEffect.a_3926();
         this.m_stBombBoomSkillTextEffect.a_1797(false);
         this.m_stBombBoomSkillTextEffect.x = (BattleFieldView.a_1013 - this.m_stBombBoomSkillTextEffect.width) * 0.5;
         this.m_stBombBoomSkillTextEffect.y = 20;
         m_stBattleFieldView.addChild(this.m_stBombBoomSkillTextEffect);
         super.UseSkill(iRandomNum);
         this.m_stBombBoomSkillEffectConchArray = [];
         for(var iIndex:int = 0; iIndex < 5; iIndex++)
         {
            stBombBoomSkillEffectConch = BombBoomSkillEffectConch.a_3926();
            if(m_stBattleFieldView)
            {
               stBombBoomSkillEffectConch.a_1797(!m_stBattleFieldView.isOwnBattleField);
               iXIndex = BattleFieldView.a_1011 - 4 + 2 * ((iIndex + 1) % 2);
               iYIndex = 1 + iIndex;
               stBombBoomSkillEffectConch.x = 30 + a_3491.a_1080 * iXIndex;
               stBombBoomSkillEffectConch.y = -100 + a_3491.a_1081 * iYIndex;
               stBombBoomSkillEffectConch.a_1334 = m_stBattleFieldView.a_3438(iXIndex,iYIndex);
               iDepthIndex = m_stBattleFieldView.getChildIndex(m_stBattleFieldView.arrBackDepthBitmap[iYIndex]);
               m_stBattleFieldView.addChildAt(stBombBoomSkillEffectConch,iDepthIndex);
            }
            this.m_stBombBoomSkillEffectConchArray.push(stBombBoomSkillEffectConch);
         }
      }
      
      override public function a_4330() : void
      {
         var stBombBoomSkillEffectConch:BombBoomSkillEffectConch = null;
         super.a_4330();
         for(var iBombIndex:int = 0; iBombIndex < this.m_stBombBoomSkillEffectConchArray.length; iBombIndex++)
         {
            stBombBoomSkillEffectConch = this.m_stBombBoomSkillEffectConchArray[iBombIndex];
            if(stBombBoomSkillEffectConch)
            {
               stBombBoomSkillEffectConch.a_3940();
               stBombBoomSkillEffectConch = null;
            }
         }
         this.m_stBombBoomSkillEffectConchArray = [];
         if(this.m_stBombBoomSkillTextEffect)
         {
            this.m_stBombBoomSkillTextEffect.a_3940();
            this.m_stBombBoomSkillTextEffect = null;
         }
      }
      
      protected function GetSkillCoolingReduceTime() : int
      {
         var iReduceTime:int = 0;
         if(m_iSkillDegree <= 10)
         {
            iReduceTime = 20 * m_iSkillDegree;
         }
         return 20 * iReduceTime;
      }
   }
}

