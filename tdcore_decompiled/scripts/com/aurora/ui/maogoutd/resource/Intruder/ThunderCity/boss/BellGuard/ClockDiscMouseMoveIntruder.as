package com.aurora.ui.maogoutd.resource.Intruder.ThunderCity.boss.BellGuard
{
   import a_4718.b_182;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class ClockDiscMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 15000;
      
      private var m_iAppearedTime:int;
      
      private var m_iWattingTime:int;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_BurnTimes:int = 60;
      
      public var m_index:int;
      
      private var releaseArray:Array = [8389309,8389310,8389316];
      
      public function ClockDiscMouseMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : ClockDiscMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(ClockDiscMouseMoveIntruder) as ClockDiscMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return ClockDiscMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1339 = this.FULL_HP * 0.05;
         a_1464 = true;
         this.m_iAppearedTime = 0;
         this.m_iWattingTime = 0;
         a_1279 = 0;
         m_iYDisplayCenterPos = 0;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         if(m_stCurrentFieldGrid != null)
         {
            if(m_stCurrentFieldGrid.m_stMouseObstacle)
            {
               m_stCurrentFieldGrid.m_stMouseObstacle = null;
            }
            this.ClearShield(m_stCurrentFieldGrid);
         }
         super.a_3940();
         return true;
      }
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null && stFieldGrid.m_iFieldGridType == 1)
         {
            stFieldGrid.m_iFieldGridType = 0;
         }
         return true;
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null && 0 == stFieldGrid.m_iFieldGridType)
         {
            stFieldGrid.m_iFieldGridType = 1;
         }
         this.a_3502(stFieldGrid);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         a_3969(900);
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
            a_1460 = true;
            this.m_stRandomSeed.setSeed(globalMoveFighterID - m_stCurrentFieldGrid.m_iYGridNo,globalMoveFighterID + m_stCurrentFieldGrid.m_iYGridNo);
            this.m_iAppearedTime = iCurrentTime;
            this.addShield(m_stCurrentFieldGrid);
            if(a_1275 != this.m_index)
            {
               a_1275 = this.m_index;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(0 == iCurrentTime % 2)
         {
            return false;
         }
         if(a_1273 == 44 || a_1273 == 79 || a_1273 == 114)
         {
            this.RealeaseMouse();
            if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            this.m_iWattingTime = 3 * 20;
         }
         if(this.m_iWattingTime > 0)
         {
            --this.m_iWattingTime;
            if(this.m_iWattingTime == 0)
            {
               this.showRealeasMovie();
            }
         }
         trace("Clock_CurrentFrame>>>" + a_1273);
         return true;
      }
      
      private function showRealeasMovie() : void
      {
         var tempIndex:int = 0;
         do
         {
            tempIndex = this.m_stRandomSeed.nextInt(3) + 1;
         }
         while(tempIndex == this.m_index && tempIndex > 3);
         this.m_index = tempIndex;
         if(a_1275 != this.m_index)
         {
            a_1275 = this.m_index;
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
      
      private function RealeaseMouse() : void
      {
         var stStartFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         trace("释放第" + this.m_index + "种类型老鼠!");
         if(null == m_stCurrentFieldGrid)
         {
            return;
         }
         var iXGridNo:int = Math.min(m_stCurrentFieldGrid.m_iXGridNo + 0,BattleFieldView.a_1011 - 1);
         var iYGridNoStart:int = Math.max(m_stCurrentFieldGrid.m_iYGridNo - 1,0);
         var iYGridNoEnd:int = Math.min(m_stCurrentFieldGrid.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         for(var iYGridNo:int = iYGridNoStart; iYGridNo <= iYGridNoEnd; iYGridNo++)
         {
            stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            if(!stStartFieldGrid)
            {
               throw Error(toString() + "::RealeaseMouse->iXGridNo = " + iXGridNo + "  iYGridNo = " + iYGridNo);
            }
            stBaseMoveIntruder = a_4255.getInstance().a_4256(this.releaseArray[this.m_index - 1]);
            if(null == stBaseMoveIntruder)
            {
               throw Error("前端map_mouse.xml配置 MouseID节点 缺少老鼠ID：" + this.releaseArray[this.m_index - 1].toString(16));
            }
            stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + iYGridNo,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = this.releaseArray[this.m_index - 1];
            stBaseMoveIntruder.x = stStartFieldGrid.m_iXGridNo * a_3491.a_1080;
            stBaseMoveIntruder.y = iYPosSkewing + stBaseMoveIntruder.iYPosSkewing + (stStartFieldGrid.m_iYGridNo + 1) * a_3491.a_1081 - stBaseMoveIntruder.height;
            stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stStartFieldGrid,false);
         }
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
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
   }
}

