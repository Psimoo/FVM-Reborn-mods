package com.aurora.ui.maogoutd.game
{
   import flash.display.Sprite;
   
   public class BattleGreenScoreNumberView extends Sprite
   {
      
      private var a_901:int;
      
      private var a_902:int;
      
      private var a_903:Number = 1;
      
      private var a_904:Array = [];
      
      private var a_905:uint = 0;
      
      public function BattleGreenScoreNumberView()
      {
         super();
         for(var i:int = 0; i < 5; i++)
         {
            this.a_904[i] = new GreenScoreNumberMovie();
         }
      }
      
      public function a_1797(initNumber:uint) : Boolean
      {
         if(initNumber > 99999)
         {
            trace("数字太大, 溢出!");
            return false;
         }
         this.a_905 = initNumber;
         this.a_3032(this.a_905);
         return true;
      }
      
      private function a_3032(iNum:int) : void
      {
         var numString:GreenScoreNumberMovie = null;
         var numStr:String = iNum.toString();
         this.a_901 = 0;
         this.a_902 = 0;
         this.Reset();
         for(var i:int = 0; i < numStr.length; i++)
         {
            numString = this.a_904[i] as GreenScoreNumberMovie;
            numString.gotoAndStop(1 + parseInt(numStr.charAt(i)));
            numString.x = this.a_901;
            numString.y = this.a_902;
            addChildAt(numString,0);
            this.a_901 += numString.width;
         }
      }
      
      private function Reset() : void
      {
         var numStr:GreenScoreNumberMovie = null;
         for each(numStr in this.a_904)
         {
            if(contains(numStr))
            {
               removeChild(numStr);
            }
         }
      }
   }
}

