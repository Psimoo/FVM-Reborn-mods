package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Assistant
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class SmallHatMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 90000;
      
      private const HURT_HP:int = 40000;
      
      private const DEAD_HP:int = 0;
      
      private var m_iStartTime:int;
      
      private var m_skilldelaTcik:int;
      
      private var m_bIsUsedSkill:Boolean;
      
      public function SmallHatMouseMoveIntruder()
      {
         super();
         a_1279 = -46;
         a_1467 = 10;
         a_1481 = false;
         BoomIsReduceLife = true;
         a_1463 = true;
         m_m_isCannotHurtByInsurance = true;
         m_bPostEnemy = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(SmallHatMouseMoveIntruder) as SmallHatMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return SmallHatMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = 0;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         this.m_iStartTime = 0;
         this.m_bIsUsedSkill = false;
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         super.a_4210();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(!this.m_bIsUsedSkill)
            {
               if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(!this.m_bIsUsedSkill)
            {
               if(a_1275 != 2)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 < 0)
         {
            a_1275 = 4;
            gotoAndStop((a_1276[4] as FrameLabel).frame);
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            a_1460 = true;
            this.addShield(m_stCurrentFieldGrid);
            this.m_iStartTime = iCurrentTime;
            a_1275 = 0;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
            this.m_skilldelaTcik = 1 * 20;
         }
         if(this.m_skilldelaTcik > 0)
         {
            --this.m_skilldelaTcik;
            if(this.m_skilldelaTcik == 0)
            {
               this.m_skilldelaTcik = 7 * 20;
               this.m_bIsUsedSkill = true;
               if(a_1339 >= this.HURT_HP)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
               else
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
         }
         if(this.m_bIsUsedSkill && a_1273 == 25 || a_1273 == 50)
         {
            this.RealeaseMouse();
            this.a_3969(10000);
         }
         return true;
      }
      
      private function RealeaseMouse() : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stBaseMoveIntruder:a_4206 = null;
         var stStartFieldGrid:a_3491 = null;
         if(null == m_stCurrentFieldGrid)
         {
            return;
         }
         this.m_bIsUsedSkill = false;
         iXGridNo = m_stCurrentFieldGrid.m_iXGridNo - 1;
         iYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
         stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         if(stStartFieldGrid != null)
         {
            stBaseMoveIntruder = AssistantJumpingMouseMoveIntruder.a_3926();
            stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + stStartFieldGrid.m_iYGridNo,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
            stBaseMoveIntruder.x = (stStartFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            stBaseMoveIntruder.y = iYPosSkewing + stBaseMoveIntruder.iYPosSkewing + (stStartFieldGrid.m_iYGridNo + 1) * a_3491.a_1081 - stBaseMoveIntruder.height;
            stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stStartFieldGrid,false);
         }
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null)
         {
            stFieldGrid.m_dicCannotAddCard["SmallHatMouseMoveIntruder"] = true;
         }
         return true;
      }
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null)
         {
            delete stFieldGrid.m_dicCannotAddCard["SmallHatMouseMoveIntruder"];
         }
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         a_1339 = 0;
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         this.a_3940();
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override protected function a_3940() : Boolean
      {
         this.ClearShield(m_stCurrentFieldGrid);
         super.a_3940();
         return true;
      }
   }
}

