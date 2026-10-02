package com.aurora.ui.maogoutd
{
   import flash.display.Sprite;
   import flash.events.IEventDispatcher;
   
   public interface ITDInviteUI extends IEventDispatcher
   {
      
      function getUserListPanel(param1:int) : Sprite;
      
      function getInviteRequestPanel() : Sprite;
      
      function getInviteUserData() : Object;
      
      function setInviteData(param1:Object) : void;
      
      function getInviteData() : Object;
   }
}

