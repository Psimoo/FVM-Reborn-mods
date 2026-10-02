package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Arrogant
{
   import a_4718.b_182;
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.AddBloodEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class WBRedAppleMoveIntruder extends a_4206
   {
      
      private var m_iStartTimeNum:int;
      
      public var m_stPipelineOutletMoveIntruder:PlumberPipelineOutletMoveIntruder;
      
      private var leaveConfigTime:int = 800;
      
      private var bDispatch:Boolean = true;
      
      private var m_iCurrentTimeNum:int = 0;
      
      public function WBRedAppleMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBRedAppleMoveIntruder) as WBRedAppleMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBRedAppleMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 120;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 200000;
         a_1279 = -37;
         m_iYDisplayCenterPos = -5;
         a_1272 = 0;
         a_1463 = true;
         this.m_iStartTimeNum = 0;
         this.SetAnimationOnce2Loop2(0,1);
         this.bDispatch = false;
         if(a_4206.m_iViewBuffId == 320012416)
         {
            this.leaveConfigTime = 300;
         }
         else
         {
            this.leaveConfigTime = 800;
         }
         tagCom.AddTag(40003);
         return true;
      }
      
      private function DispatchDead() : void
      {
         if(this.bDispatch)
         {
            return;
         }
         this.bDispatch = true;
         a_1789.getInstance().dispatchEvent(new a_1778("WB_Apple_Dead"));
      }
      
      override protected function a_3940() : Boolean
      {
         this.DispatchDead();
         this.ClearShield(m_stCurrentFieldGrid);
         super.a_3940();
         return true;
      }
      
      public function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null)
         {
            stFieldGrid.m_dicCannotAddCard["WBRedAppleMoveIntruder"] = true;
         }
         return true;
      }
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null)
         {
            delete stFieldGrid.m_dicCannotAddCard["WBRedAppleMoveIntruder"];
         }
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         var iNoX:int = 0;
         var iNoY:int = 0;
         if(a_1339 > 0 && this.m_iCurrentTimeNum - this.m_iStartTimeNum >= 10)
         {
            if(a_1339 >= 60000)
            {
               this.SetAnimation2(1);
            }
            else
            {
               this.SetAnimation2(2);
            }
         }
         else if(a_1339 <= 0)
         {
            this.SetAnimation2(3);
            if(m_stCurrentFieldGrid)
            {
               this.ClearShield(m_stCurrentFieldGrid);
               iNoX = m_stCurrentFieldGrid.m_iXGridNo;
               iNoY = m_stCurrentFieldGrid.m_iYGridNo;
               if(a_4206.m_iViewBuffId == 320012416)
               {
                  this.CreateRedApple(iNoX - 1,iNoY);
                  this.CreateRedApple(iNoX + 1,iNoY);
                  this.CreateRedApple(iNoX,iNoY - 1);
                  this.CreateRedApple(iNoX,iNoY + 1);
               }
               else
               {
                  this.CreateGreenApple(iNoX - 1,iNoY - 1);
                  this.CreateGreenApple(iNoX,iNoY - 1);
                  this.CreateGreenApple(iNoX + 1,iNoY - 1);
                  this.CreateGreenApple(iNoX - 1,iNoY);
                  this.CreateGreenApple(iNoX + 1,iNoY);
                  this.CreateGreenApple(iNoX - 1,iNoY + 1);
                  this.CreateGreenApple(iNoX,iNoY + 1);
                  this.CreateGreenApple(iNoX + 1,iNoY + 1);
               }
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         a_3419();
         return true;
      }
      
      private function CreateRedApple(iNoX:int, iNoY:int) : void
      {
         var grid1:a_3491 = null;
         var apple:WBRedAppleMoveIntruder = null;
         grid1 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(grid1 == null)
         {
            return;
         }
         if(null == grid1.m_stAttackFighter || grid1.m_stAttackFighter is a_3924)
         {
            return;
         }
         if(!BattleDestroyUtil.DestroyOneGrid(grid1))
         {
            return;
         }
         apple = WBRedAppleMoveIntruder.a_3926() as WBRedAppleMoveIntruder;
         apple.a_1797(0,-1);
         apple.addShield(grid1);
         apple.m_stMoveIntruderTypeID = 8388608;
         apple.x = a_3491.a_1080 * (grid1.m_iXGridNo + 0.5);
         apple.y = a_3491.a_1081 * (grid1.m_iYGridNo + 0.5);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(apple,grid1);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(apple,BattleLayerDefine.INTRUDER_LAND_TYPE,grid1);
      }
      
      private function CreateGreenApple(iNoX:int, iNoY:int) : void
      {
         var grid1:a_3491 = null;
         var apple:WBGreenAppleMoveIntruder = null;
         grid1 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(grid1 == null)
         {
            return;
         }
         if(null == grid1.m_stAttackFighter || grid1.m_stAttackFighter is a_3924)
         {
            return;
         }
         BattleDestroyUtil.ClearOneGrid(grid1);
         apple = WBGreenAppleMoveIntruder.a_3926() as WBGreenAppleMoveIntruder;
         apple.a_1797(0,-1);
         apple.addShield(grid1);
         apple.m_stMoveIntruderTypeID = 8388608;
         apple.x = a_3491.a_1080 * (grid1.m_iXGridNo + 0.5);
         apple.y = a_3491.a_1081 * (grid1.m_iYGridNo + 0.5);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(apple,grid1);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(apple,BattleLayerDefine.INTRUDER_LAND_TYPE,grid1);
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
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(iLifeValue <= 0)
         {
            return true;
         }
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         return true;
      }
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var i:int = 0;
         var item:a_4206 = null;
         var stAddBloodEffect:AddBloodEffect = null;
         if(!a_1460)
         {
            a_1460 = true;
            this.m_iStartTimeNum = iCurrentTime;
         }
         this.m_iCurrentTimeNum = iCurrentTime;
         if(m_stCurrentFieldGrid != null)
         {
            for(i = 0; i < m_stCurrentFieldGrid.a_1511.length; i++)
            {
               item = m_stCurrentFieldGrid.a_1511[i];
               if(item != this && item.iSpaceState == 0 && !item.IsBossIntruder)
               {
                  item.a_3969(-10000);
                  stAddBloodEffect = AddBloodEffect.a_3926();
                  stAddBloodEffect.a_1797(false);
                  stAddBloodEffect.x = item.x;
                  stAddBloodEffect.y = item.y;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
                  this.a_4213();
                  break;
               }
            }
         }
         if(iCurrentTime - this.m_iStartTimeNum == this.leaveConfigTime)
         {
            this.a_3969(iLifeValue);
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      public function SetAnimationOnce2Loop2(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      public function SetAnimation2(animIdx:int) : void
      {
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
   }
}

