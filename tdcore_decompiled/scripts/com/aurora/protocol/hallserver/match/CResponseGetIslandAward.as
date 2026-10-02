package com.aurora.protocol.hallserver.match
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseGetIslandAward implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iMapID:int;
      
      public var m_iConsortiaID:int;
      
      public var m_iType:int;
      
      public var m_iConsortiaName:String;
      
      public var m_iCount:int;
      
      public var m_arrAwardInfo:Array;
      
      public function CResponseGetIslandAward()
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
         var iMapID:int = 0;
         var iConsortiaID:int = 0;
         var iItemID:int = 0;
         var iNum:int = 0;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iMapID = a_2664.decode_int32(byte_array);
         this.m_iConsortiaID = a_2664.decode_int32(byte_array);
         this.m_iType = a_2664.decode_int32(byte_array);
         this.m_iConsortiaName = a_2664.decode_string(byte_array,32);
         this.m_iCount = a_2664.decode_int32(byte_array);
         this.m_arrAwardInfo = [];
         for(var i:int = 0; i < this.m_iCount; i++)
         {
            obj = {};
            iMapID = a_2664.decode_int32(byte_array);
            iConsortiaID = a_2664.decode_int32(byte_array);
            iItemID = a_2664.decode_int32(byte_array);
            iNum = a_2664.decode_int32(byte_array);
            obj.m_iConsortiaID = iConsortiaID;
            obj.m_iMapID = iMapID;
            obj.m_iItemID = iItemID;
            obj.m_iNum = iNum;
            this.m_arrAwardInfo.push(obj);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

