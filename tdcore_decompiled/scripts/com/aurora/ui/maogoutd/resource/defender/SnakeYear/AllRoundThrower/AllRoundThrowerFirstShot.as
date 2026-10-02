package com.aurora.ui.maogoutd.resource.defender.SnakeYear.AllRoundThrower
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class AllRoundThrowerFirstShot extends a_4348
   {
      
      private static var ms_stAllRoundThrowerFirstShotVector:Array = new Array();
      
      private var m_stTargetMoveIntruder:a_4206;
      
      public var m_TargetFieldGrid:a_3491;
      
      public var m_TargetPosition:Point = new Point();
      
      private var m_rotationRadian:Number = 1.0471975511965976;
      
      private var m_realXSpeed:Number;
      
      private var m_baseYDirection:Number;
      
      private var m_MoveTime:int;
      
      private var m_fStartY:Number;
      
      private var m_fStartX:Number;
      
      public function AllRoundThrowerFirstShot()
      {
         super();
         a_1279 = -15;
         m_iYDisplayCenterPos = -9;
         a_1573 = 2;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         var stAllRoundThrowerFirstShot:AllRoundThrowerFirstShot = ms_stAllRoundThrowerFirstShotVector.pop();
         if(null == stAllRoundThrowerFirstShot)
         {
            stAllRoundThrowerFirstShot = new AllRoundThrowerFirstShot();
         }
         BattleFieldView.a_1018.play();
         return stAllRoundThrowerFirstShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return AllRoundThrowerFirstShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         m_iFollowingShotSpaceState = 3;
         m_isShotHighSkySpace = true;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.m_stTargetMoveIntruder = null;
         this.m_TargetFieldGrid = null;
         if(-1 == ms_stAllRoundThrowerFirstShotVector.indexOf(this))
         {
            ms_stAllRoundThrowerFirstShotVector.push(this);
         }
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
         var distance:Number = NaN;
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
         distance = Math.abs(dx);
         this.m_rotationRadian = Math.atan2(dy,dx);
         this.m_fStartY = y;
         this.m_fStartX = x;
         a_1581 = int(Math.sqrt(dx * dx + dy * dy) / m_numXSpeed);
         if(a_1581 < 2)
         {
            a_1581 = 2;
         }
         m_numYSpeed = distance < 2 * a_3491.a_1080 ? a_3491.a_1081 * 0.6 / a_1581 : 3 * a_3491.a_1081 / a_1581;
         this.m_realXSpeed = m_numXSpeed * Math.cos(this.m_rotationRadian);
         this.m_baseYDirection = m_numXSpeed * Math.sin(this.m_rotationRadian);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var t:Number = NaN;
         var startX:Number = NaN;
         var startY:Number = NaN;
         var endX:Number = NaN;
         var endY:Number = NaN;
         var dist:Number = NaN;
         var heightFactor:Number = NaN;
         var topY:Number = NaN;
         var topX:Number = NaN;
         var curMouseX:Number = NaN;
         if(m_isHited)
         {
            if(a_1273 == a_1274)
            {
               this.a_3940();
            }
            nextFrame();
            return;
         }
         if(a_1447 == 0)
         {
            a_1447 = iCurrentTime;
         }
         if(a_1576)
         {
            this.m_MoveTime = iCurrentTime - a_1447;
            t = this.m_MoveTime / a_1581;
            if(t > 1)
            {
               t = 1;
            }
            startX = this.m_fStartX;
            startY = this.m_fStartY;
            if(Boolean(this.m_stTargetMoveIntruder) && Boolean(this.m_stTargetMoveIntruder.m_stCurrentFieldGrid))
            {
               curMouseX = this.m_stTargetMoveIntruder.x + this.m_stTargetMoveIntruder.stDisplayBitmap.x + this.m_stTargetMoveIntruder.width / 2;
               this.m_TargetPosition.x += (curMouseX - this.m_TargetPosition.x) * 0.25;
            }
            endX = this.m_TargetPosition.x;
            endY = this.m_TargetPosition.y;
            dist = Math.abs(endX - startX);
            heightFactor = Math.min(2,Math.max(0.5,dist / (a_3491.a_1080 * 3)));
            topY = Math.min(startY,endY) - a_3491.a_1081 * heightFactor;
            topX = (startX + endX) / 2;
            x = (1 - t) * (1 - t) * startX + 2 * (1 - t) * t * topX + t * t * endX;
            y = (1 - t) * (1 - t) * startY + 2 * (1 - t) * t * topY + t * t * endY;
            if(t >= 1)
            {
               this.a_4351();
               return;
            }
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
      }
      
      override protected function a_4351() : void
      {
         if(null != this.m_stTargetMoveIntruder && Boolean(this.m_stTargetMoveIntruder.m_stCurrentFieldGrid))
         {
            if(hitTestObject(this.m_stTargetMoveIntruder))
            {
               m_isHited = true;
               if(a_1276.length > 0)
               {
                  gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
               }
               a_4352(this.m_stTargetMoveIntruder);
               this.SputterHurt(this.m_stTargetMoveIntruder.m_stCurrentFieldGrid,this.m_stTargetMoveIntruder);
            }
         }
         else if(Math.abs(x - this.m_TargetPosition.x) <= 0.5 && Boolean(this.m_TargetFieldGrid))
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
         var stFieldGrid:a_3491 = null;
         var j:int = 0;
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         if(stHitenFieldGrid == null)
         {
            return;
         }
         for(var i:int = stHitenFieldGrid.m_iXGridNo - 1; i <= stHitenFieldGrid.m_iXGridNo + 1; i++)
         {
            for(j = stHitenFieldGrid.m_iYGridNo - 1; j <= stHitenFieldGrid.m_iYGridNo + 1; j++)
            {
               stFieldGrid = a_1583.a_3438(i,j);
               if(null != stFieldGrid)
               {
                  arrMouveIntruder = stFieldGrid.a_1511.slice();
                  for each(stMouseIntruder in arrMouveIntruder)
                  {
                     if(stMouseIntruder != stHitenMouseIntruder && !stMouseIntruder.isCannotSeeByFighter && (0 == stMouseIntruder.iSpaceState || 2 == stMouseIntruder.iSpaceState))
                     {
                        stMouseIntruder.a_4209(int(a_1579 * 0.45));
                     }
                  }
               }
            }
         }
      }
   }
}

