package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Assistant
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class AssistantMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 12800;
      
      private static const MAX_INJURED_LIFE:int = 6000;
      
      private var m_SkillState:int;
      
      private var m_isOverThrow:Boolean;
      
      public function AssistantMouseMoveIntruder()
      {
         super();
         a_1279 = -37;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(AssistantMouseMoveIntruder) as AssistantMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return AssistantMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (4 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1466 = 1000000;
         BoomIsReduceLife = true;
         a_1339 = MAX_LIFE;
         a_1464 = true;
         this.m_isOverThrow = false;
         this.m_SkillState = 1;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > MAX_INJURED_LIFE)
         {
            if(this.m_SkillState == 2)
            {
               if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            else if(this.m_SkillState == 3)
            {
               if(a_1275 != 2)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(this.m_SkillState == 2)
            {
               if(a_1275 != 4)
               {
                  a_1275 = 4;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
            }
            else if(this.m_SkillState == 3)
            {
               if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 3)
            {
               a_1275 = 3;
               gotoAndStop((a_1276[3] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= 0)
         {
            if(this.m_SkillState != 3)
            {
               a_3419();
               if(m_stCurrentFieldGrid)
               {
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               }
               this.play();
            }
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         BoomIsReduceLife == Boolean(a_1466 > 0);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
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
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == 18 || a_1273 == 55)
            {
               if(m_stCurrentFieldGrid == null || m_stCurrentFieldGrid.m_iXGridNo == 0 || m_stCurrentFieldGrid.m_stAttackFighter != null && m_stCurrentFieldGrid.m_stAttackFighter is a_3924)
               {
                  trace("人物最后一格不释放技能");
               }
               else
               {
                  this.a_4197();
               }
               this.a_3502(m_stCurrentFieldGrid);
            }
            else if(a_1273 == 20 || a_1273 == 57)
            {
               this.m_SkillState = 3;
               this.ResetMovieStatus();
            }
            else if(a_1273 == 37 || a_1273 == 74)
            {
               a_3940();
            }
         }
         if(this.m_SkillState == 1)
         {
            super.a_4216(iCurrentTime);
            if(Boolean(m_stCurrentFieldGrid) && m_stCurrentFieldGrid.a_3492())
            {
               this.m_SkillState = 2;
               this.ResetMovieStatus();
            }
         }
         a_1481 = this.m_SkillState == 1 ? true : false;
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
         stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
         stBaseMoveIntruder = SmallHatMouseMoveIntruder.a_3926();
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
         if(null == stFieldGrid || stFieldGrid.m_isShowFrozen)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseOnlyFrozen();
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_433 != iEffectType && b_182.a_434 != iEffectType && b_182.enm_shotEffectXuanYun != iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}

