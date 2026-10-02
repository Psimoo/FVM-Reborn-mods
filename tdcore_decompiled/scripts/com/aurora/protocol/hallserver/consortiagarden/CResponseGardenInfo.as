package com.aurora.protocol.hallserver.consortiagarden
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseGardenInfo implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iConsID:int;
      
      public var m_czConsortiaName:String;
      
      public var m_iFounderUin:int;
      
      public var m_iLevel:int;
      
      public var m_iTreeType:int;
      
      public var m_iTreeExp:int;
      
      public var m_iTodayExp:int;
      
      public var m_iRipeTime:int;
      
      public var m_iSelfFruitNum:int;
      
      public var m_iExtraFruitNum:int;
      
      public var m_iStealNum:int;
      
      public var m_iIsWater:int;
      
      public var m_iIsPick:int;
      
      public function CResponseGardenInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iConsID = a_2664.decode_int32(byte_array);
         this.m_czConsortiaName = a_2664.decode_string(byte_array,32);
         this.m_iFounderUin = a_2664.decode_int32(byte_array);
         this.m_iLevel = a_2664.decode_int32(byte_array);
         this.m_iTreeType = a_2664.decode_int8(byte_array);
         this.m_iTreeExp = a_2664.decode_int32(byte_array);
         this.m_iTodayExp = a_2664.decode_int32(byte_array);
         this.m_iRipeTime = a_2664.decode_int32(byte_array);
         this.m_iSelfFruitNum = a_2664.decode_int16(byte_array);
         this.m_iExtraFruitNum = a_2664.decode_int16(byte_array);
         this.m_iStealNum = a_2664.decode_int16(byte_array);
         this.m_iIsWater = a_2664.decode_int8(byte_array);
         this.m_iIsPick = a_2664.decode_int8(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

