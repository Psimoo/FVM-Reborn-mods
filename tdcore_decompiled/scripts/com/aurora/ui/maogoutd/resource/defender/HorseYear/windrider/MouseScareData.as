package com.aurora.ui.maogoutd.resource.defender.HorseYear.windrider
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.Bitmap;
   
   public class MouseScareData
   {
      
      public var intruder:a_4206;
      
      public var targetGrid:a_3491;
      
      public var bmp:Bitmap;
      
      public var goback:Number;
      
      public var addFunc:Function;
      
      public var battleField:BattleFieldView;
      
      public var callBack:Function;
      
      public function MouseScareData(intruder:a_4206, targetGrid:a_3491, bmp:Bitmap, goback:Number, addFunc:Function, battleField:BattleFieldView, callBack:Function)
      {
         super();
         this.intruder = intruder;
         this.targetGrid = targetGrid;
         this.bmp = bmp;
         this.goback = goback;
         this.addFunc = addFunc;
         this.battleField = battleField;
         this.callBack = callBack;
      }
   }
}

