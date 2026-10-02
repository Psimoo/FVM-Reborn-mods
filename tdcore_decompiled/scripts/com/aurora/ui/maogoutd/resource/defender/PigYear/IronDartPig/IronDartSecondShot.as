package com.aurora.ui.maogoutd.resource.defender.PigYear.IronDartPig
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class IronDartSecondShot extends a_4348
   {
      
      public function IronDartSecondShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1574 = 40;
         a_1578 = true;
         a_1588 = true;
         m_isHited = false;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(IronDartSecondShot,IronDartSecondShotMovie) as IronDartSecondShot;
      }
      
      public static function GetFreeShot1() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(IronDartSecondShot,IronDartSecondShot1Movie) as IronDartSecondShot;
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

