package com.aurora.protocol.hallserver.consortia
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2777 implements CMessageBody
   {
      
      private const MAX_ESTABLISHMENT_SETTING_COUNT:int = 9;
      
      public var m_iConsortiaID:int;
      
      public var m_iEstablishment:int;
      
      public var m_nSettingCount:uint;
      
      public var m_arySettings:Array;
      
      public function a_2777()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iConsortiaID);
         a_2664.encode_int32(byte_array,this.m_iEstablishment);
         if(this.m_nSettingCount > this.MAX_ESTABLISHMENT_SETTING_COUNT)
         {
            this.m_nSettingCount = this.MAX_ESTABLISHMENT_SETTING_COUNT;
         }
         a_2664.encode_uint16(byte_array,this.m_nSettingCount);
         for(var i:int = 0; i < this.m_nSettingCount; i++)
         {
            a_2664.encode_int32(byte_array,this.m_arySettings[i]);
         }
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

