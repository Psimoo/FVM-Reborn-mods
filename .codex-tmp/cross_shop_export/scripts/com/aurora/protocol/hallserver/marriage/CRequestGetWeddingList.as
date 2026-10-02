package com.aurora.protocol.hallserver.marriage
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.hallserver.CRequestBase;
   import flash.utils.ByteArray;
   
   public class CRequestGetWeddingList extends CRequestBase
   {
      
      public var m_iStartPos:int;
      
      public var m_iRequestNum:int;
      
      public function CRequestGetWeddingList()
      {
         super();
      }
      
      override public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iUin","int32"],["m_iStartPos","int16"],["m_iRequestNum","int16"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
   }
}

