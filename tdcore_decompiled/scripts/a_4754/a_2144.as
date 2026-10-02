package a_4754
{
   import a_4739.a_1828;
   import flash.display.DisplayObject;
   
   public class a_2144 extends a_1828
   {
      
      public static var e:a_2144 = new a_2144();
      
      public function a_2144()
      {
         super();
      }
      
      public function onNotifyHotGameListUpdate() : void
      {
         notify("onNotifyHotGameListUpdate");
      }
      
      public function setSelectedChange(lvIndex:int, channelIndex:int) : void
      {
         notify("setSelectedChange",lvIndex,channelIndex);
      }
      
      public function initUserRoleDetail(roleDetail:DisplayObject, arrGameChannelList:Array) : void
      {
         notify("initUserRoleDetail",roleDetail,arrGameChannelList);
      }
   }
}

