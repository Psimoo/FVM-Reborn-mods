package com.aurora.protocol.hallserver.consortia
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2759 implements CMessageBody
   {
      
      public var m_iAdjust:int;
      
      public var m_iID:int;
      
      public var m_iFounderUIN:int;
      
      public var m_iChairman:int;
      
      public var m_czChairmanName:String;
      
      public var m_czConsortiaName:String;
      
      public var m_iTimestamp:int;
      
      public var m_czConsortiaEnounce:String;
      
      public var m_nMemberNum:int;
      
      public var m_iScore:int;
      
      public var m_iLevel:int;
      
      public function a_2759()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var body_size:int = a_2664.decode_int16(byte_array);
         this.m_iAdjust = a_2664.decode_int32(byte_array);
         this.m_iID = a_2664.decode_int32(byte_array);
         this.m_iFounderUIN = a_2664.decode_int32(byte_array);
         this.m_iChairman = a_2664.decode_int32(byte_array);
         this.m_czChairmanName = a_2664.decode_string(byte_array,32);
         this.m_czConsortiaName = a_2664.decode_string(byte_array,128);
         this.m_iTimestamp = a_2664.decode_int32(byte_array);
         this.m_czConsortiaEnounce = a_2664.decode_string(byte_array,1024);
         this.m_nMemberNum = a_2664.decode_int16(byte_array);
         this.m_iScore = a_2664.decode_int32(byte_array);
         this.m_iLevel = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

