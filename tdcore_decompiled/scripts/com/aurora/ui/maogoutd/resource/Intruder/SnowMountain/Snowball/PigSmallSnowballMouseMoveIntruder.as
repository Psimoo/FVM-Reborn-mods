package com.aurora.ui.maogoutd.resource.Intruder.SnowMountain.Snowball
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class PigSmallSnowballMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 1500;
      
      private const HURT_HP:int = 750;
      
      private const DEAD_HP:int = 0;
      
      private var m_iAppearedTime:int;
      
      public function PigSmallSnowballMouseMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(PigSmallSnowballMouseMoveIntruder,PigSmallSnowballMouseMoveIntruderMovie) as PigSmallSnowballMouseMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (2 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1464 = true;
         this.m_iAppearedTime = 0;
         a_1279 = -60;
         a_1467 = 15;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iFieldGridType == 7)
         {
            m_stCurrentFieldGrid.m_iFieldGridType = 0;
         }
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(a_1350 != 0)
            {
               if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         else if(a_1339 > 0)
         {
            if(a_1350 != 0)
            {
               if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
         }
         else if(a_1339 <= 0 && a_1275 != 3)
         {
            a_1275 = 3;
            gotoAndStop((a_1276[3] as FrameLabel).frame);
            if(null != m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         this.ResetMovieStatus();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         this.a_3969(900);
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.a_3940();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            a_1465 = 0;
            if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
            a_1460 = true;
            this.m_iAppearedTime = iCurrentTime;
            this.a_3502(m_stCurrentFieldGrid);
         }
         if(iCurrentTime - this.m_iAppearedTime == 77)
         {
            a_1350 = 0;
            this.ResetMovieStatus();
         }
         if(iCurrentTime - this.m_iAppearedTime >= 20 * 60)
         {
            if(a_1275 != 3)
            {
               a_1275 = 3;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
            this.a_3940();
         }
         super.a_4216(iCurrentTime);
         return true;
      }
      
      override protected function ChangeFieldGrid(stNextFieldGrid:a_3491) : void
      {
         if(null == stNextFieldGrid)
         {
            return;
         }
         if(m_stCurrentFieldGrid.m_iFieldGridType == 7)
         {
            m_stCurrentFieldGrid.m_iFieldGridType = 0;
         }
         var bIsSameRow:Boolean = Boolean(stNextFieldGrid.m_iYGridNo == m_stCurrentFieldGrid.m_iYGridNo);
         if(!bIsSameRow)
         {
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.ReduceRowIntruderNum(this,m_stCurrentFieldGrid.m_iYGridNo);
         }
         stNextFieldGrid.a_3459(this);
         if(!bIsSameRow)
         {
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddRowIntruderNum(this,m_stCurrentFieldGrid.m_iYGridNo);
         }
         this.a_3502(m_stCurrentFieldGrid);
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         if(stFieldGrid.m_iFieldGridType == 0)
         {
            stFieldGrid.m_iFieldGridType = 7;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
   }
}

