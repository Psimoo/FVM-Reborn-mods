package com.aurora.ui.maogoutd.resource.Intruder.newBoss.baby
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4135;
   import com.aurora.ui.maogoutd.resource.tools.BabyDiamondsWarningSign;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class BabyDiamondsMouseEarthHole extends a_4135
   {
      
      private static const FIELDGRID_TYPE_DIAMONDS:int = 1;
      
      private static const WAIT_TICK:int = 200;
      
      private static var m_iCnt:int = 0;
      
      private static var m_iMove:int = 0;
      
      protected var m_iTargetGridNoX:int;
      
      protected var m_iTargetGridNoY:int;
      
      protected var m_bIsTarget:Boolean;
      
      protected var m_iRestTickNum:int;
      
      protected var m_fTargetPosX:Number;
      
      protected var m_fTargetPosY:Number;
      
      protected var m_fMoveSpeedX:Number;
      
      protected var m_fMoveSpeedY:Number;
      
      protected var m_iMouseMoveIntruderGlobalID:uint;
      
      protected var m_stWarningSign:BabyDiamondsWarningSign;
      
      public function BabyDiamondsMouseEarthHole()
      {
         super();
         this.m_stWarningSign = BabyDiamondsWarningSign.a_3926();
      }
      
      public static function a_3926() : BabyDiamondsMouseEarthHole
      {
         return PoolManager.getInstance().CheckOutOne(BabyDiamondsMouseEarthHole) as BabyDiamondsMouseEarthHole;
      }
      
      public function setGridNo(stFieldGrid:a_3491) : void
      {
         this.x = a_3491.a_1080 * stFieldGrid.m_iXGridNo;
         this.y = a_3491.a_1081 * (1 + stFieldGrid.m_iYGridNo) - this.height;
         m_stCurrentFieldGrid = stFieldGrid;
         this.m_iTargetGridNoX = stFieldGrid.m_iXGridNo;
         this.m_iTargetGridNoY = stFieldGrid.m_iYGridNo;
      }
      
      override protected function getBindMovie() : Class
      {
         return BabyDiamondsMouseEarthHoleMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         a_1279 = 0;
         this.visible = false;
         this.RemoveWarningSign();
         return true;
      }
      
      private function RemoveWarningSign() : void
      {
         if(this.m_stWarningSign.parent)
         {
            this.m_stWarningSign.parent.removeChild(this.m_stWarningSign);
         }
      }
      
      private function AddWarningSign() : void
      {
         if(null == m_stCurrentFieldGrid)
         {
            return;
         }
         this.m_stWarningSign.a_1797();
         this.m_stWarningSign.visible = true;
         this.m_stWarningSign.x = this.m_iTargetGridNoX * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - this.m_stWarningSign.width);
         this.m_stWarningSign.y = this.m_iTargetGridNoY * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - this.m_stWarningSign.height);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stWarningSign,BattleLayerDefine.OBSTACL_TYPE,m_stCurrentFieldGrid);
      }
      
      override public function get height() : Number
      {
         return 157;
      }
      
      protected function InitData() : void
      {
         this.AddWarningSign();
         this.GotoAndStopFrame(0);
         this.m_bIsTarget = false;
         this.visible = true;
         this.m_fTargetPosX = this.x;
         this.m_fTargetPosY = this.y;
         this.y = -100 - this.height;
         var fDistance:Number = this.m_fTargetPosY - this.y;
         if(fDistance < 1)
         {
            fDistance = 1;
         }
         this.m_fMoveSpeedY = Math.min(30,this.m_fTargetPosY - this.y);
         this.m_iRestTickNum = fDistance / this.m_fMoveSpeedY;
         this.m_fMoveSpeedY = fDistance / this.m_iRestTickNum;
         this.m_fMoveSpeedX = -this.m_fMoveSpeedY * Math.tan(Math.PI * 20 / 180);
         this.x = this.m_fTargetPosX - this.m_fMoveSpeedX * this.m_iRestTickNum;
      }
      
      protected function DeleteFieldGridDefense(stFieldGrid:a_3491, isCleanTray:Boolean = false) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
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
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         if(isCleanTray && null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
      
      protected function GotoAndStopFrame(iFrame:uint, bIsNeed:Boolean = true) : void
      {
         if(!bIsNeed && a_1275 == iFrame)
         {
            return;
         }
         a_1275 = iFrame;
         gotoAndStop((a_1276[iFrame] as FrameLabel).frame);
         a_3419();
      }
      
      override public function a_3940() : Boolean
      {
         var stFieldGrid:a_3491 = null;
         stop();
         gotoAndStop(1);
         if(m_stCurrentFieldGrid)
         {
            stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetInitialFieldGrid(this.m_iTargetGridNoX,this.m_iTargetGridNoY);
            if(Boolean(stFieldGrid) && FIELDGRID_TYPE_DIAMONDS == stFieldGrid.m_iFieldGridType)
            {
               stFieldGrid.m_iFieldGridType = 0;
               stFieldGrid.m_stMouseEarthHole = null;
            }
            if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this);
            }
            m_stCurrentFieldGrid = null;
         }
         this.m_iTargetGridNoX = this.m_iTargetGridNoY = -111;
         this.RemoveWarningSign();
         this.m_iRestTickNum = 0;
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override public function play() : void
      {
         this.InitData();
         super.play();
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         var stFieldGrid:a_3491 = null;
         if(!this.visible)
         {
            return;
         }
         nextFrame();
         if(this.m_bIsTarget)
         {
            if(this.m_iRestTickNum > 0)
            {
               --this.m_iRestTickNum;
               if(null != a_1278)
               {
                  this.GotoAndStopFrame(2);
               }
            }
            else if(a_1273 == a_1274)
            {
               this.a_3940();
            }
         }
         else
         {
            this.m_stWarningSign.nextFrame();
            --this.m_iRestTickNum;
            this.x += this.m_fMoveSpeedX;
            this.y += this.m_fMoveSpeedY;
            if(0 == this.m_iRestTickNum)
            {
               ++m_iCnt;
               this.m_bIsTarget = true;
               this.x = this.m_fTargetPosX;
               this.y = this.m_fTargetPosY;
               stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_iTargetGridNoX,this.m_iTargetGridNoY);
               if(Boolean(stFieldGrid) && 0 == stFieldGrid.m_iFieldGridType)
               {
                  m_stCurrentFieldGrid = stFieldGrid;
                  stFieldGrid.m_iFieldGridType = FIELDGRID_TYPE_DIAMONDS;
                  this.DeleteFieldGridDefense(stFieldGrid);
                  this.RemoveWarningSign();
                  this.GotoAndStopFrame(0);
                  this.m_iRestTickNum = WAIT_TICK;
                  stFieldGrid.m_stCurrentBattbleFieldView.a_3466();
                  trace("m_iTargetGridNoX",this.m_iTargetGridNoX," m_iTargetGridNoY",this.m_iTargetGridNoY);
                  if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
                  {
                     ++m_iMove;
                     trace("*************m_iMove = " + m_iMove + "  m_iCnt = " + m_iCnt);
                     stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this,this.m_iTargetGridNoX,this.m_iTargetGridNoY);
                  }
                  this.m_iTargetGridNoX = stFieldGrid.m_iInitialXGridNo;
                  this.m_iTargetGridNoY = stFieldGrid.m_iInitialYGridNo;
               }
               else
               {
                  this.a_3940();
               }
            }
            else if(null != a_1278)
            {
               this.GotoAndStopFrame(0);
            }
         }
      }
   }
}

