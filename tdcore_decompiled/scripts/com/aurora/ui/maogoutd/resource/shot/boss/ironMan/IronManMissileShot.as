package com.aurora.ui.maogoutd.resource.shot.boss.ironMan
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.boss.BaseBossShot;
   
   public class IronManMissileShot extends BaseBossShot
   {
      
      private static var ms_arrShot:Array = new Array();
      
      private static const MOVE_SPEED:Number = 20;
      
      private static const RUN_STATE_TURN_UP:int = 0;
      
      private static const RUN_STATE_TURN_DOWN:int = 1;
      
      private static const RUN_STATE_LADER:int = 2;
      
      private static const RUN_STATE_BOMB:int = 3;
      
      private var m_iRunState:int;
      
      private var m_iRunTick:int;
      
      private var a_1544:int;
      
      private var a_1545:int;
      
      public function IronManMissileShot()
      {
         super();
         a_1279 = -10;
      }
      
      public static function a_4344() : IronManMissileShot
      {
         var stBaseShot:IronManMissileShot = null;
         stBaseShot = ms_arrShot.pop();
         if(null == stBaseShot)
         {
            stBaseShot = new IronManMissileShot();
         }
         stBaseShot.visible = true;
         BattleFieldView.a_1017.play();
         return stBaseShot;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_arrShot.indexOf(this))
         {
            ms_arrShot.push(this);
         }
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return IronManMissileShotMovie;
      }
      
      public function set TargetGrid(stFieldGrid:a_3491) : void
      {
         this.a_1544 = stFieldGrid.m_iXGridNo;
         this.a_1545 = stFieldGrid.m_iYGridNo;
      }
      
      override protected function InitData() : void
      {
         super.InitData();
         this.RunState = 0;
      }
      
      override protected function CheckShotState() : void
      {
         ClearFieldGrid(this.a_1544,this.a_1545);
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
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         nextFrame();
         if(a_1273 == a_1274 || null != a_1278)
         {
            GotoAndStopFrame(this.m_iRunState);
         }
         if(RUN_STATE_BOMB == this.m_iRunState && this.m_iRunTick == 6)
         {
            this.PlayBoomSkill();
         }
         x += m_numXSpeed;
         y += m_numYSpeed;
         if(this.m_iRunTick > 0)
         {
            --this.m_iRunTick;
         }
         else
         {
            ++this.RunState;
         }
      }
      
      private function get RunState() : int
      {
         return this.m_iRunState;
      }
      
      private function set RunState(iState:int) : void
      {
         var fDistance:Number = NaN;
         var fTargetPosX:Number = NaN;
         var fTargetPosY:Number = NaN;
         var fDistanceY:Number = NaN;
         this.m_iRunState = iState;
         m_numXSpeed = m_numYSpeed = 0;
         m_isShotHighSkySpace = true;
         switch(iState)
         {
            case RUN_STATE_TURN_UP:
               fDistance = x + 2 * a_3491.a_1081;
               this.m_iRunTick = int(fDistance / MOVE_SPEED);
               m_numYSpeed = -fDistance / this.m_iRunTick;
               break;
            case RUN_STATE_TURN_DOWN:
               fTargetPosX = this.a_1544 * a_3491.a_1081;
               fTargetPosY = a_3491.a_1081 * (1 + this.a_1545) - 105;
               if(fTargetPosY < 1)
               {
                  fTargetPosY = 1;
               }
               fDistanceY = Math.abs(fTargetPosY - this.y);
               m_numYSpeed = Math.min(MOVE_SPEED,fDistanceY);
               this.m_iRunTick = fDistanceY / m_numYSpeed;
               m_numYSpeed = fDistanceY / this.m_iRunTick;
               m_numXSpeed = -m_numYSpeed * Math.tan(Math.PI * 20 / 180);
               this.x = fTargetPosX - m_numXSpeed * this.m_iRunTick;
               break;
            case RUN_STATE_LADER:
               m_isShotHighSkySpace = false;
               this.m_iRunTick = 1;
               break;
            case RUN_STATE_BOMB:
               m_isShotHighSkySpace = false;
               this.m_iRunTick = 8;
               break;
            default:
               this.a_3940();
               return;
         }
         GotoAndStopFrame(this.m_iRunState);
      }
   }
}

