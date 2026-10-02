package com.aurora.protocol.hallserver.mail
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponsePlayerMailList implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iGroupID:int;
      
      public var m_iResultID:int;
      
      public var m_iMailCount:int;
      
      public var m_vCMail:Vector.<CMail>;
      
      public function CResponsePlayerMailList()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var stCMail:CMail = null;
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iGroupID = a_2664.decode_int32(byte_array);
         this.m_iResultID = a_2664.decode_int32(byte_array);
         this.m_iMailCount = a_2664.decode_int32(byte_array);
         if(!this.m_vCMail)
         {
            this.m_vCMail = new Vector.<CMail>();
         }
         this.m_vCMail.length = 0;
         for(var i:int = 0; i < this.m_iMailCount; i++)
         {
            stCMail = new CMail();
            stCMail.decode(byte_array,0);
            this.m_vCMail.push(stCMail);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

