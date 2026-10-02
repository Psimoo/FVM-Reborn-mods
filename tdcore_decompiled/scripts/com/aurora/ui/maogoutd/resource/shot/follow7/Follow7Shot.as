package com.aurora.ui.maogoutd.resource.shot.follow7
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class Follow7Shot extends a_4348
   {
      
      private static var ms_stCancerFollowShotVector:Array = new Array();
      
      public function Follow7Shot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1578 = true;
         a_1588 = true;
         a_1304 = b_183.enm_CancerFollow;
      }
      
      public static function a_4344() : a_4348
      {
         var stBaseShot:a_4348 = ms_stCancerFollowShotVector.pop();
         if(stBaseShot == null)
         {
            stBaseShot = new Follow7Shot();
         }
         BattleFieldView.a_1017.play();
         return stBaseShot;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(ms_stCancerFollowShotVector.indexOf(this) == -1)
         {
            ms_stCancerFollowShotVector.push(this);
         }
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return Follow7ShotMovie;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         super.a_4216(iCurrentTime);
      }
      
      override protected function a_4351() : void
      {
         if(x < 0 || x > BattleFieldView.a_1013)
         {
            this.a_3940();
            return;
         }
         var stBaseMoveIntruder:a_4206 = a_1583.a_3431();
         if(Boolean(stBaseMoveIntruder) && hitTestObject(stBaseMoveIntruder))
         {
            a_4352(stBaseMoveIntruder);
            m_isHited = true;
            gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
         }
      }
   }
}

