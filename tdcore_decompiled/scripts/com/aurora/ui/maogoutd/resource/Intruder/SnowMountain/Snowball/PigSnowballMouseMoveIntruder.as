package com.aurora.ui.maogoutd.resource.Intruder.SnowMountain.Snowball
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class PigSnowballMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 1500;
      
      private const HURT_HP:int = 750;
      
      private const DEAD_HP:int = 0;
      
      private var m_useSkill:Boolean;
      
      private var m_iAppearedTime:int;
      
      public function PigSnowballMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(PigSnowballMouseMoveIntruder) as PigSnowballMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return PigSnowballMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (3 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1275 = 1;
         gotoAndStop((a_1276[1] as FrameLabel).frame);
         a_1279 = -70;
         this.m_useSkill = false;
         this.m_iAppearedTime = 0;
         a_1272 = 0;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(this.m_useSkill)
         {
            return false;
         }
         if(a_1339 > this.HURT_HP)
         {
            if(a_1475)
            {
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
         else if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(a_1275 != 4)
               {
                  a_1275 = 4;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= 0)
         {
            if(a_1275 != 5)
            {
               a_1275 = 5;
               gotoAndStop((a_1276[5] as FrameLabel).frame);
            }
            a_3419();
            if(null != m_stCurrentFieldGrid)
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
         this.ResetMovieStatus();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stBaseMoveIntruder:a_4206 = null;
         var stStartFieldGrid:a_3491 = null;
         if(!a_1460)
         {
            a_1460 = true;
            this.m_iAppearedTime = iCurrentTime;
         }
         if(iCurrentTime - this.m_iAppearedTime == 1)
         {
            this.m_useSkill = true;
            a_1275 = 0;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         if(a_1273 == 5 && this.m_useSkill)
         {
            stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
            stBaseMoveIntruder = PigSmallSnowballMouseMoveIntruder.a_3926();
            stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + stStartFieldGrid.m_iYGridNo,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
            stBaseMoveIntruder.x = stStartFieldGrid.m_iXGridNo * a_3491.a_1080 - 30;
            stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stStartFieldGrid,false);
            this.m_useSkill = false;
         }
         if(!this.m_useSkill)
         {
            this.ResetMovieStatus();
            super.a_4216(iCurrentTime);
         }
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}

