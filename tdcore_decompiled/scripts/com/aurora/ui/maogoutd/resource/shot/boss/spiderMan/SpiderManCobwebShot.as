package com.aurora.ui.maogoutd.resource.shot.boss.spiderMan
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.shot.boss.BaseBossShot;
   
   public class SpiderManCobwebShot extends BaseBossShot
   {
      
      private static var ms_arrShot:Array = new Array();
      
      private static const MOVE_SPEED:Number = 20;
      
      private static const RUN_STATE_MOVE:int = 0;
      
      private static const RUN_STATE_ATTACK:int = 1;
      
      private static const RUN_STATE_CONTINUE:int = 2;
      
      private static const RUN_STATE_HIDE:int = 3;
      
      private var m_iRunState:int;
      
      private var m_iRunTick:int;
      
      public function SpiderManCobwebShot()
      {
         super();
         a_1279 = -0.5 * this.width;
      }
      
      public static function a_4344() : SpiderManCobwebShot
      {
         var stBaseShot:SpiderManCobwebShot = null;
         stBaseShot = ms_arrShot.pop();
         if(null == stBaseShot)
         {
            stBaseShot = new SpiderManCobwebShot();
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
         return SpiderManCobwebShotMovie;
      }
      
      override public function get width() : Number
      {
         return 146;
      }
      
      override protected function InitData() : void
      {
         super.InitData();
         this.RunState = 0;
      }
      
      private function get RunState() : int
      {
         return this.m_iRunState;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         nextFrame();
         if(null != a_1278)
         {
            GotoAndStopFrame(this.m_iRunState);
         }
         else if(a_1273 == a_1274)
         {
            this.a_3940();
         }
         trace(this.toString() + "::" + a_1273);
         this.CheckShotState();
         x += m_numXSpeed;
         y += m_numYSpeed;
         if(0 == this.m_iRunTick || this.IsCanAttack())
         {
            ++this.RunState;
         }
         else
         {
            --this.m_iRunTick;
         }
      }
      
      private function IsCanAttack() : Boolean
      {
         var j:int = 0;
         var stFieldGrid:a_3491 = null;
         if(RUN_STATE_MOVE != this.m_iRunState)
         {
            return false;
         }
         var iXGridNo:int = int(x / a_3491.a_1080);
         var iYGridNo:int = int((y - fYShift) / a_3491.a_1081);
         var iMaxXGridNo:int = iXGridNo + 1;
         if(iMaxXGridNo >= BattleFieldView.a_1011 - 2)
         {
            iMaxXGridNo = BattleFieldView.a_1011 - 3;
         }
         loop0:
         for(var i:int = iXGridNo; i <= iMaxXGridNo; )
         {
            j = iYGridNo - 1;
            while(true)
            {
               if(j > iYGridNo)
               {
                  i++;
                  continue loop0;
               }
               stFieldGrid = a_1584.m_stCurrentBattbleFieldView.a_3438(i,j);
               if(this.a_3492(stFieldGrid))
               {
                  break;
               }
               j++;
            }
            return true;
         }
         return false;
      }
      
      public function a_3492(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return null != stFieldGrid.m_stProtector || null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924) || null != stFieldGrid.m_stBoomDefense || null != stFieldGrid.m_stFlowerDefense || null != stFieldGrid.m_stBaseAuxiliaryFighter;
      }
      
      override protected function CheckShotState() : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var i:int = 0;
         var j:int = 0;
         if(x < -400 || x >= BattleFieldView.a_1013)
         {
            this.a_3940();
            return;
         }
         if(RUN_STATE_CONTINUE == this.m_iRunState && this.m_iRunTick == 0)
         {
            iXGridNo = int(x / a_3491.a_1080);
            iYGridNo = int((y - fYShift) / a_3491.a_1081);
            for(i = iXGridNo - 1; i <= iXGridNo; i++)
            {
               for(j = iYGridNo - 1; j <= iYGridNo; j++)
               {
                  ClearFieldGrid(i,j);
               }
            }
         }
      }
      
      private function set RunState(iState:int) : void
      {
         this.m_iRunState = iState;
         m_numXSpeed = m_numYSpeed = 0;
         switch(iState)
         {
            case RUN_STATE_MOVE:
               m_numXSpeed = -MOVE_SPEED;
               this.m_iRunTick = 1000;
               break;
            case RUN_STATE_ATTACK:
               this.m_iRunTick = 7;
               break;
            case RUN_STATE_CONTINUE:
               this.m_iRunTick = 4;
               break;
            case RUN_STATE_HIDE:
               this.m_iRunTick = 6;
               break;
            default:
               this.a_3940();
               return;
         }
         GotoAndStopFrame(this.m_iRunState);
      }
   }
}

