package com.aurora.protocol.hallserver.consortia
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2784 implements CMessageBody
   {
      
      public var m_iID:int;
      
      public var m_iLevel:int;
      
      public var m_iLastModify:int;
      
      public var m_iSign:int;
      
      public var m_nSettingCount:int;
      
      public var m_arySettings:Array;
      
      public function a_2784()
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
         this.m_iID = a_2664.decode_int32(byte_array);
         this.m_iLevel = a_2664.decode_int32(byte_array);
         this.m_iLastModify = a_2664.decode_int32(byte_array);
         this.m_iSign = a_2664.decode_int32(byte_array);
         this.m_nSettingCount = a_2664.decode_int16(byte_array);
         this.m_arySettings = new Array();
         for(var i:int = 0; i < this.m_nSettingCount; i++)
         {
            this.m_arySettings.push(a_2664.decode_int32(byte_array));
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

