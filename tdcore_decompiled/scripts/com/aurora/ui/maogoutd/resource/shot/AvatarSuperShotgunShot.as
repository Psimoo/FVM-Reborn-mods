package com.aurora.ui.maogoutd.resource.shot
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class AvatarSuperShotgunShot extends a_4348
   {
      
      private static var ms_stAvatarSuperShotgunShotVector:Array = new Array();
      
      public var m_iShotBoundStopTime:int = 0;
      
      public function AvatarSuperShotgunShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1576 = false;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 0;
         a_1577 = false;
      }
      
      public static function a_4344() : a_4348
      {
         var stAvatarSuperShotgunShot:AvatarSuperShotgunShot = ms_stAvatarSuperShotgunShotVector.pop();
         if(null == stAvatarSuperShotgunShot)
         {
            stAvatarSuperShotgunShot = new AvatarSuperShotgunShot();
         }
         BattleFieldView.a_1017.play();
         return stAvatarSuperShotgunShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return AvatarSuperShotgunShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         a_1275 = 0;
         a_1587 = 1;
         gotoAndStop(1);
         y += 85;
         a_1586 = y;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stAvatarSuperShotgunShotVector.indexOf(this))
         {
            ms_stAvatarSuperShotgunShotVector.push(this);
         }
         this.m_iShotBoundStopTime = 0;
         return true;
      }
      
      override protected function a_4351() : void
      {
         a_1577 = false;
         super.a_4351();
      }
      
      override public function a_4352(stBaseMoveIntruder:a_4206) : Boolean
      {
         super.a_4352(stBaseMoveIntruder);
         if(Boolean(this.m_iShotBoundStopTime > 0) && Boolean(stBaseMoveIntruder) && stBaseMoveIntruder.iLifeValue > 0)
         {
            stBaseMoveIntruder.a_4208(b_182.a_435,this.m_iShotBoundStopTime);
         }
         return true;
      }
   }
}

