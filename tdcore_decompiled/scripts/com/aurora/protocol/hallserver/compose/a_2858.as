package com.aurora.protocol.hallserver.compose
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.protocol.hallserver.a_2738;
   import flash.utils.ByteArray;
   
   public class a_2858 implements CMessageBody
   {
      
      public var m_iSrcUin:int;
      
      public var m_iComposeID:int;
      
      public var m_nComposeMaterialCount:int;
      
      public var m_arrComposeMaterial:Array;
      
      public var m_nAssMaterialCount:int;
      
      public var m_arrAssMaterial:Array;
      
      public var m_nDisableConsortiaExtra:int;
      
      private var stCComposeItemBase:a_2738;
      
      public function a_2858()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var i:int = 0;
         a_2664.encode_int32(byte_array,this.m_iSrcUin);
         a_2664.encode_int32(byte_array,this.m_iComposeID);
         a_2664.encode_int16(byte_array,this.m_nComposeMaterialCount);
         for(i = 0; i < this.m_nComposeMaterialCount; i++)
         {
            a_2738(this.m_arrComposeMaterial[i]).encode(byte_array,encode_length);
         }
         a_2664.encode_int16(byte_array,this.m_nAssMaterialCount);
         for(i = 0; i < this.m_nAssMaterialCount; i++)
         {
            a_2738(this.m_arrAssMaterial[i]).encode(byte_array,encode_length);
         }
         a_2664.encode_int16(byte_array,this.m_nDisableConsortiaExtra);
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

