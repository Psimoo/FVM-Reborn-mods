package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.AdventureMouse
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.effect.AddBloodEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import flash.display.FrameLabel;
   
   public class DivinerMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 2400;
      
      private static const MAX_INJURED_LIFE:int = 1200;
      
      private static const ONE_GRID_SPEED:int = 4;
      
      private var iSkilling:int = -1;
      
      private var bHasFlower:Boolean = false;
      
      private var digitalGridEffect:DigitalGridEffect;
      
      private var iInitMAXHP:int = 0;
      
      private var bCreateBaby:Boolean = false;
      
      private var lSkillPlace:Array = new Array();
      
      public function DivinerMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(DivinerMouseMoveIntruder) as DivinerMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return DivinerMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         this.iSkilling = -1;
         this.bHasFlower = false;
         this.SetAnimation(1,6);
         this.SetSpeed(ONE_GRID_SPEED);
         a_1481 = false;
         a_1464 = true;
         BoomIsReduceLife = true;
         this.bCreateBaby = false;
         this.lSkillPlace.length = 0;
         AddTag(10);
         return true;
      }
      
      private function SetSpeed(speed:int) : void
      {
         a_1350 = a_3491.a_1080 / (20 * speed);
         if(!a_1283)
         {
            a_1350 *= -1;
         }
      }
      
      override protected function a_3940() : Boolean
      {
         if(this.digitalGridEffect != null)
         {
            this.digitalGridEffect.a_3940();
            this.digitalGridEffect = null;
         }
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(this.iSkilling <= 0)
            {
               if(a_1475)
               {
                  this.SetAnimation(5,10);
               }
               else
               {
                  this.SetAnimation(1,6);
               }
            }
         }
         else
         {
            this.SetAnimation(11);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
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
      
      override public function a_4212() : Boolean
      {
         if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iXGridNo == 0)
         {
            super.a_4212();
         }
         else
         {
            a_3969(900);
         }
         return true;
      }
      
      override public function a_4140(iCurrentTime:int) : void
      {
         var stBaseMoveIntruder:a_4206 = null;
         var stFileGrid:a_3491 = null;
         var stAddBloodEffect:AddBloodEffect = null;
         if(this.bCreateBaby == false && a_1273 == 87)
         {
            this.bCreateBaby = true;
            stBaseMoveIntruder = a_4255.getInstance().a_4256(8388757);
            if(stBaseMoveIntruder)
            {
               stBaseMoveIntruder.a_1797((1 << 16) + m_stCurrentFieldGrid.m_iYGridNo + 50,-1);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,m_stCurrentFieldGrid,true,BattleLayerDefine.INTRUDER_LAND_TYPE);
               stBaseMoveIntruder.x = x;
               stBaseMoveIntruder.a_3969(stBaseMoveIntruder.iLifeValue - this.iInitMAXHP);
               stAddBloodEffect = AddBloodEffect.a_3926();
               stAddBloodEffect.a_1797(false);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,m_stCurrentFieldGrid);
               stAddBloodEffect.x = x;
               stAddBloodEffect.y = y;
            }
         }
         super.a_4140(iCurrentTime);
      }
      
      override public function a_4210() : Boolean
      {
         a_3969(BOOM_INJURE_LIFE);
         return true;
      }
      
      override public function PowerfulBombReduceLifeRate(fRate:Number = 0.3, bIsIgnoreArmor:Boolean = false) : Boolean
      {
         if(a_1339 <= 0)
         {
            return false;
         }
         if(bIsIgnoreArmor)
         {
            a_4209(BOOM_INJURE_LIFE * fRate);
         }
         else
         {
            a_3969(BOOM_INJURE_LIFE * fRate);
         }
         return true;
      }
      
      override public function ShowBatDieEffect() : void
      {
      }
      
      override public function SpecialSkillCallBack(... args) : void
      {
         this.SetAnimationOnce2Loop(0,1,0,1);
      }
      
      override protected function GetiNoX() : int
      {
         var iXGridNo:int = int((x + 30) / a_3491.a_1080);
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
         }
         return iXGridNo;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var iNoX:int = 0;
         var iNoY:int = 0;
         var i:int = 0;
         var j:int = 0;
         var grid:a_3491 = null;
         var numOrigXPos:Number = x;
         if(!a_1460)
         {
            a_1460 = true;
            this.iInitMAXHP = iLifeValue;
         }
         super.a_4216(iCurrentTime);
         if(m_stCurrentFieldGrid == null)
         {
            return true;
         }
         if(this.bHasFlower == false && this.digitalGridEffect == null)
         {
            this.digitalGridEffect = DigitalGridEffect.a_3926();
            this.digitalGridEffect.a_1797(false);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.digitalGridEffect,BattleLayerDefine.INTRUDER_LAND_TYPE,m_stCurrentFieldGrid);
            this.digitalGridEffect.SetAnimationOnce2Loop(0,1);
         }
         if(this.digitalGridEffect != null)
         {
            this.digitalGridEffect.x = x - 20;
            this.digitalGridEffect.y = y;
         }
         SetGameMapModePicnicPosition(numOrigXPos);
         if(a_1273 >= 11 && a_1273 <= 16 || a_1273 >= 44 && a_1273 <= 49)
         {
            this.SetSpeed(ONE_GRID_SPEED);
         }
         else
         {
            this.SetSpeed(0);
         }
         if(a_1273 >= 25 && a_1273 <= 32 || a_1273 >= 58 && a_1273 <= 64)
         {
            this.SkillPickEnergy();
         }
         if(this.bHasFlower == false)
         {
            iNoX = m_stCurrentFieldGrid.m_iXGridNo;
            iNoY = m_stCurrentFieldGrid.m_iYGridNo;
            for(i = iNoX - 1; i <= iNoX + 1; i++)
            {
               for(j = iNoY - 1; j <= iNoY + 1; j++)
               {
                  grid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,j);
                  if(grid != null && this.bHasFlower == false && grid.m_stFlowerDefense != null && (grid.m_stFlowerDefense.iEnergyTypeID == 1 || grid.m_stFlowerDefense.iEnergyTypeID == 3))
                  {
                     this.bHasFlower = true;
                     RemoveTag(10);
                     if(this.digitalGridEffect != null)
                     {
                        this.digitalGridEffect.SetAnimation(2);
                        this.digitalGridEffect = null;
                        break;
                     }
                  }
               }
            }
         }
         if(this.iSkilling > 0)
         {
            a_1464 = true;
         }
         else if(this.bHasFlower == true)
         {
            a_1464 = false;
         }
         else
         {
            a_1464 = true;
         }
         var iXGridNo:int = int((x - 10) / a_3491.a_1080);
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
         }
         if(iXGridNo == 6 || a_1273 == 10)
         {
            if(this.iSkilling == -1 && this.lSkillPlace.indexOf(iXGridNo) == -1)
            {
               this.iSkilling = iCurrentTime;
               this.SetAnimationOnce2Loop(2,3,7,8);
               this.lSkillPlace.push(iXGridNo);
            }
         }
         if(this.iSkilling != -1 && iCurrentTime - this.iSkilling >= 600)
         {
            this.iSkilling = -1;
            this.SetAnimationOnce2Loop(4,1,9,6);
         }
         return true;
      }
      
      private function SkillPickEnergy() : void
      {
         var stBaseEnergy:a_4157 = null;
         var battleView:BattleFieldView = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView;
         if(null != battleView && Boolean(battleView.m_arrBaseEnergyVector))
         {
            for each(stBaseEnergy in battleView.m_arrBaseEnergyVector.slice())
            {
               if(stBaseEnergy.iEnergyPower >= 50)
               {
                  stBaseEnergy.a_4159(x,y,20,false);
               }
            }
         }
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_433 == iEffectType || b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      public function InDamage() : Boolean
      {
         return a_1339 > 0 && a_1339 < MAX_INJURED_LIFE;
      }
      
      public function SetAnimation(animIdx:int, damageIdx:int = 0) : void
      {
         var idx:int = 0;
         idx = this.InDamage() ? damageIdx : animIdx;
         if(a_1275 != idx)
         {
            a_1275 = idx;
            gotoAndStop((a_1276[idx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int, onceDamageIdx:int, loopDamageIdx:int) : void
      {
         var bInDamage:Boolean = false;
         bInDamage = this.InDamage();
         a_1275 = bInDamage ? loopDamageIdx : loopAnimIdx;
         gotoAndStop((a_1276[bInDamage ? onceDamageIdx : onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
   }
}

