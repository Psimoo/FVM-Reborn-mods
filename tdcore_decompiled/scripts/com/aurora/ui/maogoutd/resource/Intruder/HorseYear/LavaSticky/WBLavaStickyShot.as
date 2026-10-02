package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.LavaSticky
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffData;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffParams;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class WBLavaStickyShot extends a_4348
   {
      
      public var m_TargetFieldGrid:a_3491;
      
      public var m_TargetPosition:Point = new Point();
      
      private var m_rotationRadian:Number = 1.0471975511965976;
      
      private var m_realXSpeed:Number;
      
      private var m_baseYDirection:Number;
      
      private var m_MoveTime:int;
      
      public function WBLavaStickyShot()
      {
         super();
         a_1279 = -15;
         m_iYDisplayCenterPos = -14;
         a_1573 = 2;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      public static function a_4344() : WBLavaStickyShot
      {
         return PoolManager.getInstance().CheckOutOne(WBLavaStickyShot,WBLavaStickyShotMovie) as WBLavaStickyShot;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         m_iFollowingShotSpaceState = 3;
         m_isShotHighSkySpace = true;
         return true;
      }
      
      public function SetTargetDefense(grid:a_3491) : void
      {
         this.m_TargetFieldGrid = grid;
         this.m_TargetPosition.x = grid.m_iXGridNo * 60 + 30;
         this.m_TargetPosition.y = grid.m_iYGridNo * 64 + 32;
      }
      
      override protected function a_4349() : Boolean
      {
         var iXGridNo:int = 0;
         var numDistance:Number = NaN;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var dx:Number = this.m_TargetPosition.x - x;
         var dy:Number = this.m_TargetPosition.y - y;
         this.m_rotationRadian = Math.atan2(dy,dx);
         a_1581 = int(Math.sqrt(dx * dx + dy * dy) / m_numXSpeed);
         m_numYSpeed = 3 * a_3491.a_1081 / a_1581;
         if(numDistance < 2 * a_3491.a_1080)
         {
            if(a_1581 < 2)
            {
               a_1581 = 2;
            }
            m_numYSpeed = a_3491.a_1081 * 0.6 / a_1581;
         }
         else
         {
            m_numYSpeed = 3 * a_3491.a_1081 / a_1581;
         }
         this.m_realXSpeed = m_numXSpeed * Math.cos(this.m_rotationRadian);
         this.m_baseYDirection = m_numXSpeed * Math.sin(this.m_rotationRadian);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var t:Number = NaN;
         var baseY:Number = NaN;
         var parabolaY:Number = NaN;
         if(m_isHited)
         {
            if(a_1273 == a_1274)
            {
               a_3940();
            }
            nextFrame();
            return;
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         x += this.m_realXSpeed;
         if(a_1576)
         {
            this.m_MoveTime = iCurrentTime - a_1447;
            t = (iCurrentTime - a_1447) / a_1581;
            baseY = this.m_baseYDirection;
            parabolaY = 2 * m_numYSpeed * t - m_numYSpeed;
            y += baseY + parabolaY;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         this.a_4351();
      }
      
      override protected function a_4351() : void
      {
         var params:BattleBuffParams = null;
         var buffData:BattleBuffData = null;
         if(x <= 0 || x > BattleFieldView.a_1013 + 10)
         {
            a_3940();
            return;
         }
         if(x <= this.m_TargetPosition.x && Boolean(this.m_TargetFieldGrid))
         {
            m_isHited = true;
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
            BattleDestroyUtil.ClearOneGridIgnoreFangYu(this.m_TargetFieldGrid);
            if(this.m_TargetFieldGrid.m_isNeedTray == false)
            {
               params = new BattleBuffParams();
               params.gameMoveClipClass = WBLavaStickyGridEffectMovie;
               params.effectClass = WBLavaStickyGridEffect;
               params.y = 0;
               params.x = 0;
               params.offsetType = 0;
               params.startAnim = 0;
               params.loopAnim = 1;
               params.endAnim = 2;
               buffData = this.m_TargetFieldGrid.buffCom.AddBuff(20023,120 * 20,params);
               if(buffData != null && buffData.stEffect != null)
               {
                  (buffData.stEffect as WBLavaStickyGridEffect).InitData(this.m_TargetFieldGrid,buffData);
                  this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(buffData.stEffect,BattleLayerDefine.EFFECTS_BASE2_TYPE,this.m_TargetFieldGrid);
               }
               this.CreateMouse();
            }
         }
      }
      
      protected function CreateMouse() : void
      {
         var lavaMouse:WBLavaStickyMouseMoveIntruder = null;
         lavaMouse = WBLavaStickyMouseMoveIntruder.a_3926();
         if(lavaMouse)
         {
            lavaMouse.a_1797((1 << 16) + this.m_TargetFieldGrid.m_iYGridNo + 100,-1);
            lavaMouse.m_stMoveIntruderTypeID = 134234385;
            this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(lavaMouse,this.m_TargetFieldGrid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
            lavaMouse.x = (this.m_TargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            lavaMouse.y = (this.m_TargetFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081 - 5;
         }
      }
   }
}

