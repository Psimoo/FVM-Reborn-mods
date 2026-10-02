package com.aurora.ui.maogoutd.component.dialog
{
   import flash.display.DisplayObjectContainer;
   import flash.events.IEventDispatcher;
   
   public interface IDialog extends IEventDispatcher
   {
      
      function set content(param1:*) : void;
      
      function get content() : AbstractContent;
      
      function set container(param1:DisplayObjectContainer) : void;
      
      function get container() : DisplayObjectContainer;
      
      function showTip(param1:DisplayObjectContainer, param2:String = "", param3:Boolean = true, param4:Boolean = true, param5:Boolean = true, param6:Boolean = true, param7:int = -1, param8:* = null) : void;
      
      function hideTip(param1:Boolean = false) : void;
      
      function set g_tempValue(param1:Object) : void;
      
      function get g_tempValue() : Object;
      
      function get parent() : DisplayObjectContainer;
   }
}

