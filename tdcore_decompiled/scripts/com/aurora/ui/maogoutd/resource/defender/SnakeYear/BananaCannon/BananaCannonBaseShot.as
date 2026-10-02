package com.aurora.ui.maogoutd.resource.defender.SnakeYear.BananaCannon
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class BananaCannonBaseShot extends a_4348
   {
      
      private static var a_1591:Array = new Array();
      
      private var m_stTargetMoveIntruder:a_4206;
      
      public var m_TargetFieldGrid:a_3491;
      
      public var m_TargetPosition:Point = new Point();
      
      private var m_iPhase:int = 0;
      
      private var m_StartX:Number;
      
      private var m_StartY:Number;
      
      private var m_ForwardEndX:Number;
      
      private var m_ReturnEndX:Number;
      
      private var m_HitMousArrayOnReturn:Array = [];
      
      private var m_EllipseProgress:Number = 0;
      
      private var m_EllipseTotalTime:Number = 0;
      
      private var m_ReferenceY:Number = 0;
      
      private var m_DefenderYGridNo:int = 0;
      
      public function BananaCannonBaseShot()
      {
         super();
         a_1279 = -15;
         m_iYDisplayCenterPos = -14;
         a_1573 = 2;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         var stBananaCannonBaseShot:BananaCannonBaseShot = a_1591.pop();
         if(null == stBananaCannonBaseShot)
         {
            stBananaCannonBaseShot = new BananaCannonBaseShot();
         }
         BattleFieldView.a_1018.play();
         return stBananaCannonBaseShot;
      }
      
      public function get stTargetMoveIntruder() : a_4206
      {
         return this.m_stTargetMoveIntruder;
      }
      
      public function set stTargetMoveIntruder(value:a_4206) : void
      {
         var targetX:Number = NaN;
         var targetY:Number = NaN;
         this.m_stTargetMoveIntruder = value;
         if(value != null && value.m_stCurrentFieldGrid != null)
         {
            this.m_TargetFieldGrid = this.m_stTargetMoveIntruder.m_stCurrentFieldGrid;
            targetX = this.m_stTargetMoveIntruder.x + this.m_stTargetMoveIntruder.stDisplayBitmap.x + this.m_stTargetMoveIntruder.width / 2;
            targetY = this.m_stTargetMoveIntruder.y + this.m_stTargetMoveIntruder.stDisplayBitmap.y + this.m_stTargetMoveIntruder.height / 2;
            this.m_TargetPosition.x = targetX;
            this.m_TargetPosition.y = targetY;
            this.m_ForwardEndX = targetX;
         }
         else
         {
            if(a_1283)
            {
               this.m_ForwardEndX = 50;
            }
            else
            {
               this.m_ForwardEndX = BattleFieldView.a_1013 - 50;
            }
            this.m_TargetPosition.x = this.m_ForwardEndX;
            this.m_TargetPosition.y = this.m_StartY;
         }
      }
      
      override protected function getBindMovie() : Class
      {
         return BananaCannonBaseShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         var iStartYGridNo:int = 0;
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         rotationY = numSpeed < 0 ? -180 : 0;
         this.m_iPhase = 0;
         this.m_StartX = iXpos;
         this.m_StartY = iYpos;
         if(a_1283)
         {
            this.m_ReturnEndX = iXpos + 22;
         }
         else
         {
            this.m_ReturnEndX = iXpos - 22;
         }
         this.m_HitMousArrayOnReturn = [];
         this.m_EllipseProgress = 0;
         if(stStartFieldGrid != null)
         {
            this.m_DefenderYGridNo = stStartFieldGrid.m_iYGridNo;
            this.m_ReferenceY = (this.m_DefenderYGridNo + 0.5) * a_3491.a_1081;
         }
         else
         {
            iStartYGridNo = Math.floor(iYpos / a_3491.a_1081);
            this.m_DefenderYGridNo = iStartYGridNo;
            this.m_ReferenceY = (iStartYGridNo + 0.5) * a_3491.a_1081;
         }
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.m_stTargetMoveIntruder = null;
         this.m_TargetFieldGrid = null;
         this.m_iPhase = 0;
         this.m_HitMousArrayOnReturn = [];
         if(-1 == a_1591.indexOf(this))
         {
            a_1591.push(this);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var t:Number = NaN;
         var distance:Number = NaN;
         var t1:Number = NaN;
         var t2:Number = NaN;
         if(m_isHited && !m_isPenetrate)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               m_bActive.Value = false;
               this.a_3940();
            }
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
            distance = Math.abs(this.m_ForwardEndX - this.m_StartX);
            this.m_EllipseTotalTime = distance / Math.abs(m_numXSpeed);
            if(this.m_EllipseTotalTime < 10)
            {
               this.m_EllipseTotalTime = 10;
            }
         }
         var elapsedTime:Number = iCurrentTime - a_1447;
         var totalEllipseTime:Number = this.m_EllipseTotalTime * 2;
         this.m_EllipseProgress = elapsedTime / totalEllipseTime;
         if(this.m_EllipseProgress >= 1)
         {
            this.a_3940();
            return;
         }
         var midX:Number = (this.m_StartX + this.m_ForwardEndX) / 2;
         if(this.m_EllipseProgress < 0.5)
         {
            this.m_iPhase = 0;
            t = this.m_EllipseProgress * 2;
            t1 = 1 - t;
            x = t1 * t1 * this.m_StartX + 2 * t1 * t * midX + t * t * this.m_ForwardEndX;
            y = t1 * t1 * this.m_StartY + 2 * t1 * t * (this.m_ReferenceY - 96) + t * t * this.m_StartY;
         }
         else
         {
            if(this.m_iPhase == 0)
            {
               this.m_HitMousArrayOnReturn = [];
            }
            this.m_iPhase = 1;
            t = (this.m_EllipseProgress - 0.5) * 2;
            t2 = 1 - t;
            x = t2 * t2 * this.m_ForwardEndX + 2 * t2 * t * midX + t * t * this.m_ReturnEndX;
            y = t2 * t2 * this.m_StartY + 2 * t2 * t * (this.m_ReferenceY + 116) + t * t * this.m_StartY;
         }
         this.a_4351();
         if(a_1578)
         {
            if(!FollowingShotHandle())
            {
               return;
            }
         }
      }
      
      override protected function a_4351() : void
      {
         var distanceToStart:Number = NaN;
         var checkYGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(this.m_iPhase == 1 && this.m_EllipseProgress > 0.9)
         {
            distanceToStart = Math.abs(x - this.m_StartX);
            if(distanceToStart > 200)
            {
               this.a_3940();
               return;
            }
         }
         var iXGridNo:int = Math.max(0,Math.min(BattleFieldView.a_1011 - 1,Math.floor(x / a_3491.a_1080)));
         var checkYGridNos:Array = [];
         if(this.m_iPhase == 0)
         {
            checkYGridNos.push(this.m_DefenderYGridNo);
            if(this.m_DefenderYGridNo - 1 >= 0)
            {
               checkYGridNos.push(this.m_DefenderYGridNo - 1);
            }
         }
         else
         {
            checkYGridNos.push(this.m_DefenderYGridNo);
            if(this.m_DefenderYGridNo + 1 < BattleFieldView.a_1012)
            {
               checkYGridNos.push(this.m_DefenderYGridNo + 1);
            }
         }
         for(var i:int = 0; i < checkYGridNos.length; i++)
         {
            checkYGridNo = int(checkYGridNos[i]);
            stFieldGrid = a_1583.a_3438(iXGridNo,checkYGridNo);
            if(Boolean(stFieldGrid) && stFieldGrid.m_isOccupy)
            {
               arrMoveIntruder = stFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(this.m_HitMousArrayOnReturn.indexOf(stMoveIntruder) == -1)
                  {
                     if(!stMoveIntruder.isCannotSeeByFighter && (stMoveIntruder.iSpaceState == 0 || stMoveIntruder.iSpaceState == 2) && hitTestObject(stMoveIntruder))
                     {
                        stMoveIntruder.a_3969(GetFinalDamage());
                        if(a_1573 > 0)
                        {
                           stMoveIntruder.a_4208(b_182.a_432,a_1573);
                        }
                        this.m_HitMousArrayOnReturn.push(stMoveIntruder);
                     }
                  }
               }
            }
         }
      }
   }
}

