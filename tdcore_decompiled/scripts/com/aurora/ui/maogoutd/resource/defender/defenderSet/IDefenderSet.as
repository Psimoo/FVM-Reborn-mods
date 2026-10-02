package com.aurora.ui.maogoutd.resource.defender.defenderSet
{
   public interface IDefenderSet
   {
      
      function AddDefender(param1:int, param2:int) : Boolean;
      
      function IsFull() : Boolean;
      
      function IsUpgradeID(param1:int) : Boolean;
   }
}

