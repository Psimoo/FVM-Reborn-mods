package com.aurora.ui.maogoutd.game.Util
{
   import com.adobe.utils.RandomSeed;
   
   public class BattleRandomUtil
   {
      
      public function BattleRandomUtil()
      {
         super();
      }
      
      public static function ShuffleArray(arr:Array, randomSeed:RandomSeed) : Array
      {
         var j:int = 0;
         var temp:* = undefined;
         var len:int = int(arr.length);
         var shuffled:Array = arr.slice();
         for(var i:* = int(len - 1); i > 0; i--)
         {
            j = int(randomSeed.nextInt(i + 1));
            temp = shuffled[i];
            shuffled[i] = shuffled[j];
            shuffled[j] = temp;
         }
         return shuffled;
      }
   }
}

