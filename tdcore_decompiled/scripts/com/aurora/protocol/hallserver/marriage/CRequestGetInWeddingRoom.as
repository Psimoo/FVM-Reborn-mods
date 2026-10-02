package com.aurora.protocol.hallserver.marriage
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.hallserver.CRequestBase;
   import flash.utils.ByteArray;
   
   public class CRequestGetInWeddingRoom extends CRequestBase
   {
      
      public var m_iRoomID:int;
      
      public var m_strPassword:String;
      
      public function CRequestGetInWeddingRoom()
      {
         super();
      }
      
      override public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iUin","int32"],["m_iRoomID","int32"],["m_strPassword","string",2048]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
   }
}

