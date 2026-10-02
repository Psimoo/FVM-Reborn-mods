package com.aurora.ui.maogoutd.inviteCommon
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   
   public interface IInviteCommonUI
   {
      
      function ShowUserCommonListPanel(param1:String, param2:Boolean = true, param3:int = -1, param4:int = 1, param5:int = -1, param6:int = -1) : void;
      
      function GetParent() : DisplayObjectContainer;
      
      function get myself() : DisplayObject;
      
      function RemoveFromParent() : void;
   }
}

