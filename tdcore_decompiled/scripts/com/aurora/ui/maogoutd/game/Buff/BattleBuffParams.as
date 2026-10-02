package com.aurora.ui.maogoutd.game.Buff
{
   public class BattleBuffParams
   {
      
      public var x:int = 0;
      
      public var y:int = 0;
      
      public var offsetType:int = 0;
      
      public var endCallBack:Function;
      
      public var effectClass:Class;
      
      public var gameMoveClipClass:Class;
      
      public var startAnim:int = -1;
      
      public var loopAnim:int = -1;
      
      public var endAnim:int = -1;
      
      public function BattleBuffParams()
      {
         super();
      }
   }
}

