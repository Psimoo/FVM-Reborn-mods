package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2961 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iRoomID:int;
      
      public var m_nTableCount:int;
      
      public var m_arrTableInfo:Array;
      
      public var m_nPlayerCount:int;
      
      public var m_arrPlayerInfo:Array;
      
      public var m_szReasonMessage:String;
      
      private var stTableInfo:a_2963;
      
      private var stCPlayerInfo:a_2911;
      
      public function a_2961()
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
         var tag:a_2963 = null;
         var detail:a_2911 = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iRoomID = a_2664.decode_int32(byte_array);
         if(this.m_nResultID == 0)
         {
            this.m_nTableCount = a_2664.decode_int16(byte_array);
            this.m_arrTableInfo = [];
            index = 0;
            for(index = 0; index < this.m_nTableCount; index++)
            {
               tag = new a_2963();
               tag.decode(byte_array,decode_length);
               this.m_arrTableInfo.push(tag);
            }
            this.m_arrPlayerInfo = [];
            this.m_nPlayerCount = a_2664.decode_int16(byte_array);
            for(index = 0; index < this.m_nPlayerCount; index++)
            {
               detail = new a_2911();
               detail.decode(byte_array,decode_length);
               this.m_arrPlayerInfo.push(detail);
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

