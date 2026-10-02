package com.aurora.ui.maogoutd.resource.shot.cancerFollow
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class CancerFollowShot extends a_4348
   {
      
      public function CancerFollowShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1578 = true;
         a_1588 = true;
         a_1304 = b_183.enm_CancerFollow;
      }
      
      public static function a_4344() : CancerFollowShot
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(CancerFollowShot,CancerFollowShotMovie) as CancerFollowShot;
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

