package com.aurora.protocol.hallserver.consortiacarbon
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseConsbenPlayerRank implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iConsID:int;
      
      public var m_iBenID:int;
      
      public var m_iFrom:int;
      
      public var m_iNum:int;
      
      public var m_stConsbenPlayer:Array;
      
      public var m_iTotalNum:int;
      
      public function CResponseConsbenPlayerRank()
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
         var j:int = 0;
         var perobj:Object = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iConsID = a_2664.decode_int32(byte_array);
         this.m_iBenID = a_2664.decode_int32(byte_array);
         this.m_iFrom = a_2664.decode_int32(byte_array);
         this.m_iNum = a_2664.decode_int32(byte_array);
         this.m_stConsbenPlayer = [];
         for(var i:int = 0; i < this.m_iNum; i++)
         {
            obj = {};
            obj.m_iRank = a_2664.decode_int32(byte_array);
            obj.m_iUin = a_2664.decode_int32(byte_array);
            obj.m_szName = a_2664.decode_string(byte_array,32);
            obj.m_iLevel = a_2664.decode_uint64(byte_array);
            obj.m_iScore = a_2664.decode_int32(byte_array);
            obj.m_iCardInfoCount = a_2664.decode_int32(byte_array);
            obj.m_astCardInfo = new Array();
            obj.m_astCardInfo = [];
            for(j = 0; j < obj.m_iCardInfoCount; j++)
            {
               perobj = {};
               perobj.m_iCardID = a_2664.decode_int32(byte_array);
               perobj.m_iCardLv = a_2664.decode_int8(byte_array);
               perobj.m_iCardGradeLv = a_2664.decode_int8(byte_array);
               obj.m_astCardInfo.push(perobj);
            }
            this.m_stConsbenPlayer.push(obj);
         }
         this.m_iTotalNum = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

