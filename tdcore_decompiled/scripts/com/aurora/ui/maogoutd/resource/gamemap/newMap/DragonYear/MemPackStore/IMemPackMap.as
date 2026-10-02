package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear.MemPackStore
{
   public interface IMemPackMap
   {
      
      function Remove(param1:int, param2:*) : void;
      
      function GetRandomUseGrid(param1:int) : Array;
      
      function AddBalerMouse(param1:int, param2:int, param3:int) : Boolean;
      
      function GetRandomIdx(param1:int) : int;
   }
}

