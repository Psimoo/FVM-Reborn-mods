package com.aurora.ui.maogoutd.resource.EgihtAnniversary
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class EgihtShapedShot extends a_4348
   {
      
      private static const CONTINUE_TIME:int = 20 * 3;
      
      private static const ARR_DIR:Array = [[0,0]];
      
      private var m_iStartAttckTime:int;
      
      private var m_iLoopFrame:int;
      
      private var m_iDisappearFrame:int;
      
      private var m_iCurrentShowFrameLable:int = -1;
      
      private var m_stTargetGrid:a_3491 = new a_3491(null,0,0);
      
      private var m_iCount:int;
      
      public function EgihtShapedShot()
      {
         super();
         a_1573 = 5;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 1;
         a_1587 = 2;
         this.m_iLoopFrame = 3;
         this.m_iDisappearFrame = 4;
      }
      
      public static function a_4344() : EgihtShapedShot
      {
         BattleFieldView.a_1018.play();
         return PoolManager.getInstance().CheckOutOne(EgihtShapedShot,EgihtShapedShotMovie) as EgihtShapedShot;
      }
      
      public function set TargetGrid(stFieldGrid:a_3491) : void
      {
         if(stFieldGrid == null)
         {
            return;
         }
         this.m_stTargetGrid.m_iXGridNo = stFieldGrid.m_iXGridNo;
         this.m_stTargetGrid.m_iYGridNo = stFieldGrid.m_iYGridNo;
      }
      
      public function get TargetGrid() : a_3491
      {
         return a_1583.a_3438(this.m_stTargetGrid.m_iXGridNo,this.m_stTargetGrid.m_iYGridNo);
      }
      
      override protected function a_4349() : Boolean
      {
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var stMoveIntrude:a_4206 = null;
         var arrMoveIntruder:Array = null;
         var iIntruderIndex:int = 0;
         var numDistance:Number = NaN;
         a_1588 = true;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         for(var i:int = iXGridNo; i < BattleFieldView.a_1011; i++)
         {
            stFieldGrid = a_1583.a_3438(i,m_iYGridNo);
            if(Boolean(stFieldGrid) && stFieldGrid.a_1511.length > 0)
            {
               arrMoveIntruder = stFieldGrid.a_1511;
               if(stFieldGrid.m_stCurrentBattbleFieldView.iIntruderMoveDirection > 0)
               {
                  arrMoveIntruder.sortOn("x",Array.DESCENDING | Array.NUMERIC);
               }
               else
               {
                  arrMoveIntruder.sortOn("x",Array.NUMERIC);
               }
               for(iIntruderIndex = 0; iIntruderIndex < stFieldGrid.a_1511.length; iIntruderIndex++)
               {
                  if((arrMoveIntruder[iIntruderIndex] as a_4206).iSpaceState == 0)
                  {
                     stMoveIntrude = arrMoveIntruder[0];
                     break;
                  }
               }
            }
            if(stMoveIntrude)
            {
               break;
            }
         }
         if(stMoveIntrude)
         {
            numDistance = Math.abs(stMoveIntrude.x - x) - 0.2 * stMoveIntrude.width;
            a_1581 = Math.abs(int(numDistance / m_numXSpeed));
            if(numDistance < 2 * a_3491.a_1080)
            {
               if(a_1581 < 4)
               {
                  a_1581 = 4;
               }
               m_numYSpeed = a_3491.a_1081 * (m_iYGridNo + 0.6) / a_1581;
            }
            else
            {
               m_numYSpeed = 3 * a_3491.a_1081 / a_1581;
            }
            this.TargetGrid = stFieldGrid;
         }
         else
         {
            this.TargetGrid = null;
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var numYMove:Number = NaN;
         if(m_isHited)
         {
            nextFrame();
            if(iCurrentTime - this.m_iStartAttckTime > CONTINUE_TIME)
            {
               if(a_1273 == a_1274)
               {
                  this.a_3940();
               }
            }
            else
            {
               if((iCurrentTime - this.m_iStartAttckTime) % 20 == 0)
               {
                  this.a_4360();
               }
               if(a_1278 != null && (this.m_iCurrentShowFrameLable == this.m_iLoopFrame || this.m_iCurrentShowFrameLable == a_1587))
               {
                  this.ChangeToFrameLable(this.m_iLoopFrame);
               }
            }
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         x += m_numXSpeed;
         if(a_1576)
         {
            numYMove = 2 * m_numYSpeed * (iCurrentTime - a_1447) / a_1581 - m_numYSpeed;
            y += numYMove > 30 ? 30 : numYMove;
         }
         this.CheckIsTarget(iCurrentTime);
      }
      
      private function CheckIsTarget(iCurrentTime:int) : void
      {
         if(x < 0 || x >= BattleFieldView.a_1013 || y > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            trace("EgihtShapedShot x < 0 || x >= BattleFieldView.ms_iBattleFieldWidth, HitTest failed. x:" + x + ", BattleFieldView.ms_iBattleFieldWidth:" + BattleFieldView.a_1013);
            this.a_3940();
            return;
         }
         if(iCurrentTime - a_1447 >= a_1581)
         {
            this.ChangeToAttackState(iCurrentTime);
         }
      }
      
      private function ChangeToAttackState(iCurrentTime:int) : void
      {
         m_isHited = true;
         a_1583.AddToBattleView(this,BattleLayerDefine.EFFECT_LAYER_TRAY_BOTTOM_TYPE,this.m_stTargetGrid);
         a_1588 = false;
         this.m_iStartAttckTime = iCurrentTime;
         this.m_iCount = 0;
         this.ChangeToFrameLable(a_1587);
         this.x = this.TargetGrid.m_iXGridNo * a_3491.a_1080 + 15;
         this.y = this.TargetGrid.m_iYGridNo * a_3491.a_1081 + 20;
      }
      
      private function ChangeToFrameLable(iFrameLable:int) : void
      {
         this.m_iCurrentShowFrameLable = iFrameLable;
         gotoAndStop((a_1276[this.m_iCurrentShowFrameLable] as FrameLabel).frame);
      }
      
      private function a_4360() : void
      {
         var stFieldGrid:a_3491 = null;
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var arrMouveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         ++this.m_iCount;
         var iLen:int = int(ARR_DIR.length);
         for(var i:int = 0; i < iLen; i++)
         {
            iXGridNo = this.TargetGrid.m_iXGridNo + ARR_DIR[i][0];
            iYGridNo = this.TargetGrid.m_iYGridNo + ARR_DIR[i][1];
            stFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
            if(null != stFieldGrid)
            {
               arrMouveIntruder = stFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMouveIntruder)
               {
                  if(null != stMoveIntruder && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState) && !stMoveIntruder.isCannotSeeByFighter)
                  {
                     stMoveIntruder.a_4209(int(a_1579 * 0.5));
                     if(stMoveIntruder.iLifeValue <= 0 && Boolean(stMoveIntruder.m_stCurrentFieldGrid))
                     {
                        stMoveIntruder.a_4210();
                     }
                  }
               }
            }
         }
      }
      
      override protected function a_3940() : Boolean
      {
         trace("************Friedposshot m_iCount = " + this.m_iCount);
         super.a_3940();
         m_isHited = false;
         a_1588 = true;
         return true;
      }
   }
}

