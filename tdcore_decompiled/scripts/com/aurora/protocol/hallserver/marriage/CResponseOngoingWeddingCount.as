package com.aurora.protocol.hallserver.marriage
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.hallserver.CResponseBase;
   import flash.utils.ByteArray;
   
   public class CResponseOngoingWeddingCount extends CResponseBase
   {
      
      public var m_iUin:int;
      
      public var m_iWeddingCnt:int;
      
      public function CResponseOngoingWeddingCount()
      {
         super();
      }
      
      override public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         m_nResultID = a_2664.decode_int16(byte_array);
         var arrPropertyArray:Array = [];
         if(m_nResultID == 0)
         {
            arrPropertyArray.push(["m_iUin","int32"]);
            arrPropertyArray.push(["m_iWeddingCnt","int8"]);
         }
         return a_2664.a_2666(this,arrPropertyArray,byte_array,decode_length);
      }
   }
}

