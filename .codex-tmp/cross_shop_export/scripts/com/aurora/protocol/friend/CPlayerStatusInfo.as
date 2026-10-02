package com.aurora.protocol.friend
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CPlayerStatusInfo implements CMessageBody
   {
      
      public var m_nUin:int;
      
      public var m_szAccount:String;
      
      public var m_byClassCount:int;
      
      public var m_stStateData:Array;
      
      private var stStateData:CStateData;
      
      public function CPlayerStatusInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nUin","int32"],["m_szAccount","string",32],["m_byClassCount","int8"],["m_stStateData",["object","com.aurora.protocol.friend.CStateData"]]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var stateData:CStateData = null;
         var size:int = a_2664.decode_int16(byte_array);
         this.m_nUin = a_2664.decode_int32(byte_array);
         this.m_szAccount = a_2664.decode_string(byte_array,32);
         this.m_byClassCount = a_2664.decode_int8(byte_array);
         this.m_stStateData = [];
         for(var index:int = 0; index < this.m_byClassCount; index++)
         {
            stateData = new CStateData();
            stateData.decode(byte_array,decode_length);
            this.m_stStateData.push(stateData);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

