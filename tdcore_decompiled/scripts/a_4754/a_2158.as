package a_4754
{
   import a_4739.a_1828;
   
   public class a_2158 extends a_1828
   {
      
      public static var e:a_2158 = new a_2158();
      
      public function a_2158()
      {
         super();
      }
      
      public function onShowAllButtonStatus(isEnable:Boolean) : void
      {
         notify("onShowAllButtonStatus",isEnable);
      }
      
      public function onShowMenuPackageStatus(isEnable:Boolean) : void
      {
         notify("onShowMenuPackageStatus",isEnable);
      }
      
      public function notifyTaskTip(taskTipType:int) : void
      {
         notify("notifyTaskTip",taskTipType);
      }
      
      public function notifyPackageTip(isTip:Boolean) : void
      {
         notify("notifyPackageTip",isTip);
      }
      
      public function notifyFriendTip(isTip:Boolean) : void
      {
         notify("notifyFriendTip",isTip);
      }
      
      public function notifyMailTip(isTip:Boolean) : void
      {
         notify("notifyMailTip",isTip);
      }
      
      public function notifyGameStart() : void
      {
         notify("notifyGameStart");
      }
      
      public function notifyGameEnd() : void
      {
         notify("notifyGameEnd");
      }
   }
}

