package com.aurora.ui.maogoutd.resource.shot.boss.mechanicalShark.firstState
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.boss.BaseBossShot;
   import flash.display.FrameLabel;
   
   public class MechanicalSharkFirstStateFireShot extends BaseBossShot
   {
      
      private static const MOVE_SPEED:Number = 20;
      
      private static const RUN_STATE_FLY:int = 0;
      
      private static const RUN_STATE_BOMB:int = 1;
      
      private static var m_vShotInst:Vector.<MechanicalSharkFirstStateFireShot> = new Vector.<MechanicalSharkFirstStateFireShot>();
      
      private var m_iRunState:int;
      
      private var m_iRunTick:int;
      
      private var a_1544:int;
      
      private var a_1545:int;
      
      private var a_1334:a_3491;
      
      private var m_iCurFrameLabelIndex:int;
      
      public function MechanicalSharkFirstStateFireShot()
      {
         super();
      }
      
      public static function a_4344() : MechanicalSharkFirstStateFireShot
      {
         var stShot:MechanicalSharkFirstStateFireShot = m_vShotInst.pop();
         if(stShot == null)
         {
            stShot = new MechanicalSharkFirstStateFireShot();
         }
         BattleFieldView.a_1017.play();
         return stShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return MechanicalSharkFirstStateFireShotMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == m_vShotInst.indexOf(this))
         {
            m_vShotInst.push(this);
         }
         return true;
      }
      
      override protected function InitData() : void
      {
         super.InitData();
         a_1279 = -width * 0.5;
         this.RunState = RUN_STATE_FLY;
      }
      
      public function set TargetGrid(stFieldGrid:a_3491) : void
      {
         this.a_1334 = stFieldGrid;
         this.a_1544 = stFieldGrid.m_iXGridNo;
         this.a_1545 = stFieldGrid.m_iYGridNo;
      }
      
      override protected function GotoAndStopFrame(iFrame:uint, bIsNeed:Boolean = true) : void
      {
         if(!bIsNeed && this.m_iCurFrameLabelIndex == iFrame)
         {
            return;
         }
         this.m_iCurFrameLabelIndex = iFrame;
         var iFrameLabelStartIndex:int = (a_1276[iFrame] as FrameLabel).frame;
         gotoAndStop(iFrameLabelStartIndex);
         a_3419();
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         if(this.m_iRunTick > 0)
         {
            --this.m_iRunTick;
            if(a_1273 == a_1274 || null != a_1278 && (a_1276[this.m_iCurFrameLabelIndex] as FrameLabel).frame != a_1273)
            {
               this.GotoAndStopFrame(this.RunState);
            }
            else
            {
               nextFrame();
            }
         }
         else
         {
            ++this.RunState;
         }
         if(RUN_STATE_FLY == this.RunState)
         {
            x += m_numXSpeed;
            y += m_numYSpeed;
         }
         else if(RUN_STATE_BOMB == this.RunState && this.m_iRunTick == 11 - 4)
         {
            this.PlayBoomSkill();
         }
      }
      
      private function PlayBoomSkill() : void
      {
         var iYGrid:int = 0;
         var stFieldGrid:a_3491 = null;
         var iXStart:int = Math.max(this.a_1544 - 1,0);
         var iXEnd:int = Math.min(this.a_1544 + 1,BattleFieldView.a_1011 - 1);
         var iYStart:int = Math.max(this.a_1545 - 1,0);
         var iYEnd:int = Math.min(this.a_1545 + 1,BattleFieldView.a_1012 - 1);
         for(var iXGrid:int = iXStart; iXGrid <= iXEnd; iXGrid++)
         {
            for(iYGrid = iYStart; iYGrid <= iYEnd; iYGrid++)
            {
               stFieldGrid = a_1583.a_3438(iXGrid,iYGrid);
               a_3502(stFieldGrid);
            }
         }
      }
      
      private function get RunState() : int
      {
         return this.m_iRunState;
      }
      
      private function set RunState(iState:int) : void
      {
         var fTargetPosX:Number = NaN;
         var fTargetPosY:Number = NaN;
         var fDistanceX:Number = NaN;
         var fDistanceY:Number = NaN;
         var fDistance:Number = NaN;
         this.m_iRunState = iState;
         m_numXSpeed = m_numYSpeed = 0;
         m_isShotHighSkySpace = true;
         switch(iState)
         {
            case RUN_STATE_FLY:
               fTargetPosX = this.a_1544 * a_3491.a_1080 + a_3491.a_1080 * 0.5 + 5;
               fTargetPosY = this.a_1545 * a_3491.a_1081 + a_3491.a_1081 * 0.5 - 35;
               fDistanceX = fTargetPosX - this.x;
               fDistanceY = fTargetPosY - this.y;
               fDistance = Math.sqrt(fDistanceX * fDistanceX + fDistanceY * fDistanceY);
               this.m_iRunTick = fDistance / MOVE_SPEED;
               if(fDistance < MOVE_SPEED)
               {
                  this.m_iRunTick = 1;
               }
               m_numXSpeed = fDistanceX / this.m_iRunTick;
               m_numYSpeed = fDistanceY / this.m_iRunTick;
               break;
            case RUN_STATE_BOMB:
               m_isShotHighSkySpace = false;
               this.m_iRunTick = 11 - 1;
               break;
            default:
               this.a_3940();
               return;
         }
         this.GotoAndStopFrame(this.RunState);
      }
   }
}

