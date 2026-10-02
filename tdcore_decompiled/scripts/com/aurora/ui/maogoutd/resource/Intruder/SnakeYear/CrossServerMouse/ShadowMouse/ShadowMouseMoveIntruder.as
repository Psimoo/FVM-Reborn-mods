package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.CrossServerMouse.ShadowMouse
{
   import a_4718.b_182;
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.protocol.game.maogoutd.CEntityStateChange;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class ShadowMouseMoveIntruder extends a_4206
   {
      
      private var MAX_LIFE:int = 1000000;
      
      private var MAX_INJURED_LIFE:int = 60000;
      
      private var STEP_LIFE:int = 200000;
      
      private var m_iState:int = 0;
      
      private var m_stStartFieldGrid:a_3491;
      
      public var specialInit:Boolean = false;
      
      private var m_bDesertBuff:Boolean = false;
      
      private var _effect:SmallWhirlwindEffect = null;
      
      public function ShadowMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(ShadowMouseMoveIntruder) as ShadowMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return ShadowMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         this.SetSpeed(0);
         a_1279 = -width * 0.2 - 24;
         m_iYDisplayCenterPos = 7;
         a_1272 = 0;
         a_1464 = true;
         this.m_iState = 0;
         this.SetAnimation(0);
         m_ChageMouseYLocked = true;
         a_1481 = false;
         this.m_bDesertBuff = false;
         this.specialInit = false;
         a_1789.getInstance().addEventListener("ClearFog_Desert",this.OnClearFogDesert);
         return true;
      }
      
      private function OnClearFogDesert(stDataEvent:a_1778) : void
      {
         this.BackInit();
      }
      
      private function SetSpeed(iSpeed:Number) : void
      {
         if(iSpeed == 0)
         {
            a_1350 = 0;
            return;
         }
         a_1350 = a_3491.a_1080 / (iSpeed * 20);
         if(!a_1283)
         {
            a_1350 *= -1;
         }
      }
      
      override protected function a_3940() : Boolean
      {
         a_1789.getInstance().removeEventListener("ClearFog_Desert",this.OnClearFogDesert);
         this.DestroySmallWhirlWind();
         this.ClearShield();
         this.m_stStartFieldGrid = null;
         super.a_3940();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            a_1339 = 1000000;
            a_1460 = true;
            this.MAX_LIFE = a_1339;
            this.STEP_LIFE = this.MAX_LIFE / 5;
            this.MAX_INJURED_LIFE = this.STEP_LIFE * 0.3;
            this.m_stStartFieldGrid = m_stCurrentFieldGrid;
            tagCom.AddTag(31);
            if(this.specialInit == false)
            {
               this.AddShield();
            }
            else
            {
               a_1339 = this.STEP_LIFE * 1;
               this.m_bDesertBuff = true;
               this.ResetMovieStatus();
            }
         }
         super.a_4216(iCurrentTime);
         if(m_stCurrentFieldGrid == null)
         {
            return true;
         }
         if(this.m_iState == 4)
         {
            if(this.m_bDesertBuff)
            {
               this.SetSpeed(4);
            }
            else
            {
               this.SetSpeed(0);
            }
            if(this.m_bDesertBuff)
            {
               this.a_3502(m_stCurrentFieldGrid);
            }
            else if(m_stCurrentFieldGrid.m_stDesertFogEffect != null && m_stCurrentFieldGrid.m_stDesertFogEffect.visible == true)
            {
               this.m_bDesertBuff = true;
            }
            a_1465 = 0;
         }
         else
         {
            this.SetSpeed(0);
            if(this.LineHasMouse())
            {
               a_1465 = 1;
            }
            else
            {
               a_1465 = 0;
            }
         }
         if(this.m_bDesertBuff)
         {
            this.CreateSmallWhirlWind();
         }
         else
         {
            this.DestroySmallWhirlWind();
         }
         this.UpdateEffect();
         return true;
      }
      
      public function LineHasMouse() : Boolean
      {
         var grid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var iNoY:int = m_stCurrentFieldGrid.m_iYGridNo;
         for(var i:int = 0; i < BattleFieldView.a_1011; i++)
         {
            grid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,iNoY);
            if(grid != null)
            {
               arrMoveIntruder = grid.a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(stMoveIntruder.m_stMoveIntruderTypeID != 8393228)
                  {
                     return true;
                  }
               }
            }
         }
         return false;
      }
      
      override public function ChaneSpeed(m_speedF:int, m_iTime:int) : void
      {
      }
      
      public function BackInit() : void
      {
         if(a_1339 <= 0)
         {
            return;
         }
         if(this.m_stStartFieldGrid == null)
         {
            return;
         }
         if(this.m_iState != 4)
         {
            return;
         }
         if(this.m_bDesertBuff == false)
         {
            return;
         }
         this.SetSpeed(0);
         a_1339 = this.MAX_LIFE;
         this.m_bDesertBuff = false;
         tagCom.AddTag(31);
         this.ResetMovieStatus();
      }
      
      private function CreateSmallWhirlWind() : void
      {
         if(this._effect != null)
         {
            return;
         }
         this._effect = SmallWhirlwindEffect.a_3926();
         this._effect.a_1797(false);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this._effect,BattleLayerDefine.EFFECTS_TOP_TYPE,m_stCurrentFieldGrid);
      }
      
      private function UpdateEffect() : void
      {
         if(this._effect == null)
         {
            return;
         }
         this._effect.x = x;
         this._effect.y = y;
      }
      
      private function DestroySmallWhirlWind() : void
      {
         if(this._effect == null)
         {
            return;
         }
         this._effect.a_3940();
         this._effect = null;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         var stEnemyVanish:CEntityStateChange = null;
         if(a_1339 > this.STEP_LIFE * 4)
         {
            if(this.m_iState != 0)
            {
               if(a_1275 == 10)
               {
                  this.SetAnimationOnce2Loop(12,0);
               }
               else
               {
                  this.SetAnimationOnce2Loop(13,0);
               }
            }
            else
            {
               this.SetAnimation(0);
            }
            this.m_iState = 0;
         }
         else if(a_1339 > this.STEP_LIFE * 3)
         {
            if(this.m_iState != 1)
            {
               this.SetAnimationOnce2Loop(1,2);
            }
            else
            {
               this.SetAnimation(2);
            }
            this.m_iState = 1;
         }
         else if(a_1339 > this.STEP_LIFE * 2)
         {
            if(this.m_iState != 2)
            {
               this.SetAnimationOnce2Loop(3,4);
            }
            else
            {
               this.SetAnimation(4);
            }
            this.m_iState = 2;
         }
         else if(a_1339 > this.STEP_LIFE)
         {
            if(this.m_iState != 3)
            {
               this.SetAnimationOnce2Loop(5,6);
            }
            else
            {
               this.SetAnimation(6);
            }
            this.m_iState = 3;
         }
         else if(a_1339 > 0)
         {
            if(this.m_iState != 4)
            {
               stEnemyVanish = new CEntityStateChange();
               stEnemyVanish.m_iGlobalID = a_1459;
               stEnemyVanish.m_iTypeID = m_stMoveIntruderTypeID;
               stEnemyVanish.m_iType = 2;
               stEnemyVanish.key = 1000;
               stEnemyVanish.value = 1;
               a_1088.PostEntityStateChange(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.iTimeIntervalNum,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_byTeamNo,[stEnemyVanish]);
               this.ClearShield();
               this.SetAnimationOnce2Loop(7,10);
            }
            else if(a_1339 > this.MAX_INJURED_LIFE)
            {
               this.SetAnimation(10);
            }
            else
            {
               this.SetAnimation(11);
            }
            this.m_iState = 4;
         }
         else
         {
            this.SetAnimation(14);
            if(m_stCurrentFieldGrid)
            {
               this.ClearShield();
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         return true;
      }
      
      protected function AddShield() : Boolean
      {
         if(this.m_stStartFieldGrid != null)
         {
            this.m_stStartFieldGrid.m_dicCannotAddCard["ShadowMouse"] = true;
         }
         return true;
      }
      
      protected function ClearShield() : Boolean
      {
         if(this.m_stStartFieldGrid != null)
         {
            delete this.m_stStartFieldGrid.m_dicCannotAddCard["ShadowMouse"];
            tagCom.RemoveTag(31);
         }
         return true;
      }
      
      private function SetAnimation(iFrameLabelIndex:int) : void
      {
         if(a_1275 != iFrameLabelIndex)
         {
            a_1275 = iFrameLabelIndex;
            gotoAndStop((a_1276[iFrameLabelIndex] as FrameLabel).frame);
         }
         a_3419();
      }
      
      private function SetAnimationOnce2Loop(onceIdx:int, loopIdx:int) : void
      {
         a_1275 = loopIdx;
         gotoAndStop((a_1276[onceIdx] as FrameLabel).frame);
         a_3419();
      }
      
      override public function a_4210() : Boolean
      {
         return false;
      }
      
      override public function a_4213() : Boolean
      {
         return false;
      }
      
      override public function a_4212() : Boolean
      {
         return false;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(iEffectType == b_182.a_432)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(this.ChangeReduceLife(iRduceLifeValue));
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         super.a_4209(this.ChangeReduceLife(iRduceLifeValue));
         return true;
      }
      
      override public function ReduceAllLife(iRduceLifeValue:int, bIsIgnoreArmor:Boolean = false, ishowHuijing:Boolean = false) : Boolean
      {
         super.ReduceAllLife(this.ChangeReduceLife(iRduceLifeValue),bIsIgnoreArmor,ishowHuijing);
         return true;
      }
      
      public function ChangeReduceLife(iRduceLifeValue:int) : int
      {
         if(a_1339 > this.STEP_LIFE * 4)
         {
            iRduceLifeValue = Math.min(iRduceLifeValue,a_1339 - this.STEP_LIFE * 4);
         }
         else if(a_1339 > this.STEP_LIFE * 3)
         {
            iRduceLifeValue = Math.min(iRduceLifeValue,a_1339 - this.STEP_LIFE * 3);
         }
         else if(a_1339 > this.STEP_LIFE * 2)
         {
            iRduceLifeValue = Math.min(iRduceLifeValue,a_1339 - this.STEP_LIFE * 2);
         }
         else if(a_1339 > this.STEP_LIFE * 1)
         {
            iRduceLifeValue = Math.min(iRduceLifeValue,a_1339 - this.STEP_LIFE * 1);
         }
         else
         {
            iRduceLifeValue = 100;
         }
         return iRduceLifeValue;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      override public function PowerfulBombReduceLifeRate(fRate:Number = 0.3, bIsIgnoreArmor:Boolean = false) : Boolean
      {
         if(a_1339 <= 0)
         {
            return false;
         }
         if(bIsIgnoreArmor)
         {
            this.a_4209(BOOM_INJURE_LIFE * fRate);
         }
         else
         {
            this.a_3969(BOOM_INJURE_LIFE * fRate);
         }
         return true;
      }
      
      override public function SpecialSkillCallBack(... args) : void
      {
         if(args.length == 2 && args[0] == 1000 && args[1] == 1)
         {
            if(a_1339 > this.STEP_LIFE)
            {
               a_1339 = this.STEP_LIFE - 1;
               this.ClearShield();
               this.SetAnimationOnce2Loop(7,10);
               this.m_iState = 4;
            }
         }
      }
      
      override public function ShowBatDieEffect() : void
      {
      }
      
      override public function get IsBossIntruder() : Boolean
      {
         return true;
      }
   }
}

