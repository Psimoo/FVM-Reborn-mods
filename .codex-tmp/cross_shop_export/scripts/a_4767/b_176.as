package a_4767
{
   import a_4764.b_175;
   import com.aurora.ui.maogoutd.ITDLobbyUI;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   
   public interface b_176
   {
      
      function a_2230(param1:ITDLobbyUI) : Boolean;
      
      function a_2480(param1:String, param2:String, param3:uint = 0, param4:int = 0, param5:ByteArray = null) : Boolean;
      
      function a_2481(param1:int) : Boolean;
      
      function a_2482(param1:int) : Boolean;
      
      function a_2483(param1:int, param2:int) : Boolean;
      
      function a_2484(param1:int = -1, param2:int = -1) : Boolean;
      
      function getTDLobbyLogicConsortia() : b_175;
      
      function a_2485(param1:int, param2:int, param3:int, param4:int, param5:String = "", param6:String = "", param7:Array = null, param8:int = -1, param9:int = -1, param10:int = 0) : Boolean;
      
      function a_2490() : Boolean;
      
      function a_2491() : Boolean;
      
      function a_2488(param1:int, param2:int) : Boolean;
      
      function a_2489(param1:Array) : Boolean;
      
      function a_2309(param1:Array) : Boolean;
      
      function a_1794(param1:int, param2:int) : Boolean;
      
      function a_2492(param1:String, param2:int) : Boolean;
      
      function a_2493(param1:Object) : Boolean;
      
      function a_2494(param1:String) : Boolean;
      
      function a_2495(param1:int) : Boolean;
      
      function a_2354(param1:Array) : Boolean;
      
      function a_2356(param1:int, param2:int) : Boolean;
      
      function a_2496(param1:int, param2:int) : Boolean;
      
      function a_2359(param1:Array, param2:int) : Boolean;
      
      function a_2497(param1:Array) : Boolean;
      
      function a_2498(param1:Object) : Boolean;
      
      function a_2499(param1:Object, param2:Array) : Boolean;
      
      function a_2500() : Boolean;
      
      function a_2501(param1:int) : Boolean;
      
      function a_2502(param1:int, param2:int = 0) : Boolean;
      
      function a_2503(param1:int, param2:int) : Boolean;
      
      function a_2504(param1:Object) : Boolean;
      
      function a_2505(param1:Object) : Boolean;
      
      function a_2506(param1:int) : Boolean;
      
      function a_2351(param1:int, param2:String, param3:String) : Boolean;
      
      function SendTalkInRoom(param1:int, param2:String) : Boolean;
      
      function SendTalkOnTable(param1:int, param2:String) : Boolean;
      
      function SendTalkTransferMessage(param1:int, param2:String) : Boolean;
      
      function RequestUseSpeaker(param1:String, param2:int = 0) : Boolean;
      
      function a_2507(param1:Dictionary) : Boolean;
      
      function a_2508() : Boolean;
      
      function RequsetRenewCard(param1:int, param2:int, param3:int, param4:int) : Boolean;
      
      function a_2509(param1:int) : void;
      
      function a_2510(param1:int) : void;
      
      function a_2511(param1:int, param2:int = 1) : void;
      
      function a_2512(param1:int) : void;
      
      function RequestTransferClientLog(param1:int, param2:String) : void;
      
      function a_2397(param1:int, param2:int) : void;
      
      function RequestUpdateShowCardSetUp(param1:int) : void;
      
      function a_2379(param1:int, param2:Object) : void;
      
      function RequestDelFriend(param1:int) : void;
      
      function UseSkillBook(param1:int, param2:int) : void;
      
      function a_2514(param1:int, param2:int) : void;
      
      function a_2515(param1:int, param2:int = 0) : void;
      
      function a_2516(param1:Object) : void;
      
      function RequestMarginListData(param1:Object) : Boolean;
      
      function RequestMarginReverseRegister(param1:Object) : Boolean;
      
      function RequestMarginRegisterFriend(param1:Object) : Boolean;
      
      function RequestMarginPlayerByUin(param1:Object) : Boolean;
      
      function RequestMarginRegistAdvert(param1:Object) : Boolean;
      
      function RequestMarginModifyAdvert(param1:Object) : Boolean;
      
      function RequestMarginStar(param1:Object) : Boolean;
      
      function RequestMarginSearch(param1:Object) : Boolean;
      
      function sendMatchGameData(param1:int, param2:int, param3:ByteArray) : void;
      
      function RequestChangeName(param1:Object) : void;
      
      function RequestUseCardSlotPackage(param1:Object) : void;
      
      function RequestOpenCardSlotPackage(param1:Object) : void;
      
      function RequestSendVow(param1:Object) : void;
      
      function RequestGetVowNews(param1:Object) : void;
      
      function a_2517(param1:int, param2:int) : void;
      
      function RequestBuyMiShiUseNum(param1:int) : Boolean;
      
      function RequestChangeGuideData(param1:String) : Boolean;
   }
}

