package com.aurora.protocol.hallserver.consortia
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2798 implements CMessageBody
   {
      
      public var m_nResult:int;
      
      public var m_iUIN:int;
      
      public var m_stJoinInfo:a_2787;
      
      public var m_stConsortiaInfo:ConsortiaInfo;
      
      public var m_iUserFlag:int;
      
      public var m_nCount:int;
      
      public var m_arrApplyInfo:Array;
      
      public var m_iMaxConsortiaID:int;
      
      public var m_szReasonMessage:String;
      
      public function a_2798()
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
         var obj:Object = null;
         this.m_nResult = a_2664.decode_int16(byte_array);
         if(0 == this.m_nResult)
         {
            this.m_iUIN = a_2664.decode_int32(byte_array);
            this.m_stJoinInfo = new a_2787();
            this.m_stJoinInfo.decode(byte_array,decode_length);
            if(0 != this.m_stJoinInfo.m_iID)
            {
               this.m_stConsortiaInfo = new ConsortiaInfo();
               this.m_stConsortiaInfo.decode(byte_array,decode_length);
               this.m_iUserFlag = a_2664.decode_int32(byte_array);
            }
            else
            {
               this.m_nCount = a_2664.decode_int16(byte_array);
               this.m_arrApplyInfo = new Array();
               for(i = 0; i < this.m_nCount; i++)
               {
                  obj = {};
                  obj.m_iConsortiaID = a_2664.decode_int32(byte_array);
                  obj.m_iTime = a_2664.decode_int32(byte_array);
                  obj.m_cFlag = a_2664.decode_int8(byte_array);
                  this.m_arrApplyInfo.push(obj);
               }
            }
            this.m_iMaxConsortiaID = a_2664.decode_int32(byte_array);
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

