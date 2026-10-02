package com.aurora.protocol.authen
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2661 implements CMessageBody
   {
      
      public var account:String;
      
      public var m_nUserType:uint;
      
      public var passwordMd5Key:ByteArray;
      
      public var sourceAppID:int;
      
      public var targetAppID:int;
      
      public var m_nMemorySize:int;
      
      public var m_szMemoryBuffer:ByteArray;
      
      public function a_2661()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["account","string",64],["m_nUserType","int16"],["passwordMd5Key","memory",16,"nosize"],["sourceAppID","int16"],["targetAppID","int16"],["m_nMemorySize","int16"],["m_szMemoryBuffer","memory",4096]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["account","string",64],["m_nUserType","int16"],["passwordMd5Key","memory",16,"nosize"],["sourceAppID","int16"],["targetAppID","int16"],["m_nMemorySize","int16"],["m_szMemoryBuffer","memory",4096]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

