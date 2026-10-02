package com.aurora.ui.maogoutd.resource.Intruder.TigerYear.boss
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class BambooMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 900000;
      
      private var m_iAppearedTime:int;
      
      private var m_iWattingTime:int;
      
      private var m_normal:Boolean = true;
      
      private var m_arrPos:Array = [[-1,0],[1,0],[0,0],[0,-1],[0,1]];
      
      public function BambooMouseMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(BambooMouseMoveIntruder) as BambooMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return BambooMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1339 = this.FULL_HP;
         a_1464 = true;
         this.m_iAppearedTime = 0;
         this.m_iWattingTime = 0;
         a_1279 = 7;
         m_iYDisplayCenterPos = 0;
         a_1275 = 1;
         this.m_normal = false;
         SetCannotSeeByFighter(true);
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
      
      override public function a_4213() : Boolean
      {
         return a_4212();
      }
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null && stFieldGrid.m_iFieldGridType == 4 && this.m_normal)
         {
            stFieldGrid.m_iFieldGridType = 0;
         }
         return true;
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null && 0 == stFieldGrid.m_iFieldGridType)
         {
            stFieldGrid.m_iFieldGridType = 4;
            this.m_normal = true;
         }
         this.a_3502(stFieldGrid);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            a_1465 = 0;
            a_1460 = true;
            this.m_iAppearedTime = iCurrentTime;
            this.addShield(m_stCurrentFieldGrid);
            if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            this.m_iWattingTime = 3 * 20;
         }
         if(this.m_iWattingTime > 0)
         {
            --this.m_iWattingTime;
            if(this.m_iWattingTime == 0)
            {
               if(a_1275 != 2)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
         }
         if(iCurrentTime % 2 == 0)
         {
            return true;
         }
         if(a_1273 == a_1274 - 7)
         {
            this.a_4360(m_stCurrentFieldGrid);
         }
         if(a_1273 == a_1274 - 1)
         {
            this.a_3940();
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
      
      private function a_4360(stFieldGrid:a_3491) : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stCurFieldGrid:a_3491 = null;
         var iLen:int = int(this.m_arrPos.length);
         for(var i:int = 0; i < iLen; i++)
         {
            iXGridNo = stFieldGrid.m_iXGridNo + this.m_arrPos[i][0];
            iYGridNo = stFieldGrid.m_iYGridNo + this.m_arrPos[i][1];
            stCurFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            if(null != stCurFieldGrid)
            {
               this.a_3502(stCurFieldGrid);
            }
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

