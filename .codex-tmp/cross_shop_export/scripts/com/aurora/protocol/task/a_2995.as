package com.aurora.protocol.task
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2995 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_unTaskInfoSetsSize:int;
      
      public var m_arrTaskInfoSets:Array;
      
      public var m_szReasonMessage:String;
      
      private var a_883:a_3001;
      
      public function a_2995()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var index:int = 0;
         var task:a_3001 = null;
         var propertyArray:Array = [];
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         if(this.m_nResultID == 0)
         {
            this.m_unTaskInfoSetsSize = a_2664.decode_int16(byte_array);
            this.m_arrTaskInfoSets = [];
            for(index = 0; index < this.m_unTaskInfoSetsSize; index++)
            {
               task = new a_3001();
               task.decode(byte_array,decode_length);
               this.m_arrTaskInfoSets.push(task);
            }
         }
         else
         {
            this.m_szReasonMessage = a_2664.decode_string(byte_array,2048);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

