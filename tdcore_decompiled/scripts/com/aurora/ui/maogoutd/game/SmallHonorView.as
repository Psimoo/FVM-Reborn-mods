package com.aurora.ui.maogoutd.game
{
   import flash.display.Sprite;
   
   public class SmallHonorView extends Sprite
   {
      
      private var a_901:int;
      
      private var a_902:int;
      
      private var a_903:Number = 1;
      
      private var a_904:Array = [];
      
      private var a_905:uint = 0;
      
      public function SmallHonorView()
      {
         super();
         for(var i:int = 0; i < 2; i++)
         {
            this.a_904[i] = new HonorSmallNumberMovie();
         }
      }
      
      public function a_1797(initNumber:uint) : Boolean
      {
         if(initNumber > 99)
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
         var numString:HonorSmallNumberMovie = null;
         var numStr:String = iNum.toString();
         this.a_901 = width * 0.5 - 6 * numStr.length;
         this.a_902 = height * 0.5 - 10;
         this.Reset();
         for(var i:int = 0; i < numStr.length; i++)
         {
            numString = this.a_904[i] as HonorSmallNumberMovie;
            numString.gotoAndStop(1 + parseInt(numStr.charAt(i)));
            numString.x = this.a_901 + 10 * i;
            numString.y = this.a_902;
            addChild(numString);
         }
      }
      
      private function Reset() : void
      {
         var numStr:HonorSmallNumberMovie = null;
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

