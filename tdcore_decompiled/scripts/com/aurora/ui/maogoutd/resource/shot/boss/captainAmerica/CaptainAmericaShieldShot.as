package com.aurora.ui.maogoutd.resource.shot.boss.captainAmerica
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.boss.BaseBossShot;
   import flash.display.BlendMode;
   
   public class CaptainAmericaShieldShot extends BaseBossShot
   {
      
      private static var ms_arrShot:Array = new Array();
      
      private static const SHIELD_MOVE_SPEED:int = 5;
      
      private static const RUN_STATE_LEFT:int = 0;
      
      private static const RUN_STATE_TURN_UP:int = 1;
      
      private static const RUN_STATE_UP:int = 2;
      
      private static const RUN_STATE_TURN_RIGHT:int = 3;
      
      private static const RUN_STATE_RIGHT:int = 4;
      
      private var m_iRunState:int;
      
      private var m_iRunTick:int;
      
      public function CaptainAmericaShieldShot()
      {
         this.blendMode = BlendMode.ADD;
         super();
         fYShift = -80;
         a_1279 = -80;
      }
      
      public static function a_4344() : CaptainAmericaShieldShot
      {
         var stBaseShot:CaptainAmericaShieldShot = null;
         stBaseShot = ms_arrShot.pop();
         if(null == stBaseShot)
         {
            stBaseShot = new CaptainAmericaShieldShot();
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
         return CaptainAmericaShieldShotMovie;
      }
      
      override protected function InitData() : void
      {
         super.InitData();
         this.RunState = 0;
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
            GotoAndStopFrame(0);
         }
         CheckShotState();
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
         var iMaxXGridNum:int = 0;
         var iMaxYGridNum:int = 0;
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         this.m_iRunState = iState;
         iMaxXGridNum = BattleFieldView.a_1011;
         iMaxYGridNum = BattleFieldView.a_1012;
         m_numXSpeed = m_numYSpeed = 0;
         switch(iState)
         {
            case RUN_STATE_LEFT:
            case RUN_STATE_RIGHT:
               m_numXSpeed = a_3491.a_1080 / SHIELD_MOVE_SPEED;
               this.m_iRunTick = (iMaxXGridNum - 3) * SHIELD_MOVE_SPEED - 3;
               if(RUN_STATE_LEFT == iState)
               {
                  m_numXSpeed = -m_numXSpeed;
               }
               break;
            case RUN_STATE_TURN_UP:
            case RUN_STATE_TURN_RIGHT:
               this.m_iRunTick = 5;
               break;
            case RUN_STATE_UP:
               m_numYSpeed = -a_3491.a_1081 / SHIELD_MOVE_SPEED;
               this.m_iRunTick = (iMaxYGridNum - 1) * SHIELD_MOVE_SPEED;
               break;
            default:
               iXGridNo = int(x / a_3491.a_1080);
               iYGridNo = int((y - fYShift) / a_3491.a_1081);
               ClearFieldGrid(iXGridNo,iYGridNo);
               this.a_3940();
         }
      }
   }
}

