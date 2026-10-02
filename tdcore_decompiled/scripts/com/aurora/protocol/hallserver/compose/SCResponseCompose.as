package com.aurora.protocol.hallserver.compose
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.protocol.hallserver.a_2738;
   import com.aurora.protocol.logicserver.CCardUpdateInfoRes;
   import flash.utils.ByteArray;
   
   public class SCResponseCompose implements CMessageBody
   {
      
      public var m_nResult:int;
      
      public var m_stNewCardInfo:CCardUpdateInfoRes;
      
      public var m_iSrcUin:int;
      
      public var m_iComposeID:int;
      
      public var m_nComposeMaterialCount:int;
      
      public var m_arrComposeMaterial:Array;
      
      public var m_nAssMaterialCount:int;
      
      public var m_arrAssMaterial:Array;
      
      public var m_szReasonMessage:String;
      
      public var m_i64coin:int;
      
      public var m_cLevel:int;
      
      public var m_nDisableConsortiaExtra:int;
      
      private var stCCardUpdateInfoRes:CCardUpdateInfoRes;
      
      private var stCComposeItemBase:a_2738;
      
      public function SCResponseCompose()
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
         var temp:a_2738 = null;
         this.m_nResult = a_2664.decode_int16(byte_array);
         this.m_stNewCardInfo = new CCardUpdateInfoRes();
         var body_size:int = a_2664.decode_int16(byte_array);
         this.m_stNewCardInfo.decode(byte_array,decode_length);
         this.m_iSrcUin = a_2664.decode_int32(byte_array);
         this.m_iComposeID = a_2664.decode_int32(byte_array);
         this.m_nComposeMaterialCount = a_2664.decode_int16(byte_array);
         this.m_arrComposeMaterial = [];
         for(i = 0; i < this.m_nComposeMaterialCount; i++)
         {
            temp = new a_2738();
            temp.decode(byte_array,decode_length);
            this.m_arrComposeMaterial.push(temp);
         }
         this.m_nAssMaterialCount = a_2664.decode_int16(byte_array);
         this.m_arrAssMaterial = [];
         for(i = 0; i < this.m_nAssMaterialCount; i++)
         {
            temp = new a_2738();
            temp.decode(byte_array,decode_length);
            this.m_arrAssMaterial.push(temp);
         }
         this.m_i64coin = a_2664.decode_int64(byte_array);
         this.m_cLevel = a_2664.decode_int8(byte_array);
         this.m_nDisableConsortiaExtra = a_2664.decode_int16(byte_array);
         if(this.m_nResult != 0)
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

