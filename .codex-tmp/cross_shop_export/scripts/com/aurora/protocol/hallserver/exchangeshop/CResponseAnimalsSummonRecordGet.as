package com.aurora.protocol.hallserver.exchangeshop
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseAnimalsSummonRecordGet implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iGroup:int;
      
      public var m_iRecordCount:int;
      
      public var m_astSummonRecord:Array;
      
      public function CResponseAnimalsSummonRecordGet()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var obj:Object = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iGroup = a_2664.decode_int32(byte_array);
         this.m_iRecordCount = a_2664.decode_int16(byte_array);
         this.m_astSummonRecord = [];
         for(var i:int = 0; i < this.m_iRecordCount; i++)
         {
            obj = {};
            obj.m_iID = a_2664.decode_int32(byte_array);
            obj.m_iGroup = a_2664.decode_int32(byte_array);
            obj.m_iNum = a_2664.decode_int32(byte_array);
            this.m_astSummonRecord.push(obj);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

