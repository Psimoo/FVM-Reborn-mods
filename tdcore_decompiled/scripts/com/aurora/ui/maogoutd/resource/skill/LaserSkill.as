package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class LaserSkill extends BaseSkill
   {
      
      private var m_stLaserSkillEffectConchArray:Array = [];
      
      private var m_stLaserSkillEffectLaserArray:Array = [];
      
      private var m_iLaserRows:int = 1;
      
      private var m_iStarRowIndex:int = 0;
      
      private var m_stLaserSkillTextEffect:LaserSkillTextEffect;
      
      private var m_isSkillUsed:Boolean = false;
      
      public function LaserSkill()
      {
         super();
      }
      
      public static function a_3926() : LaserSkill
      {
         return PoolManager.getInstance().CheckOutOne(LaserSkill) as LaserSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         m_uiSkillCoolingTime = 4200 - this.GetSkillCoolingReduceTime();
         this.m_iLaserRows = this.GetSkillEffectRowNum();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stLaserSkillEffectConch:LaserSkillEffectConch = null;
         var stLaserSkillEffectLaser:LaserSkillEffectLaser = null;
         var iYIndex:int = 0;
         var iDepthIndex:int = 0;
         var stFieldGridVector:Array = null;
         var iXIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         super.OnTimeInterval(iTimeNum);
         if(!this.m_isSkillUsed)
         {
            return;
         }
         for(iYIndex = this.m_iStarRowIndex; iYIndex < this.m_iLaserRows + this.m_iStarRowIndex; iYIndex++)
         {
            stLaserSkillEffectConch = this.m_stLaserSkillEffectConchArray[iYIndex];
            stLaserSkillEffectLaser = this.m_stLaserSkillEffectLaserArray[iYIndex];
            if(iTimeNum - m_uiStartCoolingTime < 60)
            {
               if(stLaserSkillEffectConch)
               {
                  stLaserSkillEffectConch.OnTimeInterval(iTimeNum);
               }
               if(stLaserSkillEffectLaser)
               {
                  if(iTimeNum - m_uiStartCoolingTime == 30)
                  {
                     stLaserSkillEffectLaser.x = -20;
                     stLaserSkillEffectLaser.y = stLaserSkillEffectConch.y + 180;
                     iDepthIndex = m_stBattleFieldView.getChildIndex(m_stBattleFieldView.arrBackDepthBitmap[iYIndex]);
                     m_stBattleFieldView.addChildAt(stLaserSkillEffectLaser,iDepthIndex);
                  }
                  if(iTimeNum - m_uiStartCoolingTime >= 30)
                  {
                     stLaserSkillEffectLaser.OnTimeInterval(iTimeNum);
                  }
               }
               if(iTimeNum - m_uiStartCoolingTime == 50)
               {
                  stFieldGridVector = m_stBattleFieldView.stFieldGridsVector;
                  for(iXIndex = 0; iXIndex < BattleFieldView.a_1011; iXIndex++)
                  {
                     arrMoveIntruder = stFieldGridVector[iYIndex][iXIndex].a_1511.slice();
                     for each(stMoveIntruder in arrMoveIntruder)
                     {
                        stMoveIntruder.a_4210();
                     }
                  }
               }
            }
            else if(iTimeNum - m_uiStartCoolingTime == 60)
            {
               if(stLaserSkillEffectConch)
               {
                  stLaserSkillEffectConch.a_3940();
                  stLaserSkillEffectConch = null;
               }
               if(stLaserSkillEffectLaser)
               {
                  stLaserSkillEffectLaser.a_3940();
                  stLaserSkillEffectLaser = null;
               }
               this.m_stLaserSkillEffectConchArray[iYIndex] = null;
               this.m_stLaserSkillEffectLaserArray[iYIndex] = null;
               this.m_isSkillUsed = false;
            }
         }
         if(this.m_stLaserSkillTextEffect)
         {
            this.m_stLaserSkillTextEffect.OnTimeInterval(iTimeNum);
            if(this.m_stLaserSkillTextEffect.iCurrentFrame == this.m_stLaserSkillTextEffect.iTotalFrames)
            {
               this.m_stLaserSkillTextEffect.a_3940();
               this.m_stLaserSkillTextEffect = null;
            }
         }
      }
      
      override public function UseSkill(iRandomNum:int) : void
      {
         var stLaserSkillEffectConch:LaserSkillEffectConch = null;
         var stLaserSkillEffectLaser:LaserSkillEffectLaser = null;
         var iYIndex:int = 0;
         var iDepthIndex:int = 0;
         this.m_isSkillUsed = true;
         this.m_stLaserSkillTextEffect = LaserSkillTextEffect.a_3926();
         this.m_stLaserSkillTextEffect.a_1797(false);
         this.m_stLaserSkillTextEffect.x = (BattleFieldView.a_1013 - this.m_stLaserSkillTextEffect.width) * 0.5;
         this.m_stLaserSkillTextEffect.y = 20;
         m_stBattleFieldView.addChild(this.m_stLaserSkillTextEffect);
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
            stLaserSkillEffectConch = LaserSkillEffectConch.a_3926();
            stLaserSkillEffectLaser = LaserSkillEffectLaser.a_3926();
            if(m_stBattleFieldView)
            {
               stLaserSkillEffectConch.a_1797(!m_stBattleFieldView.isOwnBattleField);
               stLaserSkillEffectLaser.a_1797(!m_stBattleFieldView.isOwnBattleField);
               stLaserSkillEffectConch.x = -20;
               stLaserSkillEffectConch.y = a_3491.a_1081 * iYIndex - 175;
               iDepthIndex = m_stBattleFieldView.getChildIndex(m_stBattleFieldView.arrBackDepthBitmap[iYIndex]);
               m_stBattleFieldView.addChildAt(stLaserSkillEffectConch,iDepthIndex);
            }
            this.m_stLaserSkillEffectConchArray[iYIndex] = stLaserSkillEffectConch;
            this.m_stLaserSkillEffectLaserArray[iYIndex] = stLaserSkillEffectLaser;
         }
      }
      
      override public function a_4330() : void
      {
         var stLaserSkillEffectConch:LaserSkillEffectConch = null;
         var stLaserSkillEffectLaser:LaserSkillEffectLaser = null;
         super.a_4330();
         this.m_isSkillUsed = false;
         for(var iYIndex:int = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
         {
            stLaserSkillEffectConch = this.m_stLaserSkillEffectConchArray[iYIndex];
            stLaserSkillEffectLaser = this.m_stLaserSkillEffectLaserArray[iYIndex];
            if(stLaserSkillEffectConch)
            {
               stLaserSkillEffectConch.a_3940();
               stLaserSkillEffectConch = null;
            }
            if(stLaserSkillEffectLaser)
            {
               stLaserSkillEffectLaser.a_3940();
               stLaserSkillEffectLaser = null;
            }
            this.m_stLaserSkillEffectConchArray[iYIndex] = null;
            this.m_stLaserSkillEffectLaserArray[iYIndex] = null;
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
      
      protected function GetSkillEffectRowNum() : int
      {
         var iEffectValue:int = 0;
         if(m_iSkillDegree <= 2)
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
         else if(m_iSkillDegree == 7)
         {
            iEffectValue = 4;
         }
         else if(m_iSkillDegree == 8)
         {
            iEffectValue = 5;
         }
         else if(m_iSkillDegree == 9)
         {
            iEffectValue = 6;
         }
         else if(m_iSkillDegree == 10)
         {
            iEffectValue = 7;
         }
         return iEffectValue;
      }
   }
}

