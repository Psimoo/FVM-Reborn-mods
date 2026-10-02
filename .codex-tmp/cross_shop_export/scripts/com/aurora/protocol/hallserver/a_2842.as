package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2842 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iTime:int;
      
      public var m_iPlayerID:int;
      
      public var m_iHallServerVersion:int;
      
      public var m_szReasonMsg:String;
      
      public function a_2842()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = null;
         if(this.m_nResultID == 0)
         {
            propertyArray = [["m_nResultID","int16"],["m_iPlayerID","int32"],["m_iTime","int32"],["m_iHallServerVersion","int32"]];
         }
         else
         {
            propertyArray = [["m_nResultID","int16"],["m_szReasonMsg","string",2048]];
         }
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         if(this.m_nResultID == 0)
         {
            this.m_iPlayerID = a_2664.decode_int32(byte_array);
            this.m_iTime = a_2664.decode_int32(byte_array);
            this.m_iHallServerVersion = a_2664.decode_int32(byte_array);
         }
         else
         {
            this.m_szReasonMsg = a_2664.decode_string(byte_array,2048);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

