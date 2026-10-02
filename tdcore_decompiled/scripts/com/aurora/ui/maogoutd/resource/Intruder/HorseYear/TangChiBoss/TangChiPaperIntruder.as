package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.TangChiBoss
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.game.Util.BattleCardDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   
   public class TangChiPaperIntruder extends BaseGameEffect
   {
      
      private var m_TargetFieldGrid:a_3491;
      
      private var m_iMoveState:int = 0;
      
      private var fMoveSpeed:Number = 0;
      
      private var m_fMoveSpeedY:Number = 0;
      
      private var m_fMoveSpeedX:Number = 0;
      
      private var m_iMoveTick:int = 0;
      
      public function TangChiPaperIntruder()
      {
         super();
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.fMoveSpeed = 60 / (10 * 0.7);
         a_1789.getInstance().addEventListener("DefenseCardCountChange",this.a_3483);
         return true;
      }
      
      public function Move2Target(grid:a_3491) : void
      {
         this.m_TargetFieldGrid = grid;
         this.m_iMoveTick = this.Move2GridNo(grid.m_iXGridNo,grid.m_iYGridNo);
         this.m_iMoveState = 0;
         SetAnimation(0);
      }
      
      private function Move2GridNo(iNoX:int, iNoY:int) : int
      {
         var fPosX:int = a_3491.a_1080 * (iNoX + 0.5);
         var fPosY:int = a_3491.a_1081 * (iNoY + 0.5);
         var fDistanceX:Number = fPosX - this.x;
         var fDistanceY:Number = fPosY - this.y;
         var fDistance:Number = Math.max(Math.abs(fDistanceX),Math.abs(fDistanceY));
         var iMoveTick:int = fDistance / Math.abs(this.fMoveSpeed);
         if(iMoveTick > 0)
         {
            this.m_fMoveSpeedY = fDistanceY / iMoveTick;
            this.m_fMoveSpeedX = fDistanceX / iMoveTick;
         }
         if(iMoveTick < 1)
         {
            iMoveTick = 1;
         }
         return iMoveTick;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         if(this.m_iMoveTick > 0 && this.m_iMoveState == 0)
         {
            --this.m_iMoveTick;
            this.x += this.m_fMoveSpeedX;
            this.y += this.m_fMoveSpeedY;
            if(this.m_iMoveTick == 0)
            {
               this.x = a_3491.a_1080 * (this.m_TargetFieldGrid.m_iXGridNo + 0.5);
               this.y = a_3491.a_1081 * (this.m_TargetFieldGrid.m_iYGridNo + 0.5);
               if(x > 540 || this.m_TargetFieldGrid == null || this.m_TargetFieldGrid.tagCom.HasTag(20020))
               {
                  SetAnimation(1,true);
                  this.m_iMoveState = 2;
               }
               else if(this.CheckHasDefense(this.m_TargetFieldGrid))
               {
                  this.SleepCard(this.m_TargetFieldGrid,true);
                  SetAnimation(2);
                  this.m_iMoveState = 1;
                  this.m_TargetFieldGrid.tagCom.RemoveTag(20020);
               }
               else
               {
                  SetAnimation(1,true);
                  this.m_iMoveState = 2;
                  this.m_TargetFieldGrid.tagCom.RemoveTag(20020);
               }
            }
         }
         else if(this.m_iMoveState == 1)
         {
            if(!this.CheckHasDefense(this.m_TargetFieldGrid))
            {
               this.WakeUp();
            }
         }
         super.a_4109(a_4730);
      }
      
      private function a_3483(stDataEvent:a_1778) : void
      {
         var iDefenseTypeID:int = int(stDataEvent.dataObject[0]);
         var tempFieldGrid:Object = stDataEvent.dataObject.length >= 3 ? stDataEvent.dataObject[2] : null;
         if(tempFieldGrid == null)
         {
            return;
         }
         if(BattleCardDefine.FANS.indexOf(iDefenseTypeID) != -1)
         {
            this.WakeUp();
         }
      }
      
      private function WakeUp() : void
      {
         this.m_TargetFieldGrid.tagCom.RemoveTag(20020);
         this.SleepCard(this.m_TargetFieldGrid,false);
         this.m_iMoveState = 0;
         var iNoX:int = this.m_TargetFieldGrid.m_iXGridNo + 3;
         var iNoY:int = this.m_TargetFieldGrid.m_iYGridNo;
         var targetGrid:a_3491 = this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         this.m_TargetFieldGrid = targetGrid;
         this.m_iMoveTick = this.Move2GridNo(iNoX,iNoY);
         SetAnimation(0);
      }
      
      private function SleepCard(stFieldGrid:a_3491, bSleep:Boolean) : void
      {
         stFieldGrid.m_bShowFrozenEffect = !bSleep;
         if(stFieldGrid.m_stAttackFighter != null)
         {
            stFieldGrid.m_stAttackFighter.m_isShowFrozen = bSleep;
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_isShowFrozen = bSleep;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_isShowFrozen = bSleep;
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_isShowFrozen = bSleep;
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen = bSleep;
         }
      }
      
      private function CheckHasDefense(stFieldGrid:a_3491) : Boolean
      {
         return stFieldGrid.m_stAttackFighter != null || stFieldGrid.m_stTrayDefense != null || stFieldGrid.m_stProtector != null || stFieldGrid.m_stFlowerDefense != null || stFieldGrid.m_stBaseAuxiliaryFighter != null;
      }
      
      override public function a_3940() : Boolean
      {
         a_1789.getInstance().removeEventListener("DefenseCardCountChange",this.a_3483);
         this.SleepCard(this.m_TargetFieldGrid,false);
         super.a_3940();
         return true;
      }
   }
}

