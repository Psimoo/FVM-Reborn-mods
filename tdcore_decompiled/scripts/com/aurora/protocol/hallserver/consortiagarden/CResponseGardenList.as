package com.aurora.protocol.hallserver.consortiagarden
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseGardenList implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iFrom:int;
      
      public var m_iNum:int;
      
      public var m_astGardenInfo:Array;
      
      public var m_iTotalNum:int;
      
      public function CResponseGardenList()
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
         this.m_iFrom = a_2664.decode_int32(byte_array);
         this.m_iNum = a_2664.decode_int32(byte_array);
         this.m_astGardenInfo = [];
         for(var i:int = 0; i < this.m_iNum; i++)
         {
            obj = {};
            obj.m_iConsID = a_2664.decode_int32(byte_array);
            obj.m_czConsortiaName = a_2664.decode_string(byte_array,128);
            obj.m_iLevel = a_2664.decode_int32(byte_array);
            obj.m_iTreeType = a_2664.decode_int32(byte_array);
            obj.m_iTreeExp = a_2664.decode_int32(byte_array);
            obj.m_iExtraFruitNum = a_2664.decode_int32(byte_array);
            this.m_astGardenInfo.push(obj);
         }
         this.m_iTotalNum = a_2664.decode_int16(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

