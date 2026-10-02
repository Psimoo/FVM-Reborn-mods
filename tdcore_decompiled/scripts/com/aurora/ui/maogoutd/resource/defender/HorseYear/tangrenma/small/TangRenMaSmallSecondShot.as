package com.aurora.ui.maogoutd.resource.defender.HorseYear.tangrenma.small
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class TangRenMaSmallSecondShot extends a_4348
   {
      
      private var m_stTargetMoveIntruder:a_4206;
      
      public var m_TargetFieldGrid:a_3491;
      
      public var m_TargetPosition:Point = new Point();
      
      private var m_rotationRadian:Number = 1.0471975511965976;
      
      private var m_realXSpeed:Number;
      
      private var m_baseYDirection:Number;
      
      private var m_MoveTime:int;
      
      public function TangRenMaSmallSecondShot()
      {
         super();
         a_1279 = -14;
         m_iYDisplayCenterPos = -8;
         a_1573 = 1;
         a_1275 = 0;
         a_1587 = 1;
         a_1588 = true;
         a_1576 = true;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(TangRenMaSmallSecondShot) as a_4348;
      }
      
      override protected function getBindMovie() : Class
      {
         return TangRenMaSmallSecondShotMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.m_stTargetMoveIntruder = null;
         this.m_TargetFieldGrid = null;
         return true;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         return true;
      }
      
      public function get stTargetMoveIntruder() : a_4206
      {
         return this.m_stTargetMoveIntruder;
      }
      
      public function set stTargetMoveIntruder(value:a_4206) : void
      {
         if(value == null)
         {
            return;
         }
         this.m_stTargetMoveIntruder = value;
         this.m_TargetFieldGrid = this.m_stTargetMoveIntruder.m_stCurrentFieldGrid;
         var targetX:Number = this.m_stTargetMoveIntruder.x + this.m_stTargetMoveIntruder.stDisplayBitmap.x + this.m_stTargetMoveIntruder.width / 2;
         var targetY:Number = this.m_stTargetMoveIntruder.y + this.m_stTargetMoveIntruder.stDisplayBitmap.y + this.m_stTargetMoveIntruder.height / 2;
         this.m_TargetPosition.x = targetX;
         this.m_TargetPosition.y = targetY;
      }
      
      override protected function a_4349() : Boolean
      {
         var iXGridNo:int = 0;
         var numDistance:Number = NaN;
         var stFieldGrid:a_3491 = null;
         var targetX:Number = NaN;
         var targetY:Number = NaN;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         if(Boolean(this.m_stTargetMoveIntruder) && Boolean(this.m_stTargetMoveIntruder.m_stCurrentFieldGrid))
         {
            numDistance = Math.abs(this.m_stTargetMoveIntruder.x + this.m_stTargetMoveIntruder.stDisplayBitmap.x + this.m_stTargetMoveIntruder.width / 2 - x);
            this.m_TargetFieldGrid = this.m_stTargetMoveIntruder.m_stCurrentFieldGrid;
            targetX = this.m_stTargetMoveIntruder.x + this.m_stTargetMoveIntruder.stDisplayBitmap.x + this.m_stTargetMoveIntruder.width / 2;
            targetY = this.m_stTargetMoveIntruder.y + this.m_stTargetMoveIntruder.stDisplayBitmap.y + this.m_stTargetMoveIntruder.height / 2;
            this.m_TargetPosition.x = targetX;
            this.m_TargetPosition.y = targetY;
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
               this.a_3940();
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
         if(x <= 0 || x > BattleFieldView.a_1013 + 10)
         {
            this.a_3940();
            return;
         }
         if(null != this.m_stTargetMoveIntruder && Boolean(this.m_stTargetMoveIntruder.m_stCurrentFieldGrid))
         {
            if(hitTestObject(this.m_stTargetMoveIntruder))
            {
               m_isHited = true;
               if(a_1276.length > 0)
               {
                  gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
               }
               this.a_4352(this.m_stTargetMoveIntruder);
               this.SputterHurt(this.m_stTargetMoveIntruder.m_stCurrentFieldGrid,this.m_stTargetMoveIntruder);
            }
         }
         else if(x >= this.m_TargetPosition.x && Boolean(this.m_TargetFieldGrid))
         {
            m_isHited = true;
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
            this.SputterHurt(this.m_TargetFieldGrid,null);
         }
      }
      
      override protected function SputterHurt(stHitenFieldGrid:a_3491, stHitenMouseIntruder:a_4206) : void
      {
         var xIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(!stHitenFieldGrid)
         {
            return;
         }
         var xStart:int = Math.max(stHitenFieldGrid.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(stHitenFieldGrid.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(stHitenFieldGrid.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(stHitenFieldGrid.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stFieldGrid = stHitenFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               arrMoveIntruder = stFieldGrid.IntruderArray;
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(stMoveIntruder.iLifeValue > 0)
                  {
                     if(stMoveIntruder != stHitenMouseIntruder && !stMoveIntruder.isCannotSeeByFighter && (0 == stMoveIntruder.iSpaceState || 3 == stMoveIntruder.iSpaceState))
                     {
                        stMoveIntruder.a_4209(int(GetFinalDamage()));
                     }
                  }
               }
            }
         }
      }
      
      override public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         super.a_4352(baseMoveIntruder);
         return true;
      }
   }
}

