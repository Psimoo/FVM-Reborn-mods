package com.aurora.ui.maogoutd.resource.shot.DoubleRen
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class DoubleRenShot extends a_4348
   {
      
      public function DoubleRenShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1578 = true;
         a_1588 = true;
         m_isHited = false;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(DoubleRenShot,DoubleRenShotMovie) as a_4348;
      }
      
      public static function GetFreeShot1() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(DoubleRenShot,DoubleRenShot1Movie) as a_4348;
      }
      
      public static function GetFreeShot2() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(DoubleRenShot,DoubleRenShot2Movie) as a_4348;
      }
      
      public static function GetFreeShot3() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(DoubleRenShot,DoubleRenShot3Movie) as a_4348;
      }
      
      public static function GetFreeShot4() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(DoubleRenShot,DoubleRenShot4Movie) as a_4348;
      }
      
      public static function GetFreeShot5() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(DoubleRenShot,DoubleRenShot5Movie) as a_4348;
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

