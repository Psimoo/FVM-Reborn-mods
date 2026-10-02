package com.aurora.ui.maogoutd.iface
{
   public interface ITDServerList
   {
      
      function setGameChannelList(param1:Array, param2:int, param3:int, param4:Boolean = true) : void;
      
      function showChannelStatus(param1:Object) : void;
      
      function hideChannelList() : void;
   }
}

