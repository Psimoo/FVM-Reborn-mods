package com.aurora.protocol.hallserver.newyearactivity
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseNewYearTurnTable implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iCount:int;
      
      public var m_ItemList:Array;
      
      public function CResponseNewYearTurnTable()
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
         this.m_iCount = a_2664.decode_int16(byte_array);
         this.m_ItemList = [];
         for(var i:int = 0; i < this.m_iCount; i++)
         {
            obj = {};
            obj.m_iPoolID = a_2664.decode_int32(byte_array);
            obj.m_iID = a_2664.decode_int32(byte_array);
            this.m_ItemList.push(obj);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

