package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Adventure2
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class VampireBossBatsMoveIntruder extends a_4206
   {
      
      private var m_iStartTimeNum:int;
      
      private var m_numTargetXPos:Number;
      
      private var m_numTargetYPos:Number;
      
      private var m_numXMoveSpeed:Number;
      
      private var m_numYMoveSpeed:Number;
      
      private var m_iGoTargetFieldTime:int;
      
      public var m_iGhostMouseMoveIntruderGlobalID:uint;
      
      protected var m_stPosFieldGrid:a_3491;
      
      public var a_1598:a_3491;
      
      public function VampireBossBatsMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(VampireBossBatsMoveIntruder) as VampireBossBatsMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return VampireBossBatsMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 120;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 90000;
         a_1467 = 0;
         a_1279 = 0;
         a_1272 = 0;
         a_1463 = true;
         this.m_iGhostMouseMoveIntruderGlobalID = 0;
         this.m_iGoTargetFieldTime = 0;
         gotoAndStop(1);
         a_1275 = 0;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         if(Boolean(m_stCurrentFieldGrid) && 2 == m_stCurrentFieldGrid.m_iFieldGridType)
         {
            m_stCurrentFieldGrid.m_iFieldGridType = 0;
         }
         if(Boolean(this.m_stPosFieldGrid) && 2 == this.m_stPosFieldGrid.m_iFieldGridType)
         {
            this.m_stPosFieldGrid.m_iFieldGridType = 0;
         }
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 300)
         {
         }
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         a_3419();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         m_stCurrentFieldGrid.a_3457(this);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         super.a_4210();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            this.m_iStartTimeNum = iCurrentTime;
            a_1460 = true;
            this.m_stPosFieldGrid = m_stCurrentFieldGrid;
            this.m_numTargetXPos = x;
            this.m_numTargetYPos = y;
            this.m_numXMoveSpeed = (this.a_1598.m_iXGridNo * a_3491.a_1080 - this.m_numTargetXPos) / 40;
            this.m_numYMoveSpeed = (this.a_1598.m_iYGridNo * a_3491.a_1081 - this.m_numTargetYPos) / 40;
            parent.addChild(this);
         }
         if(this.m_iGoTargetFieldTime > 0)
         {
            --this.m_iGoTargetFieldTime;
            if(this.m_iGoTargetFieldTime > 200)
            {
               x += this.m_numXMoveSpeed;
               y += this.m_numYMoveSpeed;
            }
            if(200 == this.m_iGoTargetFieldTime)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
               ChangeFieldGrid(this.a_1598);
               x = a_3491.a_1080 * m_stCurrentFieldGrid.m_iXGridNo + (a_3491.a_1080 - this.width) * 0.5 + 10;
               y = a_3491.a_1081 * m_stCurrentFieldGrid.m_iYGridNo + (a_3491.a_1081 - this.height) * 0.5;
            }
            if(a_1273 == a_1274)
            {
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            if(10 == this.m_iGoTargetFieldTime)
            {
               this.a_3502(m_stCurrentFieldGrid);
            }
            if(0 == this.m_iGoTargetFieldTime)
            {
               visible = false;
               this.a_3969(a_1339);
            }
         }
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
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
      
      public function GoTargetFieldGrid() : void
      {
         this.m_iGoTargetFieldTime = 240;
      }
   }
}

