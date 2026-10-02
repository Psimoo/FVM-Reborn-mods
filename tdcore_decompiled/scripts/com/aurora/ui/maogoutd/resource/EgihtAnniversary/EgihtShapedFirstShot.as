package com.aurora.ui.maogoutd.resource.EgihtAnniversary
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class EgihtShapedFirstShot extends a_4348
   {
      
      private static const CONTINUE_TIME:int = 20 * 3;
      
      private static const ARR_DIR:Array = [[0,0]];
      
      private var m_iStartAttckTime:int;
      
      private var m_iLoopFrame:int;
      
      private var m_iDisappearFrame:int;
      
      private var m_iCurrentShowFrameLable:int = -1;
      
      private var m_stTargetGrid:a_3491 = new a_3491(null,0,0);
      
      private var m_iCount:int;
      
      public function EgihtShapedFirstShot()
      {
         super();
         a_1573 = 5;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 1;
         a_1587 = 3;
         this.m_iLoopFrame = 4;
         this.m_iDisappearFrame = 5;
         a_1279 = -27;
         m_iYDisplayCenterPos = -16;
      }
      
      public static function a_4344() : EgihtShapedFirstShot
      {
         BattleFieldView.a_1018.play();
         return PoolManager.getInstance().CheckOutOne(EgihtShapedFirstShot,EgihtShapedFirstShotMovie) as EgihtShapedFirstShot;
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
         CaculateParabolaSpeed();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
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
         if(a_1576)
         {
            if(a_1576)
            {
               UpdateParabolaPosition(iCurrentTime);
            }
            if(m_isHited)
            {
               this.ChangeToAttackState(iCurrentTime);
            }
         }
      }
      
      override protected function HitParabolaTest() : void
      {
         if(null != m_PTMoveIntruder && Boolean(m_PTMoveIntruder.m_stCurrentFieldGrid))
         {
            if(hitTestObject(m_PTMoveIntruder))
            {
               m_isHited = true;
               this.TargetGrid = m_PTFieldGrid;
               if(a_1276.length > 0)
               {
                  gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
               }
               a_4352(m_PTMoveIntruder);
               SputterHurt(m_PTMoveIntruder.m_stCurrentFieldGrid,m_PTMoveIntruder);
            }
         }
         else if(Math.abs(x - m_PTPosition.x) <= 0.5 && Boolean(m_PTFieldGrid))
         {
            m_isHited = true;
            this.TargetGrid = m_PTFieldGrid;
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
            SputterHurt(m_PTFieldGrid,null);
         }
      }
      
      private function ChangeToAttackState(iCurrentTime:int) : void
      {
         a_1583.AddToBattleView(this,BattleLayerDefine.EFFECTS_BASE_TYPE,this.m_stTargetGrid);
         this.m_iStartAttckTime = iCurrentTime;
         this.m_iCount = 0;
         this.ChangeToFrameLable(a_1587);
         this.x = (this.TargetGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
         this.y = (this.TargetGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
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
         return true;
      }
   }
}

