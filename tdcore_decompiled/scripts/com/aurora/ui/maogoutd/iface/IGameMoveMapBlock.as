package com.aurora.ui.maogoutd.iface
{
   public interface IGameMoveMapBlock
   {
      
      function MoveStart() : void;
      
      function ReleaseMoveMap() : void;
      
      function OnTimeInterval(param1:uint) : void;
   }
}

