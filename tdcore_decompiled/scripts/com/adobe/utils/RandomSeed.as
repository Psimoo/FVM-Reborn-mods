package com.adobe.utils
{
   import flash.utils.ByteArray;
   
   public class RandomSeed
   {
      
      private static const ADDEND:uint = 11;
      
      private static const MULTIPLIER_HIGH:uint = 5;
      
      private static const MULTIPLIER_MID:uint = 57068;
      
      private static const MULTIPLIER_LOW:uint = 58989;
      
      private static var seedExtra:uint = 2353648897;
      
      private var seedHigh:uint;
      
      private var seedLow:uint;
      
      private var seedMid:uint;
      
      public function RandomSeed(high:uint = 2147483648, low:uint = 0)
      {
         var bytes:ByteArray = null;
         super();
         if(high == 2147483648 && low == 0)
         {
            bytes = new ByteArray();
            bytes.writeDouble(new Date().time);
            bytes.position = 0;
            high = bytes.readUnsignedInt() + seedExtra;
            low = bytes.readUnsignedInt() + (high >>> 16);
            ++seedExtra;
         }
         this.setSeed(high,low);
      }
      
      public function setSeed(high:uint, low:uint) : void
      {
         this.seedHigh = high & 0xFFFF ^ MULTIPLIER_HIGH;
         this.seedMid = low >> 16 & 0xFFFF ^ MULTIPLIER_MID;
         this.seedLow = low & 0xFFFF ^ MULTIPLIER_LOW;
      }
      
      private function next(max:uint) : uint
      {
         var v2:Number = this.seedLow * MULTIPLIER_HIGH + this.seedMid * MULTIPLIER_MID + this.seedHigh * MULTIPLIER_LOW;
         var v3:Number = this.seedLow * MULTIPLIER_MID;
         var v4:Number = this.seedLow * MULTIPLIER_LOW;
         v2 += v3 >>> 16;
         v3 &= 65535;
         v3 += this.seedMid * MULTIPLIER_LOW;
         v2 += v3 >>> 16;
         v3 &= 65535;
         v3 += v4 >>> 16;
         v2 += v3 >>> 16;
         v4 &= 65535;
         v3 &= 65535;
         v2 &= 65535;
         v4 += ADDEND;
         v3 += v4 >>> 16;
         v2 += v3 >>> 16;
         v4 &= 65535;
         v3 &= 65535;
         v2 &= 65535;
         this.seedLow = v4;
         this.seedMid = v3;
         this.seedHigh = v2;
         if(max == 0)
         {
            return 0;
         }
         return (v2 << 16 | v3) >>> 32 - max;
      }
      
      public function nextInt(max:int) : uint
      {
         var v2:Number = NaN;
         var v3:Number = NaN;
         if(max == 0 || (max & 0x80000000) != 0)
         {
            throw new Error();
         }
         if((max & -max) == max)
         {
            v2 = 0;
            if((max & 0xFFFF0000) != 0)
            {
               v2 += 16;
            }
            if((max & 0xFF00FF00) != 0)
            {
               v2 += 8;
            }
            if((max & 0xF0F0F0F0) != 0)
            {
               v2 += 4;
            }
            if((max & 0xCCCCCCCC) != 0)
            {
               v2 += 2;
            }
            if((max & 0xAAAAAAAA) != 0)
            {
               v2 += 1;
            }
            return this.next(v2);
         }
         do
         {
            v2 = this.next(31);
            v3 = v2 % max;
         }
         while(v2 - v3 + max - 1 < 0);
         return v3;
      }
   }
}

