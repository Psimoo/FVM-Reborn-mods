package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2843 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iRoleUin:int;
      
      public var m_iTimestamp:int;
      
      public var m_szReasonMessage:String;
      
      public function a_2843()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = null;
         if(this.m_nResultID == 0)
         {
            propertyArray = [["m_nResultID","int16"],["m_iRoleUin","int32"],["m_iTimestamp","int32"]];
         }
         else
         {
            propertyArray = [["m_nResultID","int16"],["m_szReasonMessage","string",2048]];
         }
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iRoleUin = a_2664.decode_int32(byte_array);
         this.m_iTimestamp = a_2664.decode_int32(byte_array);
         if(this.m_nResultID != 0)
         {
            this.m_szReasonMessage = a_2664.decode_string(byte_array,2048);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

