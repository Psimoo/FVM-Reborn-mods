package com.aurora.protocol.hallserver.marriage
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.hallserver.CResponseBase;
   import flash.utils.ByteArray;
   
   public class CResponseGetWeddingList extends CResponseBase
   {
      
      public var m_iUin:int;
      
      public var m_iStartPos:int;
      
      public var m_iRequestNum:int;
      
      public var m_iTotalNum:int;
      
      public var m_iCurrentTimeStamp:int;
      
      public var m_arrWeddingInfoItems:Array;
      
      public function CResponseGetWeddingList()
      {
         super();
         this.m_arrWeddingInfoItems = [];
      }
      
      override public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var arrPropertyArray:Array = null;
         var i:int = 0;
         var stWeddingInfoItem:WeddingInfoItem = null;
         m_nResultID = a_2664.decode_int16(byte_array);
         if(m_nResultID == 0)
         {
            arrPropertyArray = [];
            arrPropertyArray.push(["m_iUin","int32"]);
            arrPropertyArray.push(["m_iStartPos","int16"]);
            arrPropertyArray.push(["m_iRequestNum","int16"]);
            arrPropertyArray.push(["m_iTotalNum","int16"]);
            arrPropertyArray.push(["m_iCurrentTimeStamp","int32"]);
            a_2664.a_2666(this,arrPropertyArray,byte_array,decode_length);
            this.m_arrWeddingInfoItems.length = 0;
            for(i = 0; i < this.m_iRequestNum; i++)
            {
               stWeddingInfoItem = new WeddingInfoItem();
               stWeddingInfoItem.decode(byte_array,decode_length);
               stWeddingInfoItem.m_iCurTimeStamp = this.m_iCurrentTimeStamp;
               this.m_arrWeddingInfoItems.push(stWeddingInfoItem);
            }
         }
         return true;
      }
   }
}

