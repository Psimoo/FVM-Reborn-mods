package com.aurora.ui.maogoutd.resource.defender.TigerYear.ElectricTiger
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class ElectricTigerSputterShot extends a_4348
   {
      
      private static var ms_stElectricTigerSputterShotVector:Array = new Array();
      
      public var m_isParentAttackDie:Boolean = false;
      
      public var startPosition:Point = new Point();
      
      public var stParentMouse:a_4206;
      
      private var TargetMouse:a_4206;
      
      private var appearedTimes:int = 0;
      
      private var dis:Number;
      
      public function ElectricTigerSputterShot()
      {
         super();
         a_1279 = 6 - 15;
         m_iYDisplayCenterPos = -33 + 8;
         a_1588 = true;
         a_1275 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var stElectricTigerSputterShot:ElectricTigerSputterShot = ms_stElectricTigerSputterShotVector.pop();
         if(null == stElectricTigerSputterShot)
         {
            stElectricTigerSputterShot = new ElectricTigerSputterShot();
         }
         BattleFieldView.a_1017.play();
         return stElectricTigerSputterShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return ElectricTigerSputterShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         this.CaculateScale();
         a_1271 = true;
         super.a_1797(iGlobalID,0,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         m_isPenetrate = true;
         this.m_isParentAttackDie = false;
         this.appearedTimes = 0;
         if(this.TargetMouse != null)
         {
            this.TargetMouse.m_isShowShandian = true;
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            nextFrame();
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1273 == a_1274)
            {
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
         }
         if(this.appearedTimes == 0)
         {
            this.appearedTimes = iCurrentTime;
         }
         if(this.m_isParentAttackDie)
         {
            this.a_3940();
            return;
         }
         if((iCurrentTime - this.appearedTimes) % (1 * 20) == 0)
         {
            if(!(this.stTargetMouse != null && this.stTargetMouse.m_stCurrentFieldGrid != null && this.stTargetMouse.iLifeValue > 0))
            {
               this.a_3940();
               return;
            }
            if(this.stTargetMouse.iLifeValue - GetFinalDamage() <= 0)
            {
               this.stTargetMouse.iDIYLife = 0;
               if(!this.stTargetMouse.isCannotSeeByInsurance)
               {
                  this.stTargetMouse.ShowBoomDieEffect();
                  this.stTargetMouse.a_3432();
               }
               else
               {
                  this.stTargetMouse.a_3969(GetFinalDamage());
               }
               return;
            }
            this.stTargetMouse.a_3969(GetFinalDamage());
         }
         if(iCurrentTime - this.appearedTimes >= 3 * 20)
         {
            this.a_3940();
            return;
         }
         this.CaculateScale();
      }
      
      public function CaculateScale() : void
      {
         var iPosX:int = 0;
         var iPosY:int = 0;
         var MouseY:Number = NaN;
         var MouseX:Number = NaN;
         var dy:Number = NaN;
         var dx:Number = NaN;
         var ratation:Number = NaN;
         if(this.stParentMouse != null && this.stParentMouse.m_stCurrentFieldGrid != null && this.stTargetMouse != null && this.stTargetMouse.m_stCurrentFieldGrid != null)
         {
            iPosX = this.stParentMouse.x + this.stParentMouse.stDisplayBitmap.x + this.stParentMouse.width / 2;
            iPosY = this.stParentMouse.y + this.stParentMouse.stDisplayBitmap.y + this.stParentMouse.height / 2;
            this.x = iPosX;
            this.y = iPosY;
            this.startPosition = new Point(iPosX,iPosY);
            MouseY = this.stTargetMouse.y + this.stTargetMouse.stDisplayBitmap.y + this.stTargetMouse.height / 2;
            MouseX = this.stTargetMouse.x + this.stTargetMouse.stDisplayBitmap.x + this.stTargetMouse.width / 2;
            dy = MouseY - this.startPosition.y;
            dx = MouseX - this.startPosition.x;
            ratation = Math.atan2(dy,dx);
            this.rotation = ratation * 180 / Math.PI;
            this.dis = Point.distance(this.startPosition,new Point(MouseX,MouseY));
            stOriginalMovieClip.bgMask.width = this.dis;
         }
         else
         {
            this.a_3940();
         }
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(this.TargetMouse != null)
         {
            this.TargetMouse.m_isShowShandian = false;
         }
         this.stParentMouse == null;
         this.stTargetMouse = null;
         if(-1 == ms_stElectricTigerSputterShotVector.indexOf(this))
         {
            ms_stElectricTigerSputterShotVector.push(this);
         }
         this.m_isParentAttackDie = false;
         return true;
      }
      
      public function get stTargetMouse() : a_4206
      {
         return this.TargetMouse;
      }
      
      public function set stTargetMouse(value:a_4206) : void
      {
         this.TargetMouse = value;
      }
   }
}

