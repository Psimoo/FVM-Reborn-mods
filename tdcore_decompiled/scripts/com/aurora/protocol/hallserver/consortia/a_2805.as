package com.aurora.protocol.hallserver.consortia
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2805 implements CMessageBody
   {
      
      private const MAX_ESTABLISHMENT_SETTING_COUNT:int = 9;
      
      public var m_nResult:int;
      
      public var m_iConsortiaID:int;
      
      public var m_iEstablishment:int;
      
      public var m_nSettingCount:uint;
      
      public var m_arySettings:Array;
      
      public var m_szReasonMessage:String;
      
      public function a_2805()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var i:int = 0;
         this.m_nResult = a_2664.decode_int16(byte_array);
         if(0 == this.m_nResult)
         {
            this.m_iConsortiaID = a_2664.decode_int32(byte_array);
            this.m_iEstablishment = a_2664.decode_int32(byte_array);
            this.m_nSettingCount = a_2664.decode_uint16(byte_array);
            if(this.m_nSettingCount > this.MAX_ESTABLISHMENT_SETTING_COUNT)
            {
               this.m_nSettingCount = this.MAX_ESTABLISHMENT_SETTING_COUNT;
            }
            this.m_arySettings = new Array();
            for(i = 0; i < this.m_nSettingCount; i++)
            {
               this.m_arySettings.push(a_2664.decode_int32(byte_array));
            }
         }
         else
         {
            this.m_szReasonMessage = a_2664.decode_string(byte_array,4096);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

