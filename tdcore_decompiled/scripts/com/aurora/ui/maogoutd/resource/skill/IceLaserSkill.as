package com.aurora.ui.maogoutd.resource.skill
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4126;
   
   public class IceLaserSkill extends BaseSkill
   {
      
      private var m_stIceLaserSkillEffectConchArray:Array = [];
      
      private var m_stIceLaserSkillEffectLaserArray:Array = [];
      
      private var m_iLaserRows:int = 1;
      
      private var m_iStarRowIndex:int = 0;
      
      private var m_stIceLaserSkillTextEffect:IceLaserSkillTextEffect;
      
      public function IceLaserSkill()
      {
         super();
      }
      
      public static function a_3926() : IceLaserSkill
      {
         return PoolManager.getInstance().CheckOutOne(IceLaserSkill) as IceLaserSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         m_uiSkillCoolingTime = 4200 - this.GetSkillCoolingReduceTime();
         this.m_iLaserRows = this.GetSkillEffectRowNum();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stIceLaserSkillEffectConch:IceLaserSkillEffectConch = null;
         var stIceLaserSkillEffectLaser:IceLaserSkillEffectLaser = null;
         var iYIndex:int = 0;
         var iDepthIndex:int = 0;
         var stFieldGridVector:Array = null;
         var iXIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var stIceFreezeUpEffect:a_4126 = null;
         super.OnTimeInterval(iTimeNum);
         for(iYIndex = this.m_iStarRowIndex; iYIndex < this.m_iLaserRows + this.m_iStarRowIndex; iYIndex++)
         {
            stIceLaserSkillEffectConch = this.m_stIceLaserSkillEffectConchArray[iYIndex];
            stIceLaserSkillEffectLaser = this.m_stIceLaserSkillEffectLaserArray[iYIndex];
            if(iTimeNum - m_uiStartCoolingTime < 80)
            {
               if(stIceLaserSkillEffectConch)
               {
                  stIceLaserSkillEffectConch.OnTimeInterval(iTimeNum);
               }
               if(stIceLaserSkillEffectLaser)
               {
                  if(iTimeNum - m_uiStartCoolingTime == 28)
                  {
                     stIceLaserSkillEffectLaser.x = -20;
                     stIceLaserSkillEffectLaser.y = stIceLaserSkillEffectConch.y + 85;
                     iDepthIndex = m_stBattleFieldView.getChildIndex(m_stBattleFieldView.arrBackDepthBitmap[iYIndex]);
                     m_stBattleFieldView.addChildAt(stIceLaserSkillEffectLaser,iDepthIndex);
                  }
                  if(iTimeNum - m_uiStartCoolingTime >= 28)
                  {
                     stIceLaserSkillEffectLaser.OnTimeInterval(iTimeNum);
                  }
               }
               if(iTimeNum - m_uiStartCoolingTime == 56)
               {
                  stFieldGridVector = m_stBattleFieldView.stFieldGridsVector;
                  for(iXIndex = 0; iXIndex < BattleFieldView.a_1011; iXIndex++)
                  {
                     arrMoveIntruder = stFieldGridVector[iYIndex][iXIndex].a_1511.slice();
                     for each(stMoveIntruder in arrMoveIntruder)
                     {
                        if(stMoveIntruder.visible)
                        {
                           stIceFreezeUpEffect = a_4126.a_3926();
                        }
                        stMoveIntruder.a_4208(b_182.a_434,80,stIceFreezeUpEffect);
                        stMoveIntruder.a_4208(b_182.a_433,200);
                     }
                  }
               }
            }
            else if(iTimeNum - m_uiStartCoolingTime == 85)
            {
               if(stIceLaserSkillEffectConch)
               {
                  stIceLaserSkillEffectConch.a_3940();
                  stIceLaserSkillEffectConch = null;
               }
               if(stIceLaserSkillEffectLaser)
               {
                  stIceLaserSkillEffectLaser.a_3940();
                  stIceLaserSkillEffectLaser = null;
               }
               this.m_stIceLaserSkillEffectConchArray[iYIndex] = null;
               this.m_stIceLaserSkillEffectLaserArray[iYIndex] = null;
            }
         }
         if(this.m_stIceLaserSkillTextEffect)
         {
            this.m_stIceLaserSkillTextEffect.OnTimeInterval(iTimeNum);
            if(this.m_stIceLaserSkillTextEffect.iCurrentFrame == this.m_stIceLaserSkillTextEffect.iTotalFrames)
            {
               this.m_stIceLaserSkillTextEffect.a_3940();
               this.m_stIceLaserSkillTextEffect = null;
            }
         }
      }
      
      override public function UseSkill(iRandomNum:int) : void
      {
         var stIceLaserSkillEffectConch:IceLaserSkillEffectConch = null;
         var stIceLaserSkillEffectLaser:IceLaserSkillEffectLaser = null;
         var iYIndex:int = 0;
         var iDepthIndex:int = 0;
         this.m_stIceLaserSkillTextEffect = IceLaserSkillTextEffect.a_3926();
         this.m_stIceLaserSkillTextEffect.a_1797(false);
         this.m_stIceLaserSkillTextEffect.x = (BattleFieldView.a_1013 - this.m_stIceLaserSkillTextEffect.width) * 0.5;
         this.m_stIceLaserSkillTextEffect.y = 20;
         m_stBattleFieldView.addChild(this.m_stIceLaserSkillTextEffect);
         super.UseSkill(iRandomNum);
         if(Boolean(m_stBaseAvatar) && Boolean(m_stBaseAvatar.stFieldGrid))
         {
            this.m_iStarRowIndex = m_stBaseAvatar.stFieldGrid.m_iYGridNo - int(this.m_iLaserRows / 2);
            if(this.m_iStarRowIndex < 0)
            {
               this.m_iStarRowIndex = 0;
            }
            else if(this.m_iStarRowIndex > BattleFieldView.a_1012 - this.m_iLaserRows)
            {
               this.m_iStarRowIndex = BattleFieldView.a_1012 - this.m_iLaserRows;
            }
         }
         for(iYIndex = this.m_iStarRowIndex; iYIndex < this.m_iLaserRows + this.m_iStarRowIndex; iYIndex++)
         {
            stIceLaserSkillEffectConch = IceLaserSkillEffectConch.a_3926();
            stIceLaserSkillEffectLaser = IceLaserSkillEffectLaser.a_3926();
            if(m_stBattleFieldView)
            {
               stIceLaserSkillEffectConch.a_1797(!m_stBattleFieldView.isOwnBattleField);
               stIceLaserSkillEffectLaser.a_1797(!m_stBattleFieldView.isOwnBattleField);
               stIceLaserSkillEffectConch.x = -20;
               stIceLaserSkillEffectConch.y = a_3491.a_1081 * iYIndex - 110;
               iDepthIndex = m_stBattleFieldView.getChildIndex(m_stBattleFieldView.arrBackDepthBitmap[iYIndex]);
               m_stBattleFieldView.addChildAt(stIceLaserSkillEffectConch,iDepthIndex);
            }
            this.m_stIceLaserSkillEffectConchArray[iYIndex] = stIceLaserSkillEffectConch;
            this.m_stIceLaserSkillEffectLaserArray[iYIndex] = stIceLaserSkillEffectLaser;
         }
      }
      
      override public function a_4330() : void
      {
         var stIceLaserSkillEffectConch:IceLaserSkillEffectConch = null;
         var stIceLaserSkillEffectLaser:IceLaserSkillEffectLaser = null;
         super.a_4330();
         for(var iYIndex:int = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
         {
            stIceLaserSkillEffectConch = this.m_stIceLaserSkillEffectConchArray[iYIndex];
            stIceLaserSkillEffectLaser = this.m_stIceLaserSkillEffectLaserArray[iYIndex];
            if(stIceLaserSkillEffectConch)
            {
               stIceLaserSkillEffectConch.a_3940();
               stIceLaserSkillEffectConch = null;
            }
            if(stIceLaserSkillEffectLaser)
            {
               stIceLaserSkillEffectLaser.a_3940();
               stIceLaserSkillEffectLaser = null;
            }
            this.m_stIceLaserSkillEffectConchArray[iYIndex] = null;
            this.m_stIceLaserSkillEffectLaserArray[iYIndex] = null;
         }
      }
      
      protected function GetSkillCoolingReduceTime() : int
      {
         var iReduceTime:int = 0;
         iReduceTime = 10 * m_iSkillDegree;
         return 20 * iReduceTime;
      }
      
      protected function GetSkillEffectRowNum() : int
      {
         return 7;
      }
   }
}

