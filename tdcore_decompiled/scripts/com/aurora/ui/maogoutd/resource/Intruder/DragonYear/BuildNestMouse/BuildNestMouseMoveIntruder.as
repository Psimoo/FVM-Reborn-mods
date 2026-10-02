package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.BuildNestMouse
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class BuildNestMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 1500;
      
      private static const MAX_INJURED_LIFE:int = MAX_LIFE * 0.3;
      
      private var m_isWithPackage:Boolean;
      
      private var m_isOverThrow:Boolean;
      
      private var m_SkillState:int;
      
      private var m_SkillField:a_3491;
      
      public function BuildNestMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(BuildNestMouseMoveIntruder) as BuildNestMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return BuildNestMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (6 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         a_1464 = true;
         this.m_isWithPackage = true;
         this.m_isOverThrow = false;
         this.m_SkillState = 0;
         m_SecondDieFrame = 125;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         if(this.m_SkillState == 1 && this.m_SkillField.m_isLockBuildMouse && this.m_SkillField.m_stTentMouse == null)
         {
            this.m_SkillField.m_isLockBuildMouse = false;
         }
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > MAX_INJURED_LIFE)
         {
            if(a_1475)
            {
               if(a_1275 != 10)
               {
                  a_1275 = 10;
                  gotoAndStop((a_1276[10] as FrameLabel).frame);
               }
            }
            else if(this.m_SkillState == 1)
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
            else if(this.m_SkillState == 2)
            {
               if(a_1275 != 6)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
            else if(this.m_isWithPackage)
            {
               if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 8)
            {
               a_1275 = 8;
               gotoAndStop((a_1276[8] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(a_1275 != 11)
               {
                  a_1275 = 11;
                  gotoAndStop((a_1276[11] as FrameLabel).frame);
               }
            }
            else if(this.m_SkillState == 1)
            {
               if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
            }
            else if(this.m_SkillState == 2)
            {
               if(a_1275 != 7)
               {
                  a_1275 = 7;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
            }
            else if(this.m_isWithPackage)
            {
               if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 9)
            {
               a_1275 = 9;
               gotoAndStop((a_1276[9] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= 0)
         {
            if(this.m_isWithPackage)
            {
               if(a_1275 != 13)
               {
                  a_1275 = 13;
                  gotoAndStop((a_1276[13] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 12)
            {
               a_1275 = 12;
               gotoAndStop((a_1276[12] as FrameLabel).frame);
            }
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         super.a_4210();
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = x;
         if(a_1464 && (m_stCurrentFieldGrid.a_3492() || x <= 7 * a_3491.a_1080 + a_3491.a_1080 / 2) && this.m_isWithPackage && this.m_SkillState != 1 && this.m_SkillState != 2)
         {
            this.m_SkillField = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(6,m_stCurrentFieldGrid.m_iYGridNo);
            if(m_stCurrentFieldGrid.m_iXGridNo >= 6 && this.m_SkillField.m_stTentMouse == null && !this.m_SkillField.m_isLockBuildMouse)
            {
               this.m_SkillState = 1;
               this.m_SkillField.m_isLockBuildMouse = true;
            }
            else
            {
               this.m_SkillState = 2;
            }
            this.ResetMovieStatus();
         }
         if(this.m_SkillState != 1 && this.m_SkillState != 2)
         {
            super.a_4216(iCurrentTime);
         }
         a_1481 = this.m_SkillState == 1 || this.m_SkillState == 2 ? false : true;
         if(m_stCurrentFieldGrid == null)
         {
            return false;
         }
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == 29 || a_1273 == 62)
            {
               this.a_3502(m_stCurrentFieldGrid);
            }
            else if(!(a_1273 == 32 || a_1273 == 65))
            {
               if(a_1273 == 43 || a_1273 == 75)
               {
                  this.a_4197();
               }
               else if(a_1273 == 47 || a_1273 == 79 || a_1273 == 83 || a_1273 == 87)
               {
                  this.m_isWithPackage = false;
                  this.m_SkillState = 3;
                  this.ResetMovieStatus();
                  a_1464 = false;
               }
            }
         }
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      private function a_4197() : void
      {
         var stBaseMoveIntruder:a_4206 = null;
         var stStartFieldGrid:a_3491 = null;
         if(this.m_isOverThrow)
         {
            return;
         }
         this.m_isOverThrow = true;
         stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(6,m_stCurrentFieldGrid.m_iYGridNo);
         stBaseMoveIntruder = TentMouseMoveIntruder.a_3926();
         if(Boolean(stBaseMoveIntruder) && Boolean(stStartFieldGrid))
         {
            stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + stStartFieldGrid.m_iYGridNo,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
            stBaseMoveIntruder.x = stStartFieldGrid.m_iXGridNo * a_3491.a_1080 + 32;
            stBaseMoveIntruder.y = stStartFieldGrid.m_iYGridNo * a_3491.a_1081;
            stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stStartFieldGrid,true,BattleLayerDefine.INTRUDER_LAND_TYPE);
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}

