package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Arrogant
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class WBSnakeShot extends a_4348
   {
      
      private var m_KillTime:int = -1;
      
      private var m_iTargetNoX:int = -1;
      
      public var m_iTargetNoY:int = -1;
      
      public var m_stBOSS:WBArrogantBossMoveInteuder;
      
      public var m_stBOSS2:WBArrogantBoss2MoveInteuder;
      
      public var m_stBOSS3:WBArrogantBoss3MoveInteuder;
      
      public function WBSnakeShot()
      {
         super();
         a_1573 = 1;
      }
      
      public static function a_4344() : WBSnakeShot
      {
         return PoolManager.getInstance().CheckOutOne(WBSnakeShot) as WBSnakeShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBSnakeShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         rotationY = numSpeed < 0 ? 0 : -180;
         a_1587 = 1;
         a_1275 = 0;
         gotoAndStop((a_1276[0] as FrameLabel).frame);
         a_3419();
         a_1588 = true;
         a_1279 = -10;
         m_iYDisplayCenterPos = 118;
         a_1447 = 0;
         this.m_KillTime = -1;
         this.m_iTargetNoX = -1;
         this.m_stBOSS = null;
         this.m_stBOSS2 = null;
         this.m_stBOSS3 = null;
         a_1576 = true;
         return true;
      }
      
      override protected function JudgePassFireTower(stFieldGrid:a_3491, numHotMultiplier:Number) : a_4348
      {
         a_1325 = numHotMultiplier;
         return null;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         if(a_1273 == a_1274)
         {
            m_bActive.Value = false;
            a_3940();
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         if(a_1583 != null)
         {
            if(this.m_KillTime == -1)
            {
               if(a_1283)
               {
                  iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
               }
               else
               {
                  iXGridNo = int(x / a_3491.a_1080);
               }
               stFieldGrid = a_1583.a_3438(iXGridNo,this.m_iTargetNoY);
               if(BattleDestroyUtil.CanKillDefense(stFieldGrid) == true)
               {
                  this.m_KillTime = iCurrentTime;
                  this.m_iTargetNoX = iXGridNo;
               }
            }
            else if(this.m_KillTime + 2 == iCurrentTime)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
               this.CreateRedApple(this.m_iTargetNoX,this.m_iTargetNoY);
               return;
            }
            if(a_1275 != 1)
            {
               x += m_numXSpeed;
            }
            if(x <= -40)
            {
               m_bActive.Value = false;
               a_3940();
            }
         }
      }
      
      private function CreateRedApple(iNoX:int, iNoY:int) : void
      {
         var grid1:a_3491 = null;
         var apple:WBRedAppleMoveIntruder = null;
         grid1 = a_1583.a_3438(iNoX,iNoY);
         if(grid1 == null)
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
         if(this.m_stBOSS != null)
         {
            apple.iGlobalMoveFighterID = this.m_stBOSS.GetGuardGlobalID2();
         }
         else if(this.m_stBOSS2 != null)
         {
            apple.iGlobalMoveFighterID = this.m_stBOSS2.GetGuardGlobalID2();
         }
         else if(this.m_stBOSS3 != null)
         {
            apple.iGlobalMoveFighterID = this.m_stBOSS3.GetGuardGlobalID2();
         }
         apple.m_stMoveIntruderTypeID = 8388608;
         apple.x = a_3491.a_1080 * (grid1.m_iXGridNo + 0.5);
         apple.y = a_3491.a_1081 * (grid1.m_iYGridNo + 0.5);
         a_1583.a_3459(apple,grid1);
         a_1583.AddToBattleView(apple,BattleLayerDefine.INTRUDER_LAND_TYPE,grid1);
      }
      
      override protected function ReboundHandler() : void
      {
         rotationY = rotationY == -180 ? 0 : -180;
      }
   }
}

