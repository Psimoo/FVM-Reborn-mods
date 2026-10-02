package com.aurora.protocol.hallserver.marriage
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.hallserver.CRequestBase;
   import flash.utils.ByteArray;
   
   public class CRequestMarriageCertificateOperation extends CRequestBase
   {
      
      public var m_iOperateType:int;
      
      public var m_nValueNum:int;
      
      public var m_arrValue:Array;
      
      public var m_strInfo:String;
      
      public function CRequestMarriageCertificateOperation()
      {
         super();
      }
      
      override public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,m_iUin);
         a_2664.encode_int32(byte_array,this.m_iOperateType);
         this.m_nValueNum = this.m_arrValue.length;
         a_2664.encode_int16(byte_array,this.m_nValueNum);
         for(var i:int = 0; i < this.m_nValueNum; i++)
         {
            a_2664.encode_int32(byte_array,this.m_arrValue[i]);
         }
         a_2664.encode_string(byte_array,this.m_strInfo,2048);
         return true;
      }
   }
}

