package com.aurora.protocol.task
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2998 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iTaskID:int;
      
      public var m_byType:int;
      
      public var m_szReasonMessage:String;
      
      public var m_unNewTaskCount:int;
      
      public var m_szNewTaskID:Array;
      
      public function a_2998()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var index:int = 0;
         var propertyArray:Array = [];
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iTaskID = a_2664.decode_int32(byte_array);
         this.m_byType = a_2664.decode_int8(byte_array);
         if(this.m_nResultID == 0)
         {
            this.m_szNewTaskID = [];
            for(index = 0; index < this.m_unNewTaskCount; index++)
            {
               this.m_szNewTaskID.push(a_2664.decode_int32(byte_array));
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

