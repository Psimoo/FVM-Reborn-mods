package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2942 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iRoomID:int;
      
      public var m_nTableCount:int;
      
      public var m_arrTableInfo:Array;
      
      public var m_szReasonMsg:String;
      
      private var a_873:CTableInfo;
      
      public function a_2942()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nResultID","int16"],["m_iRoomID","int32"]];
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_nTableCount","int16"]);
            propertyArray.push(["m_arrTableInfo",["object","com.aurora.protocol.logicserver.CTableInfo","nosize"]]);
         }
         else
         {
            propertyArray.push(["m_szReasonMsg","string",2048]);
         }
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var stCTableInfo:CTableInfo = null;
         var i:int = 0;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iRoomID = a_2664.decode_int32(byte_array);
         if(this.m_nResultID == 0)
         {
            this.m_nTableCount = a_2664.decode_int16(byte_array);
            this.m_arrTableInfo = [];
            for(i = 0; i < this.m_nTableCount; i++)
            {
               stCTableInfo = new CTableInfo();
               stCTableInfo.decode(byte_array,decode_length);
               this.m_arrTableInfo.push(stCTableInfo);
            }
         }
         else
         {
            this.m_szReasonMsg = a_2664.decode_string(byte_array,2048);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

