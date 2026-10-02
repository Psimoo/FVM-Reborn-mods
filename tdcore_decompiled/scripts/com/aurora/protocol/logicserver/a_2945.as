package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2945 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iPlayerID:int;
      
      public var m_nLogicServerVersion:int;
      
      public var m_nRoomSessionCount:int;
      
      public var m_arrRoomSessions:Array;
      
      public var m_szReasonMsg:String;
      
      private var stCRoomSession:CRoomSession;
      
      public function a_2945()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nResultID","int16"]];
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_iPlayerID","int32"]);
            propertyArray.push(["m_nLogicServerVersion","int16"]);
            propertyArray.push(["m_nRoomSessionCount","int16"]);
            propertyArray.push(["m_arrRoomSessions",["object","com.aurora.protocol.logicserver.CRoomSession"]]);
         }
         else
         {
            propertyArray.push(["m_szReasonMsg","string",2048]);
         }
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var stSeesion:CRoomSession = null;
         var i:int = 0;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         var propertyArray:Array = new Array();
         if(this.m_nResultID == 0)
         {
            this.m_iPlayerID = a_2664.decode_int32(byte_array);
            this.m_nLogicServerVersion = a_2664.decode_int16(byte_array);
            this.m_nRoomSessionCount = a_2664.decode_int16(byte_array);
            this.m_arrRoomSessions = [];
            for(i = 0; i < this.m_nRoomSessionCount; i++)
            {
               stSeesion = new CRoomSession();
               a_2664.decode_int16(byte_array);
               stSeesion.decode(byte_array,decode_length);
               this.m_arrRoomSessions.push(stSeesion);
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

