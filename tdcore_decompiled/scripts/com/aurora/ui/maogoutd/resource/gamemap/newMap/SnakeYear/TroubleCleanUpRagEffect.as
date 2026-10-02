package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class TroubleCleanUpRagEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_stMap:TroubleCleanUpBaseGameMap;
      
      private var m_stGrid:a_3491;
      
      private var m_stArrow:TroubleCleanUpArrowEffect;
      
      private var m_iNowNoX:int = 0;
      
      private var m_iNowNoY:int = 0;
      
      private var m_stBattleView:BattleFieldView;
      
      private var m_iDir:int = 0;
      
      private var m_iXSpeed:Number = 0;
      
      private var m_iYSpeed:Number = 0;
      
      private var m_iMoveCount:int = 0;
      
      private var m_iOldGridState:int = 0;
      
      private var m_iState:int = 0;
      
      private var m_iCDTick:int = 0;
      
      private var m_iMAXCDTick:int = 80;
      
      private var m_iMAXMoveTick:int = 10;
      
      private var m_iTurnDirTick:int = 80;
      
      private var m_iRunTick:int = 0;
      
      private var m_bHurtBOSS:Boolean = false;
      
      public function TroubleCleanUpRagEffect()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : TroubleCleanUpRagEffect
      {
         return PoolManager.getInstance().CheckOutOne(TroubleCleanUpRagEffect) as TroubleCleanUpRagEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return TroubleCleanUpRagEffectMovie;
      }
      
      public function InitData(map:TroubleCleanUpBaseGameMap, fieldGrid:a_3491) : void
      {
         this.m_stMap = map;
         this.m_stGrid = fieldGrid;
         this.m_stBattleView = fieldGrid.m_stCurrentBattbleFieldView;
         this.m_stBattleView.AddToBattleView(this,BattleLayerDefine.EFFECTS_BASE_TYPE,fieldGrid);
         this.x = a_3491.a_1080 * fieldGrid.m_iXGridNo;
         this.y = a_3491.a_1081 * fieldGrid.m_iYGridNo;
         this.m_iNowNoX = fieldGrid.m_iXGridNo;
         this.m_iNowNoY = fieldGrid.m_iYGridNo;
         this.m_stArrow = TroubleCleanUpArrowEffect.a_3926();
         this.m_stArrow.a_1797(false);
         fieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stArrow,BattleLayerDefine.EFFECTS_TOP_TYPE);
         this.m_stArrow.x = this.x;
         this.m_stArrow.y = this.y;
         this.m_iState = 0;
         this.m_iRunTick = this.m_iTurnDirTick;
         this.m_iXSpeed = 0;
         this.m_iYSpeed = 0;
         this.SetDirection(0);
         this.UpdateArrow();
         this.m_bHurtBOSS = false;
         this.m_iOldGridState = fieldGrid.m_iFieldGridType;
         fieldGrid.m_iFieldGridType = 0;
      }
      
      public function RemoveSelf() : void
      {
         this.SetAnimation(6);
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         a_1279 = 0;
         this.visible = true;
         gotoAndStop(1);
         this.play();
         this.SetAnimation(0);
         return true;
      }
      
      public function TickUpdate() : void
      {
         var grid:a_3491 = null;
         var moveCount:int = 0;
         var m_iTarX:int = 0;
         var m_iTarY:int = 0;
         var grid2:a_3491 = null;
         grid = this.m_stBattleView.a_3438(this.m_iNowNoX,this.m_iNowNoY);
         if(a_1273 == 33)
         {
            this.a_3502(grid);
         }
         if(this.m_iState == 0)
         {
            --this.m_iRunTick;
            if(this.m_iRunTick <= 0)
            {
               this.m_iRunTick = this.m_iTurnDirTick;
               ++this.m_iDir;
               this.SetDirection(this.m_iDir);
               this.m_iDir %= 4;
               this.UpdateArrow();
            }
            if(this.CheckCard())
            {
               moveCount = this.GetMoveCount(grid);
               m_iTarX = 0;
               m_iTarY = 0;
               if(this.m_iDir == 0)
               {
                  m_iTarX = this.m_iNowNoX + moveCount;
                  m_iTarY = this.m_iNowNoY;
                  this.m_iXSpeed = 6;
                  this.m_iYSpeed = 0;
               }
               else if(this.m_iDir == 1)
               {
                  m_iTarX = this.m_iNowNoX;
                  m_iTarY = this.m_iNowNoY + moveCount;
                  this.m_iXSpeed = 0;
                  this.m_iYSpeed = 6.4;
               }
               else if(this.m_iDir == 2)
               {
                  m_iTarX = this.m_iNowNoX - moveCount;
                  m_iTarY = this.m_iNowNoY;
                  this.m_iXSpeed = -6;
                  this.m_iYSpeed = 0;
               }
               else
               {
                  m_iTarX = this.m_iNowNoX;
                  m_iTarY = this.m_iNowNoY - moveCount;
                  this.m_iXSpeed = 0;
                  this.m_iYSpeed = -6.4;
               }
               this.m_iState = 1;
               this.m_bHurtBOSS = false;
               this.m_iMoveCount = moveCount;
               this.m_iRunTick = this.m_iMAXMoveTick + 16;
               this.SetAnimationOnce2Loop(3,4);
               grid.m_iFieldGridType = this.m_iOldGridState;
            }
         }
         else if(this.m_iState == 1)
         {
            --this.m_iRunTick;
            if(this.m_iRunTick <= this.m_iMAXMoveTick)
            {
               this.x += this.m_iXSpeed;
               this.y += this.m_iYSpeed;
               this.ClearMouse(this.m_stBattleView.a_3438(this.m_iNowNoX - 1,this.m_iNowNoY));
               this.ClearMouse(grid);
               this.ClearMouse(this.m_stBattleView.a_3438(this.m_iNowNoX + 1,this.m_iNowNoY));
               this.a_3502(grid);
            }
            if(this.m_iRunTick <= 0)
            {
               if(this.m_iDir == 0)
               {
                  this.m_iNowNoX += 1;
               }
               else if(this.m_iDir == 1)
               {
                  this.m_iNowNoY += 1;
               }
               else if(this.m_iDir == 2)
               {
                  --this.m_iNowNoX;
               }
               else
               {
                  --this.m_iNowNoY;
               }
               --this.m_iMoveCount;
               grid2 = this.m_stBattleView.a_3438(this.m_iNowNoX,this.m_iNowNoY);
               this.ClearMouse(this.m_stBattleView.a_3438(this.m_iNowNoX - 1,this.m_iNowNoY));
               this.ClearMouse(grid2);
               this.ClearMouse(this.m_stBattleView.a_3438(this.m_iNowNoX + 1,this.m_iNowNoY));
               this.a_3502(grid2);
               this.m_stMap.ReduceDirty(this.m_iNowNoX,this.m_iNowNoY);
               if(this.m_iMoveCount == 0 || this.CheckHasBarrier(this.m_iDir))
               {
                  this.m_iOldGridState = grid2.m_iFieldGridType;
                  grid2.m_iFieldGridType = 0;
                  this.x = a_3491.a_1080 * this.m_iNowNoX;
                  this.y = a_3491.a_1081 * this.m_iNowNoY;
                  this.m_stArrow.x = this.x;
                  this.m_stArrow.y = this.y;
                  if(this.m_iMAXCDTick == 0)
                  {
                     this.m_bHurtBOSS = false;
                     this.SetAnimationOnce2Loop(5,0);
                     this.m_iState = 0;
                     this.m_iRunTick = this.m_iTurnDirTick;
                     this.SetDirection(0);
                     this.UpdateArrow();
                  }
                  else
                  {
                     this.m_bHurtBOSS = false;
                     this.m_iState = 2;
                     this.SetAnimationOnce2Loop(5,1);
                     this.m_iRunTick = this.m_iMAXCDTick + 10;
                     grid2.m_iFieldGridType = 8;
                  }
               }
               else
               {
                  this.m_iRunTick = this.m_iMAXMoveTick;
               }
            }
         }
         else
         {
            --this.m_iRunTick;
            if(this.m_iRunTick == 30)
            {
               this.SetAnimationOnce2Loop(2,0);
            }
            if(this.m_iRunTick <= 0)
            {
               this.m_bHurtBOSS = false;
               this.m_iState = 0;
               this.m_iRunTick = this.m_iTurnDirTick;
               this.SetDirection(0);
               this.UpdateArrow();
               grid.m_iFieldGridType = 0;
            }
         }
         this.m_stArrow.visible = this.m_iState == 0;
      }
      
      public function CheckCard() : Boolean
      {
         var grid:a_3491 = this.m_stBattleView.a_3438(this.m_iNowNoX,this.m_iNowNoY);
         if(null != grid.m_stProtector)
         {
            return true;
         }
         if(null != grid.m_stAttackFighter)
         {
            return true;
         }
         if(null != grid.m_stFlowerDefense)
         {
            return true;
         }
         if(null != grid.m_stBaseAuxiliaryFighter)
         {
            return true;
         }
         if(null != grid.m_stTrayDefense)
         {
            return true;
         }
         return false;
      }
      
      private function SetDirection(dir:int) : void
      {
         if(!this.CheckHasBarrier(dir))
         {
            this.m_iDir = dir;
            return;
         }
         if(!this.CheckHasBarrier(dir + 1))
         {
            this.m_iDir = dir + 1;
            return;
         }
         if(!this.CheckHasBarrier(dir + 2))
         {
            this.m_iDir = dir + 2;
            return;
         }
         if(!this.CheckHasBarrier(dir + 3))
         {
            this.m_iDir = dir + 3;
            return;
         }
      }
      
      public function CheckHasBarrier(dir:int) : Boolean
      {
         dir %= 4;
         if(dir == 0)
         {
            return this.m_stMap.CheckHasBarrier(this.m_iNowNoX + 1,this.m_iNowNoY);
         }
         if(dir == 1)
         {
            return this.m_stMap.CheckHasBarrier(this.m_iNowNoX,this.m_iNowNoY + 1);
         }
         if(dir == 2)
         {
            return this.m_stMap.CheckHasBarrier(this.m_iNowNoX - 1,this.m_iNowNoY);
         }
         return this.m_stMap.CheckHasBarrier(this.m_iNowNoX,this.m_iNowNoY - 1);
      }
      
      private function UpdateArrow() : void
      {
         if(this.m_iDir == 0)
         {
            this.m_stArrow.GoRight();
         }
         else if(this.m_iDir == 1)
         {
            this.m_stArrow.GoDown();
         }
         else if(this.m_iDir == 2)
         {
            this.m_stArrow.GoLeft();
         }
         else
         {
            this.m_stArrow.GoUp();
         }
      }
      
      private function RealeaseArrow() : void
      {
         if(this.m_stArrow != null)
         {
            this.m_stArrow.a_3940();
            this.m_stArrow = null;
         }
      }
      
      public function a_3940() : Boolean
      {
         this.m_stGrid.m_iFieldGridType = this.m_iOldGridState;
         this.RealeaseArrow();
         gotoAndStop(1);
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      public function play() : void
      {
         this.m_stTiemr.start();
      }
      
      public function stop() : void
      {
         this.m_stTiemr.stop();
         this.a_3940();
      }
      
      private function a_4003(a_4730:Event) : void
      {
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
      
      public function SetAnimation(frame:int) : void
      {
         if(a_1275 != frame)
         {
            a_1275 = frame;
            gotoAndStop((a_1276[frame] as FrameLabel).frame);
         }
      }
      
      public function SetAnimationOnce2Loop(once:int, loop:int) : void
      {
         a_1275 = loop;
         gotoAndStop((a_1276[once] as FrameLabel).frame);
      }
      
      protected function ClearMouse(m_stTargetGrid:a_3491) : void
      {
         if(m_stTargetGrid == null)
         {
            return;
         }
         var arrMoveIntruder:Array = m_stTargetGrid.a_1511.slice();
         for(var j:int = 0; j < arrMoveIntruder.length; j++)
         {
            if(arrMoveIntruder[j].m_stMoveIntruderTypeID != 8389127 && arrMoveIntruder[j].m_stMoveIntruderTypeID != 8389129 && arrMoveIntruder[j].m_stMoveIntruderTypeID != 8389128 && arrMoveIntruder[j].iSpaceState == 0)
            {
               if(!this.IsBOSS(arrMoveIntruder[j]))
               {
                  arrMoveIntruder[j].a_3432();
               }
               else if(!this.m_bHurtBOSS)
               {
                  arrMoveIntruder[j].a_3969(20000);
                  this.m_bHurtBOSS = true;
               }
            }
         }
      }
      
      public function IsBOSS(stMoveIntruder:a_4206) : Boolean
      {
         return stMoveIntruder.IsBossIntruder;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption(false,true,true,2);
      }
      
      protected function GetMoveCount(stFieldGrid:a_3491) : int
      {
         var moveCount:int = 0;
         if(null != stFieldGrid.m_stProtector)
         {
            moveCount = Math.ceil(stFieldGrid.m_stProtector.a_1094 / 2);
         }
         if(null != stFieldGrid.m_stAttackFighter)
         {
            if(stFieldGrid.m_stAttackFighter is a_3924)
            {
               return 1;
            }
            moveCount = Math.ceil(stFieldGrid.m_stAttackFighter.a_1094 / 2);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            moveCount = Math.ceil(stFieldGrid.m_stBoomDefense.a_1094 / 2);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            moveCount = Math.ceil(stFieldGrid.m_stFlowerDefense.a_1094 / 2);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            moveCount = Math.ceil(stFieldGrid.m_stBaseAuxiliaryFighter.a_1094 / 2);
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            moveCount = Math.ceil(stFieldGrid.m_stTrayDefense.a_1094 / 2);
         }
         return Math.max(moveCount,1);
      }
   }
}

