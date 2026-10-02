package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CCSNotifyNewSystemMessage implements CMessageBody
   {
      
      public var m_nCount:int;
      
      public var m_SystemMessage:Array;
      
      public function CCSNotifyNewSystemMessage()
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
         var vo:Object = null;
         var tempArr:Array = null;
         var holderString:String = null;
         var j:int = 0;
         this.m_nCount = a_2664.decode_int16(byte_array);
         this.m_SystemMessage = new Array();
         if(this.m_nCount > 0)
         {
            for(i = 0; i < this.m_nCount; i++)
            {
               vo = new CSystemMessage();
               vo.FirLevel = a_2664.decode_int8(byte_array);
               vo.SecLevel = a_2664.decode_int32(byte_array);
               vo.m_nMessageSize = a_2664.decode_int16(byte_array);
               vo.m_szSystemMessage = new ByteArray();
               a_2664.decode_memory(byte_array,vo.m_szSystemMessage,vo.m_nMessageSize);
               vo.m_szSystemMessage.position = 0;
               vo.m_szMessage = vo.m_szSystemMessage.readMultiByte(vo.m_szSystemMessage.bytesAvailable,"utf-8");
               if(vo.FirLevel == 0 && vo.SecLevel == 0)
               {
                  this.m_SystemMessage.push(vo.m_szMessage);
               }
               else
               {
                  tempArr = vo.m_szMessage.split("|");
                  vo.holder = new Array();
                  vo.repString = new Array();
                  for(j = 0; j < tempArr.length; j++)
                  {
                     holderString = "%" + tempArr[j].split(":")[0] + "%";
                     vo.holder.push(holderString);
                     vo.repString.push(tempArr[j].split(":")[1]);
                  }
                  this.m_SystemMessage.push(vo);
               }
            }
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

