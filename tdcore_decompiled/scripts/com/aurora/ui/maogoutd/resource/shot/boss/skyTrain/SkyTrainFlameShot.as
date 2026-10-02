package com.aurora.ui.maogoutd.resource.shot.boss.skyTrain
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.boss.BaseBossShot;
   
   public class SkyTrainFlameShot extends BaseBossShot
   {
      
      private static var ms_arrShot:Array = new Array();
      
      private static var ms_bIsInitCacheSkewingVector:Boolean = false;
      
      private var m_iDirection:int = -1;
      
      public function SkyTrainFlameShot()
      {
         super();
         a_1279 = -0.5 * this.width;
      }
      
      public static function a_4344() : SkyTrainFlameShot
      {
         var stBaseShot:SkyTrainFlameShot = null;
         stBaseShot = ms_arrShot.pop();
         if(null == stBaseShot)
         {
            stBaseShot = new SkyTrainFlameShot();
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
      
      override protected function CheckShotState() : void
      {
         if(x < 0 || x >= BattleFieldView.a_1013 || y < 0 || y > BattleFieldView.a_1014)
         {
            this.a_3940();
            return;
         }
         var iXGridNo:int = int(x / a_3491.a_1080);
         var iYGridNo:int = int(y / a_3491.a_1081);
         ClearFieldGrid(iXGridNo,iYGridNo);
      }
      
      override public function get width() : Number
      {
         return 60;
      }
      
      override public function get height() : Number
      {
         return 38;
      }
      
      override protected function getBindMovie() : Class
      {
         return SkyTrainFlameShotMovie;
      }
      
      public function set Direction(iDirection:int) : void
      {
         if(this.m_iDirection != iDirection)
         {
            this.m_iDirection = iDirection;
         }
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         InitData();
         a_1587 = 0;
         this.setSpeed(numSpeed);
         return true;
      }
      
      private function setSpeed(fSpeed:Number) : void
      {
         var fAngle:Number = NaN;
         var fRadian:Number = NaN;
         fAngle = this.m_iDirection * -45;
         this.rotation = fAngle;
         fRadian = fAngle / 180 * Math.PI;
         m_numXSpeed = fSpeed * Math.cos(fRadian);
         m_numYSpeed = fSpeed * Math.sin(fRadian);
      }
   }
}

