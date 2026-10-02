package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.StoneMouseGolem
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class StoneStatueMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 500;
      
      private static const MAX_INJURED_LIFE:int = MAX_LIFE * 0.4;
      
      private var m_BlooDBarEffect:BlooDBarEffect;
      
      private var m_ShieldEffect:ShieldEffect;
      
      private var m_BlooD:int;
      
      private var m_isChangeState:Boolean;
      
      private var m_ShowShield:Boolean;
      
      private var stTargetFieldGrid:a_3491;
      
      private var randomNum:int;
      
      private var m_isBrokeState:Boolean;
      
      public function StoneStatueMouseMoveIntruder()
      {
         super();
         a_1279 = -26;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(StoneStatueMouseMoveIntruder) as StoneStatueMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return StoneStatueMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (8 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         this.m_ShowShield = true;
         this.m_BlooD = 0;
         this.m_isChangeState = false;
         a_1481 = true;
         a_1377 = 0;
         this.m_isBrokeState = false;
         a_1476 = 38;
         BoomIsReduceLife = true;
         CanCharm = false;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         if(this.m_BlooDBarEffect)
         {
            this.m_BlooDBarEffect.a_3940();
            this.m_BlooDBarEffect = null;
         }
         if(this.m_ShieldEffect)
         {
            this.m_ShieldEffect.a_3940();
            this.m_ShieldEffect = null;
         }
         if(m_stCurrentFieldGrid.m_iFieldGridType == 20)
         {
            m_stCurrentFieldGrid.m_iFieldGridType = 0;
         }
         super.a_3940();
         return true;
      }
      
      override protected function EattingJudge() : void
      {
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > MAX_INJURED_LIFE)
         {
            if(a_1339 >= 10000)
            {
               this.m_BlooD = 0;
            }
            else if(a_1339 >= 5000)
            {
               this.m_BlooD = 1;
            }
            else
            {
               this.m_BlooD = 2;
            }
            if(this.m_BlooDBarEffect)
            {
               this.m_BlooDBarEffect.FrameIndex(this.m_BlooD);
            }
            if(this.m_isChangeState)
            {
               if(a_1275 != 5)
               {
                  this.ChangeState();
                  a_1275 = 5;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
            }
            else if(a_1475)
            {
               this.m_isBrokeState = true;
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
            if(a_1339 >= 10000)
            {
               this.m_BlooD = 0;
            }
            else if(a_1339 >= 5000)
            {
               this.m_BlooD = 1;
            }
            else
            {
               this.m_BlooD = 2;
            }
            if(this.m_BlooDBarEffect)
            {
               this.m_BlooDBarEffect.FrameIndex(this.m_BlooD);
            }
            if(this.m_isChangeState)
            {
               if(a_1275 != 7)
               {
                  this.ChangeState();
                  a_1275 = 7;
                  gotoAndStop((a_1276[6] as FrameLabel).frame);
               }
            }
            else if(a_1475)
            {
               this.m_isBrokeState = true;
               if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= 0)
         {
            this.HideSkill(false);
            if(this.m_isChangeState)
            {
               if(a_1275 != 8)
               {
                  a_1275 = 8;
                  gotoAndStop((a_1276[8] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 9)
            {
               a_1275 = 9;
               gotoAndStop((a_1276[9] as FrameLabel).frame);
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
         var value:int = iRduceLifeValue;
         if(iRduceLifeValue > 0)
         {
            value = this.m_ShowShield ? 10 : 100;
         }
         super.a_3969(value);
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         var value:int = iRduceLifeValue;
         if(iRduceLifeValue > 0)
         {
            value = this.m_ShowShield ? 10 : 100;
         }
         super.a_4209(value);
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
         if(!a_1460)
         {
            a_1460 = true;
            this.randomNum = BattleFieldView.m_stRandomSeed.nextInt(2) + 4;
            this.stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.randomNum,m_stCurrentFieldGrid.m_iYGridNo);
            this.AddBlooDBarEffect();
            this.AddShieldEffect();
            this.ResetMovieStatus();
         }
         if(!this.m_isChangeState)
         {
            super.a_4216(iCurrentTime);
         }
         if(m_stCurrentFieldGrid == null)
         {
            return false;
         }
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == 50 || a_1273 == 69)
            {
               if(this.m_isBrokeState)
               {
                  this.a_3502(m_stCurrentFieldGrid);
                  this.m_isBrokeState = false;
               }
            }
         }
         if(m_stCurrentFieldGrid.m_iYGridNo != this.stTargetFieldGrid.m_iYGridNo)
         {
            this.stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.stTargetFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
         }
         if(m_stCurrentFieldGrid.m_iXGridNo <= this.stTargetFieldGrid.m_iXGridNo && !this.m_isChangeState)
         {
            if(x <= this.stTargetFieldGrid.m_iXGridNo * a_3491.a_1080 + a_3491.a_1080 / 2 - 30)
            {
               if(this.stTargetFieldGrid.m_iFieldGridType == 0 || this.stTargetFieldGrid.m_iXGridNo == 1)
               {
                  this.m_isChangeState = true;
                  this.ResetMovieStatus();
               }
               else
               {
                  this.stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
               }
            }
         }
         this.m_ShowShield = (a_1285 > 0 || a_1468 > 0 || PoisonHurtPower > 0) > 0 ? false : true;
         if(m_stCurrentFieldGrid == null)
         {
            return false;
         }
         if(this.m_BlooDBarEffect)
         {
            this.m_BlooDBarEffect.x = this.x - 6;
            this.m_BlooDBarEffect.y = this.y + 6;
            this.m_BlooDBarEffect.visible = !visible || iLifeValue <= 0 ? false : true;
         }
         if(this.m_ShieldEffect)
         {
            this.m_ShieldEffect.x = this.x - 38;
            this.m_ShieldEffect.y = this.y + 150;
            this.m_ShieldEffect.visible = !visible || iLifeValue <= 0 ? false : this.m_ShowShield;
         }
         return true;
      }
      
      override public function HideSkill(boo:Boolean) : void
      {
         this.m_BlooDBarEffect.visible = this.m_ShieldEffect.visible = boo;
      }
      
      private function ChangeState() : void
      {
         if(m_stCurrentFieldGrid != null)
         {
            ChangeFieldGrid(this.stTargetFieldGrid);
            a_1350 = 0;
            a_1474 = 0;
            a_1481 = false;
            if(m_stCurrentFieldGrid.m_iFieldGridType == 0)
            {
               m_stCurrentFieldGrid.m_iFieldGridType = 20;
            }
            this.a_3502(m_stCurrentFieldGrid);
         }
      }
      
      private function AddBlooDBarEffect() : void
      {
         if(Boolean(m_stCurrentFieldGrid) && this.m_BlooDBarEffect == null)
         {
            this.m_BlooDBarEffect = BlooDBarEffect.a_3926();
            this.m_BlooDBarEffect.a_1797(false);
            this.m_BlooDBarEffect.x = this.x - 6;
            this.m_BlooDBarEffect.y = this.y + 6;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_BlooDBarEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,m_stCurrentFieldGrid);
            this.m_BlooDBarEffect.play();
         }
      }
      
      private function AddShieldEffect() : void
      {
         if(Boolean(m_stCurrentFieldGrid) && this.m_ShieldEffect == null)
         {
            this.m_ShieldEffect = ShieldEffect.a_3926();
            this.m_ShieldEffect.a_1797(false);
            this.m_ShieldEffect.x = this.x - 38;
            this.m_ShieldEffect.y = this.y + 150;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_ShieldEffect,BattleLayerDefine.INTRUDER_LAND_TYPE,m_stCurrentFieldGrid);
            this.m_ShieldEffect.play();
         }
      }
      
      override public function a_4210() : Boolean
      {
         if(this.m_ShowShield)
         {
            this.a_3969(10);
         }
         else
         {
            this.a_3969(100);
         }
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         if(this.m_ShowShield)
         {
            this.a_3969(10);
         }
         else
         {
            this.a_3969(100);
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         if(this.m_ShowShield)
         {
            this.a_3969(10);
         }
         else
         {
            this.a_3969(100);
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(iEffectType != b_182.a_435)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return true;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}

