package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   
   public interface IWeaponSkill
   {
      
      function CreateWeaponSkill() : IWeaponSkill;
      
      function a_4330() : void;
      
      function GetSkill(param1:uint) : BaseSkill;
      
      function OnTimeInterval(param1:uint) : void;
      
      function a_2088(param1:Array, param2:Array, param3:int) : void;
      
      function a_2098() : void;
      
      function SetOwnBattleFieldView(param1:BattleFieldView) : void;
      
      function SetMyAvater(param1:a_3924) : void;
      
      function ShowSkillReady() : void;
   }
}

