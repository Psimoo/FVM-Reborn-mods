package com.aurora.ui.maogoutd.resource.shot
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   import flash.utils.setTimeout;
   
   public class PitayaFireBallShot extends a_4348
   {
      
      private static var ms_stPitayaFireBallShotVector:Array = new Array();
      
      private var a_1595:a_4206;
      
      private var a_1596:int = -1;
      
      public function PitayaFireBallShot()
      {
         super();
         a_1279 = -width * 0.8;
         a_1573 = 1;
         a_1576 = true;
         a_1588 = true;
      }
      
      public static function a_4344() : a_4348
      {
         var stPitayaFireBallShot:PitayaFireBallShot = ms_stPitayaFireBallShotVector.pop();
         if(null == stPitayaFireBallShot)
         {
            stPitayaFireBallShot = new PitayaFireBallShot();
         }
         BattleFieldView.a_1017.play();
         return stPitayaFireBallShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return PitayaFireBallShotMovie;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(this.a_1596 <= 0)
         {
            a_1275 = 1;
            gotoAndStop(1);
            this.a_1596 = setTimeout(this.a_3940,2000);
         }
         if(iCurrentTime % 2 == 0)
         {
            nextFrame();
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1273 == a_1274)
            {
               this.a_3940();
            }
         }
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stPitayaFireBallShotVector.indexOf(this))
         {
            ms_stPitayaFireBallShotVector.push(this);
         }
         this.a_1595 = null;
         this.a_1596 = -1;
         return true;
      }
   }
}

