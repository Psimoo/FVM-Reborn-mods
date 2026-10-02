package com.aurora.protocol.common
{
   import flash.utils.ByteArray;
   
   public interface CMessageBody
   {
      
      function encode(param1:ByteArray, param2:int) : Boolean;
      
      function decode(param1:ByteArray, param2:int) : Boolean;
      
      function dump() : Boolean;
   }
}

