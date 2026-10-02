package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.GreedyDemon
{
   import a_4718.b_180;
   import a_4718.b_182;
   import a_4728.a_1778;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   import flash.display.FrameLabel;
   import flash.events.MouseEvent;
   import flash.utils.setTimeout;
   
   public class WBGreedyBabyMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 100000;
      
      private static const MAX_INJURED_LIFE:int = 50000;
      
      private static const ONE_GRID_SPEED:int = 0;
      
      protected var curColor:int = 0;
      
      private var realColor:int = 0;
      
      private var hasDieType:int = 0;
      
      private var m_iRemainTick:int = 0;
      
      private var _babys:Array;
      
      private var m_stGrid:a_3491;
      
      private var m_OutArray:Array = new Array([-35,-78],[11,-80],[-18,-110]);
      
      public function WBGreedyBabyMoveIntruder()
      {
         super();
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1279 = 0;
         m_iYDisplayCenterPos = -8;
         a_1272 = 0;
         this.SetAnimationOnce2Loop(0,1);
         this.realColor = 0;
         this.hasDieType = 0;
         this.m_iRemainTick = 0;
         this.m_stGrid = null;
         a_1481 = false;
         m_ChageMouseYLocked = true;
         return true;
      }
      
      public function InitData(rColor:int, babys:Array, energy:int) : void
      {
         this._babys = babys;
         this.realColor = rColor;
         this.m_stGrid = m_stCurrentFieldGrid;
         var stDataEvent:a_1778 = new a_1778("SetEnergyMAX");
         stDataEvent.dataObject = energy;
         if(root)
         {
            root.dispatchEvent(stDataEvent);
         }
      }
      
      override protected function a_3940() : Boolean
      {
         var stDataEvent:a_1778 = new a_1778("SetEnergyMAX");
         stDataEvent.dataObject = -1;
         if(root)
         {
            root.dispatchEvent(stDataEvent);
         }
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(this.hasDieType != 0)
         {
            return true;
         }
         if(a_1339 > 0)
         {
            this.SetAnimation(1);
         }
         else
         {
            this.ClearAll();
         }
         return true;
      }
      
      private function ClearAll() : void
      {
         var real:Boolean = this.curColor == this.realColor;
         for(var i:int = 0; i < this._babys.length; i++)
         {
            if(this._babys[i] != this)
            {
               this._babys[i].CallDie(real);
            }
         }
         this.Boom2Die();
      }
      
      private function CallDie(realDie:Boolean) : void
      {
         if(realDie == true)
         {
            this.hasDieType = 3;
            this.Boom2Die();
         }
         else if(this.realColor == this.curColor)
         {
            this.hasDieType = 2;
            this.Boom2Die();
         }
         else
         {
            this.hasDieType = 1;
            this.Remove2Die();
         }
      }
      
      private function Boom2Die() : void
      {
         if(iLifeValue > 0)
         {
            a_1339 = 0;
         }
         this.SetAnimation(5);
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         play();
      }
      
      private function Remove2Die() : void
      {
         if(iLifeValue > 0)
         {
            a_1339 = 0;
         }
         this.SetAnimation(3);
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         play();
      }
      
      private function ProdudeEnergy(pIndex:int, max:int) : void
      {
         var offect:int = 0;
         var stFreeEnergy:a_4157 = null;
         for(var iIndex:int = 0; iIndex < max; iIndex++)
         {
            offect = iIndex == 1 ? 1 : -1;
            stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
            if(null != stFreeEnergy)
            {
               stFreeEnergy.m_stCurrentBattleField = this.m_stGrid.m_stCurrentBattbleFieldView;
               stFreeEnergy.a_1797(0,100,x + this.m_OutArray[pIndex][0] + offect * 10,y + this.m_OutArray[pIndex][1]);
               this.m_stGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFreeEnergy,BattleLayerDefine.EFFECTS_TOP_TYPE);
               setTimeout(this.onDispathEvent,500,stFreeEnergy);
            }
         }
      }
      
      private function onDispathEvent(stFreeEnergy:a_4157) : void
      {
         stFreeEnergy.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_OVER));
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         ++this.m_iRemainTick;
         if(this.m_iRemainTick == 600)
         {
            if(this.curColor == this.realColor)
            {
               this.hasDieType = 2;
               this.Boom2Die();
               return true;
            }
            this.SetAnimation(3);
            this.Remove2Die();
            return true;
         }
         if(this.m_iRemainTick > 600)
         {
            return true;
         }
         if(!a_1460)
         {
            a_1460 = true;
         }
         if(m_LastPositionX != x || m_LastPositionY != y)
         {
            m_LastPositionX = x;
            m_LastPositionY = y;
            UpdateFollowEffect();
         }
         return true;
      }
      
      override public function a_4140(iCurrentTime:int) : void
      {
         super.a_4140(iCurrentTime);
         if(this.hasDieType == 3)
         {
            if(a_1273 == 85)
            {
               this.ProdudeEnergy(0,2);
            }
            else if(a_1273 == 87)
            {
               this.ProdudeEnergy(1,2);
            }
            else if(a_1273 == 89)
            {
               this.ProdudeEnergy(2,2);
            }
         }
         else if(this.hasDieType == 2)
         {
            if(a_1273 == 87)
            {
               this.ProdudeEnergy(1,1);
            }
         }
         if(a_1273 == a_1274 || a_1273 == 55 || a_1273 == 73)
         {
            this.a_3940();
         }
      }
      
      public function InDamage() : Boolean
      {
         return a_1339 > 0 && a_1339 < MAX_INJURED_LIFE;
      }
      
      public function SetAnimation(animIdx:int) : void
      {
         a_1275 = animIdx;
         gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
         a_3419();
      }
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_4213() : Boolean
      {
         a_1339 = 0;
         this.ClearAll();
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         this.a_3940();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         a_1339 = 0;
         this.ClearAll();
         ShowBoomDieEffect();
         this.a_3940();
         return true;
      }
      
      override public function ReduceAllLife(iRduceLifeValue:int, bIsIgnoreArmor:Boolean = false, ishowHuijing:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
   }
}

