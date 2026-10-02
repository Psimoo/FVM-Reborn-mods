package com.aurora.ui.maogoutd.resource.shot.boss.mermaidMary
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.boss.BaseBossShot;
   
   public class MermaidMaryDartShot extends BaseBossShot
   {
      
      private static const MOVE_SPEED:Number = 20;
      
      private static const RUN_STATE_TURN_UP:int = -1;
      
      private static const RUN_STATE_TURN_DOWN:int = 0;
      
      private static const RUN_STATE_BOMB:int = 2;
      
      private static var m_vShotInst:Vector.<MermaidMaryDartShot> = new Vector.<MermaidMaryDartShot>();
      
      private var m_iRunState:int;
      
      private var m_iRunTick:int;
      
      private var m_bInjured:Boolean;
      
      private var a_1544:int;
      
      private var a_1545:int;
      
      private var a_1334:a_3491;
      
      public function MermaidMaryDartShot()
      {
         super();
      }
      
      public static function a_4344() : MermaidMaryDartShot
      {
         var stShot:MermaidMaryDartShot = null;
         stShot = m_vShotInst.pop();
         if(stShot == null)
         {
            stShot = new MermaidMaryDartShot();
         }
         stShot.visible = true;
         BattleFieldView.a_1017.play();
         return stShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return MermaidMaryDartShotMovie;
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
         this.RunState = RUN_STATE_TURN_UP;
      }
      
      public function set IsInjured(b:Boolean) : void
      {
         this.m_bInjured = b;
      }
      
      public function set TargetGrid(stFieldGrid:a_3491) : void
      {
         this.a_1334 = stFieldGrid;
         this.a_1544 = stFieldGrid.m_iXGridNo;
         this.a_1545 = stFieldGrid.m_iYGridNo;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         if(this.visible)
         {
            nextFrame();
            if(a_1273 == a_1274 || null != a_1278)
            {
               GotoAndStopFrame(this.RunState);
            }
            x += m_numXSpeed;
            y += m_numYSpeed;
         }
         if(RUN_STATE_BOMB == this.RunState && this.m_iRunTick == 6)
         {
            this.PlayBoomSkill();
         }
         if(this.m_iRunTick > 0)
         {
            --this.m_iRunTick;
         }
         else if(this.RunState == RUN_STATE_TURN_UP)
         {
            if(this.m_bInjured)
            {
               this.RunState = RUN_STATE_TURN_DOWN + 1;
            }
            else
            {
               this.RunState = RUN_STATE_TURN_DOWN;
            }
         }
         else
         {
            this.RunState += 2;
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
         var fDistanceY:Number = NaN;
         this.m_iRunState = iState;
         m_numXSpeed = m_numYSpeed = 0;
         m_isShotHighSkySpace = true;
         switch(iState)
         {
            case RUN_STATE_TURN_UP:
               this.m_iRunTick = 20;
               this.visible = false;
               break;
            case RUN_STATE_TURN_DOWN:
            case RUN_STATE_TURN_DOWN + 1:
               this.visible = true;
               fTargetPosX = this.a_1544 * a_3491.a_1080 + a_3491.a_1080 * 0.5;
               fTargetPosY = this.a_1545 * a_3491.a_1081 + a_3491.a_1081 * 0.5 - 225;
               this.x = fTargetPosX;
               this.y = 0 - 150;
               fDistanceY = Math.abs(fTargetPosY - this.y);
               m_numYSpeed = Math.min(MOVE_SPEED,fDistanceY);
               this.m_iRunTick = fDistanceY / m_numYSpeed;
               m_numYSpeed = fDistanceY / this.m_iRunTick;
               m_numXSpeed = 0;
               break;
            case RUN_STATE_BOMB:
            case RUN_STATE_BOMB + 1:
               this.visible = true;
               m_isShotHighSkySpace = false;
               this.m_iRunTick = 11;
               break;
            default:
               this.a_3940();
               return;
         }
         if(this.visible)
         {
            GotoAndStopFrame(this.RunState);
         }
      }
   }
}

