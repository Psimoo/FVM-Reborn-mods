package com.aurora.ui.maogoutd
{
   import a_4753.b_150;
   import com.aurora.protocol.game.maogoutd.CNotifyEntityStateChange;
   import com.aurora.protocol.game.maogoutd.CNotifyGameStep;
   import com.aurora.protocol.game.maogoutd.a_2694;
   import com.aurora.protocol.game.maogoutd.a_2695;
   import com.aurora.protocol.game.maogoutd.a_2696;
   import com.aurora.protocol.game.maogoutd.a_2702;
   import com.aurora.protocol.game.maogoutd.a_2703;
   import com.aurora.protocol.game.maogoutd.a_2704;
   import com.aurora.protocol.game.maogoutd.a_2707;
   import com.aurora.protocol.game.maogoutd.a_2708;
   import com.aurora.ui.maogoutd.diy.myEditor.data.MouseLinesData;
   import com.aurora.ui.maogoutd.game.GameCardView;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4269;
   import flash.text.TextField;
   import flash.utils.ByteArray;
   
   public interface b_147
   {
      
      function a_3600(param1:b_150) : Boolean;
      
      function a_3601() : uint;
      
      function a_3602() : uint;
      
      function a_3603(param1:Array, param2:Array) : Boolean;
      
      function a_3604(param1:Array, param2:Array) : Boolean;
      
      function a_3605(param1:Array, param2:Array) : Boolean;
      
      function a_3606(param1:Array, param2:Array) : Boolean;
      
      function a_3607(param1:Object) : Boolean;
      
      function SetDIYInfo(param1:Object, param2:int) : void;
      
      function a_3435(param1:a_2695) : Boolean;
      
      function OnGameStepLock(param1:CNotifyGameStep) : Boolean;
      
      function a_3608(param1:Vector.<a_4269>, param2:int, param3:int, param4:int, param5:int, param6:MouseLinesData = null) : Boolean;
      
      function a_555(param1:a_2704) : Boolean;
      
      function a_3436(param1:a_2708) : Boolean;
      
      function a_3610(param1:a_2703) : Boolean;
      
      function PlayerEntityStateChange(param1:CNotifyEntityStateChange) : Boolean;
      
      function a_558(param1:a_2702) : Boolean;
      
      function a_3612(param1:a_2707) : Boolean;
      
      function a_3613(param1:a_2696) : Boolean;
      
      function a_1847(param1:a_2694) : Boolean;
      
      function a_3477(param1:int) : Boolean;
      
      function OtherPlayerDataNotify(param1:ByteArray) : Boolean;
      
      function MyAvatarInfoText() : TextField;
      
      function a_3476(param1:uint) : GameCardView;
      
      function GetGameCardViewByIndex(param1:int) : GameCardView;
   }
}

